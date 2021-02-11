#
# Copyright (C) 2011-2018 Intel Corporation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#   * Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
#   * Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in
#     the documentation and/or other materials provided with the
#     distribution.
#   * Neither the name of Intel Corporation nor the names of its
#     contributors may be used to endorse or promote products derived
#     from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#

######## SGX SDK Settings ########

SGX_SDK ?= /opt/intel/sgxsdk
SGX_MODE ?= SIM
SGX_ARCH ?= x64
SGX_DEBUG = 1
#DEBUG=1
includedir=../include/
SGX_INCLUDEDIR=$(SGX_SDK)/include
Enclave_Config_File := Enclave.config.xml
Signed_Enclave_Name := enclave.signed.so
ifeq ($(shell getconf LONG_BIT), 32)
	SGX_ARCH := x86
else ifeq ($(findstring -m32, $(CXXFLAGS)), -m32)
	SGX_ARCH := x86
endif

ifeq ($(SGX_ARCH), x86)
	SGX_COMMON_CFLAGS := -m32
	SGX_LIBRARY_PATH := $(SGX_SDK)/lib
	SGX_ENCLAVE_SIGNER := $(SGX_SDK)/bin/x86/sgx_sign
	SGX_EDGER8R := $(SGX_SDK)/bin/x86/sgx_edger8r
else
	SGX_COMMON_CFLAGS := -m64
	SGX_LIBRARY_PATH := $(SGX_SDK)/lib64
	SGX_ENCLAVE_SIGNER := $(SGX_SDK)/bin/x64/sgx_sign
	SGX_EDGER8R := $(SGX_SDK)/bin/x64/sgx_edger8r
endif

ifeq ($(SGX_DEBUG), 1)
ifeq ($(SGX_PRERELEASE), 1)
$(error Cannot set SGX_DEBUG and SGX_PRERELEASE at the same time!!)
endif
endif

ifeq ($(SGX_DEBUG), 1)
        SGX_COMMON_CFLAGS += -O0 -g
else
        SGX_COMMON_CFLAGS += -O2
endif

######## App Settings ########

ifneq ($(SGX_MODE), HW)
	Urts_Library_Name := sgx_urts_sim
else
	Urts_Library_Name := sgx_urts
endif

App_Cpp_Files := App/App.cpp $(wildcard App/Edger8rSyntax/*.cpp) $(wildcard App/TrustedLibrary/*.cpp)
App_Include_Paths := -IInclude -IApp -I$(SGX_SDK)/include -Ilinux-sgx-sgx_2.1.3-g75dd558bdaff/common/inc

App_C_Flags := $(SGX_COMMON_CFLAGS) -fPIC -Wno-attributes $(App_Include_Paths)

# Three configuration modes - Debug, prerelease, release
#   Debug - Macro DEBUG enabled.
#   Prerelease - Macro NDEBUG and EDEBUG enabled.
#   Release - Macro NDEBUG enabled.
ifeq ($(SGX_DEBUG), 1)
        App_C_Flags += -DDEBUG -UNDEBUG -UEDEBUG
else ifeq ($(SGX_PRERELEASE), 1)
        App_C_Flags += -DNDEBUG -DEDEBUG -UDEBUG
else
        App_C_Flags += -DNDEBUG -UEDEBUG -UDEBUG
endif

App_Cpp_Flags := $(App_C_Flags) -std=c++11
App_Link_Flags := $(SGX_COMMON_CFLAGS) -L$(SGX_LIBRARY_PATH)  -L$(LIB_SFUZZ) -l$(Urts_Library_Name) -lpthread -lsgx_usgxfuzz -ldl -lrt -ldl 

ifneq ($(SGX_MODE), HW)
	App_Link_Flags += -lsgx_uae_service_sim
else
	App_Link_Flags += -lsgx_uae_service
endif

App_Cpp_Objects := $(App_Cpp_Files:.cpp=.o)

App_Name := app

.PHONY: all run

ifeq ($(Build_Mode), HW_RELEASE)
all: .config_$(Build_Mode)_$(SGX_ARCH) $(App_Name) $(Enclave_Name)
	@echo "The project has been built in release hardware mode."
	@echo "Please sign the $(Enclave_Name) first with your signing key before you run the $(App_Name) to launch and access the enclave."
	@echo "To sign the enclave use the command:"
	@echo "   $(SGX_ENCLAVE_SIGNER) sign -key <your key> -enclave $(Enclave_Name) -out <$(Signed_Enclave_Name)> -config $(Enclave_Config_File)"
	@echo "You can also sign the enclave using an external signing tool."
	@echo "To build the project in simulation mode set SGX_MODE=SIM. To build the project in prerelease mode set SGX_PRERELEASE=1 and SGX_MODE=HW."
else
all:  $(App_Name) $(Signed_Enclave_Name)
ifeq ($(Build_Mode), HW_DEBUG)
	@echo "The project has been built in debug hardware mode."
else ifeq ($(Build_Mode), SIM_DEBUG)
	@echo "The project has been built in debug simulation mode."
else ifeq ($(Build_Mode), HW_PRERELEASE)
	@echo "The project has been built in pre-release hardware mode."
else ifeq ($(Build_Mode), SIM_PRERELEASE)
	@echo "The project has been built in pre-release simulation mode."
else
	@echo "The project has been built in release simulation mode."
endif
endif

run: all
ifneq ($(Build_Mode), HW_RELEASE)
	@$(CURDIR)/$(App_Name)
	@echo "RUN  =>  $(App_Name) [$(SGX_MODE)|$(SGX_ARCH), OK]"
endif

######## App Objects ########

App_Include_Paths := -I$(includedir) -IApp -I$(SGX_SDK)/include
App_C_Flags := $(SGX_COMMON_CFLAGS) -fPIC -Wno-attributes $(App_Include_Paths)
App_Link_Flags := $(SGX_COMMON_CFLAGS) -L$(SGX_LIBRARY_PATH) -l$(Urts_Library_Name) -lpthread -L$(LIB_SFUZZ) -l$(Urts_Library_Name) -lpthread -lsgx_usgxfuzz -ldl -lrt -ldl

sabd_enclave_u.c: ../include/sabd_enclave.edl sabd_enclave_u.h | $(SGX_EDGER8R)
	echo "Generating Bridge C File"
	$(SGX_EDGER8R) --untrusted --untrusted-dir $(dir $@) --search-path $(SGX_INCLUDEDIR) --search-path ../include/ --search-path $(LIB_SFUZZ) $<
sabd_enclave_u.h: ../include/sabd_enclave.edl | $(SGX_EDGER8R)
	echo "Generating Bridge Header File"
	$(SGX_EDGER8R) --untrusted --untrusted-dir $(dir $@) --search-path $(SGX_INCLUDEDIR) --search-path $(includedir) --search-path $(LIB_SFUZZ) --header-only $<

app.c: template.cpp
	cog template.cpp > app.c

App_C_Files := app.c
App_C_Objects := $(App_C_Files:.c=.o)

sabd_enclave_u.o: sabd_enclave_u.c
	$(CC) $(App_C_Flags) -Ilinux-sgx-sgx_2.1.3-g75dd558bdaff/common/inc -c $< -o $@

%.o: %.c
	echo This
	$(CC) $(App_C_Flags) -c $< -o $@

$(Signed_Enclave_Name): ../libsabd_enclave.debug.so
	cp ../libsabd_enclave.debug.so ./enclave.signed.so
	#cp ../libsabd_enclave.unstripped.so ./enclave.signed.so
	#$(SGX_ENCLAVE_SIGNER) sign -key Enclave_private.pem -enclave ../libsabd_enclave.unstripped.so -out $@ -config ../libsabd_enclave.config.xml
	#@echo "SIGN =>  $@"

$(App_Name): sabd_enclave_u.o $(App_C_Objects)
	$(CXX) $^ -o $@ $(App_Link_Flags)
	echo "LINK =>  $@"

######## Enclave Objects ########

.PHONY: clean

clean:
	@rm -f .config_* $(App_Name) $(App_Cpp_Objects) sabd_enclave_u.* $(App_Name).o app.c

modeld:
	rm -rf ./work/ && ./parseBridge -i ./bridge.h -m /home/arslan/Documents/LBC/rustc/rust/src/llvm-project/llvm/lib/Transforms/IOSanitizer/dump -e /home/arslan/Documents/LBC/rustc/rust/src/llvm-project/llvm/lib/Transforms/IOSanitizer/endumpf -r ./raw.data -s /home/arslan/sgxsdk2/sgxsdk/SampleCode/pristine/ContactDiscoveryService/enclave/app/enclave.signed.so -t ./bridge_ret.dat

indentBridge:
	indent ./bridge.h --line-length185 -brs

model:
	./parseBridge -i ./bridge.h -m /home/arslan/Documents/LBC/rustc/rust/src/llvm-project/llvm/lib/Transforms/IOSanitizer/dump -e /home/arslan/Documents/LBC/rustc/rust/src/llvm-project/llvm/lib/Transforms/IOSanitizer/endumpf -s /home/arslan/sgxsdk2/sgxsdk/SampleCode/pristine/ContactDiscoveryService/enclave/app/enclave.signed.so > ./temp
