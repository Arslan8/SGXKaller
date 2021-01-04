#ifndef SABD_ENCLAVE_T_H__
#define SABD_ENCLAVE_T_H__

#include <stdint.h>
#include <wchar.h>
#include <stddef.h>
#include "sgx_edger8r.h" /* for sgx_ocall etc. */

#include "sabd.h"
#include "stdbool.h"
#include "sgx_quote.h"
#include "sgx_report.h"
#include "sgxsd.h"
#include "pthread.h"
#include "forward_decl.h"

#include <stdlib.h> /* for size_t */

#define SGX_CAST(type, item) ((type)(item))

#ifdef __cplusplus
extern "C" {
#endif

sgx_status_t sgxsd_enclave_node_init(const sgxsd_node_init_args_t* p_args);
sgx_status_t sgxsd_enclave_get_next_report(sgx_target_info_t qe_target_info, sgx_report_t* p_report);
sgx_status_t sgxsd_enclave_set_current_quote();
sgx_status_t sgxsd_enclave_negotiate_request(const sgxsd_request_negotiation_request_t* p_request, sgxsd_request_negotiation_response_t* p_response);
sgx_status_t sgxsd_enclave_server_start(const sgxsd_server_init_args_t* p_args, sgxsd_server_state_handle_t state_handle);
sgx_status_t sgxsd_enclave_server_call(const sgxsd_server_handle_call_args_t* p_args, const sgxsd_msg_header_t* msg_header, uint8_t* msg_data, size_t msg_size, sgxsd_msg_tag_t msg_tag, sgxsd_server_state_handle_t state_handle);
sgx_status_t sgxsd_enclave_server_stop(const sgxsd_server_terminate_args_t* p_args, sgxsd_server_state_handle_t state_handle);

sgx_status_t SGX_CDECL sgxsd_ocall_reply(sgx_status_t* retval, const sgxsd_msg_header_t* reply_header, const uint8_t* reply_data, size_t reply_data_size, sgxsd_msg_tag_t msg_tag);
sgx_status_t SGX_CDECL libsfuzz_ocall_getenv(char** retval, const char* name);
sgx_status_t SGX_CDECL libsfuzz_ocall_open(int* retval, const char* pathname, int flags);
sgx_status_t SGX_CDECL libsfuzz_ocall_close(int* retval, int fd);
sgx_status_t SGX_CDECL libsfuzz_ocall_pthread_attr_init(int* retval, pthread_attr_t* attr);
sgx_status_t SGX_CDECL libsfuzz_ocall_pthread_attr_destroy(int* retval, pthread_attr_t* attr);
sgx_status_t SGX_CDECL libsfuzz_ocall_isatty(int* retval, int fd);
sgx_status_t SGX_CDECL libsfuzz_ocall_pipe(int* retval, int pipefd[2]);
sgx_status_t SGX_CDECL libsfuzz_ocall_usleep(int* retval, unsigned long long usec);
sgx_status_t SGX_CDECL libsfuzz_ocall_sleep(int* retval, unsigned int seconds);
sgx_status_t SGX_CDECL libsfuzz_ocall_execv(int* retval, const char* pathname, int argv_num, char* argv1, char* argv2, char* argv3);
sgx_status_t SGX_CDECL libsfuzz_ocall_pthread_attr_setstacksize(int* retval, pthread_attr_t* attr, size_t stacksize);
sgx_status_t SGX_CDECL libsfuzz_ocall_pthread_attr_getstacksize(int* retval, pthread_attr_t* attr, size_t* stacksize);
sgx_status_t SGX_CDECL libsfuzz_ocall_getuid(unsigned long long* retval);
sgx_status_t SGX_CDECL libsfuzz_ocall_sysconf(long int* retval, int name);
sgx_status_t SGX_CDECL libsfuzz_ocall_shm_open(int* retval, const char* name, int oflag, unsigned long long mode);
sgx_status_t SGX_CDECL libsfuzz_ocall_shm_unlink(int* retval, const char* name);
sgx_status_t SGX_CDECL libsfuzz_ocall_syslog_chk(int priority, int flag, const char* format);
sgx_status_t SGX_CDECL libsfuzz_ocall_snprintf_chk(int* retval, char* str, size_t maxlen, int flag, size_t stlen, const char* format);
sgx_status_t SGX_CDECL libsfuzz_ocall_getrusage(int* retval, int who, struct rusage* usage);
sgx_status_t SGX_CDECL libsfuzz_ocall_sched_yield(int* retval);
sgx_status_t SGX_CDECL libsfuzz_ocall_pthread_getattr_np(int* retval, pthread_t thread, pthread_attr_t* attr);
sgx_status_t SGX_CDECL libsfuzz_ocall_pthread_getspecific(void** retval, pthread_key_t key);
sgx_status_t SGX_CDECL libsfuzz_ocall_pthread_setspecific(int* retval, pthread_key_t key, const void* value);
sgx_status_t SGX_CDECL libsfuzz_ocall_pthread_key_create(int* retval, pthread_key_t* key, int nodestructor);
sgx_status_t SGX_CDECL libsfuzz_libsfuzz_ocall_readlink(size_t* retval, const char* pathname, char* buf, size_t bufsiz);
sgx_status_t SGX_CDECL libsfuzz_ocall_pthread_self(pthread_t* retval);
sgx_status_t SGX_CDECL libsfuzz_ocall_fxstat(int* retval, int vers, int fd, struct stat* buf);
sgx_status_t SGX_CDECL libsfuzz_ocall_sigaltstack(int* retval, unsigned long long ss, unsigned long long old_ss);
sgx_status_t SGX_CDECL libsfuzz_ocall_getrlimit(int* retval, int resource, struct rlimit* rlim);
sgx_status_t SGX_CDECL libsfuzz_ocall_setrlimit(int* retval, int resource, const struct rlimit* rlim);
sgx_status_t SGX_CDECL libsfuzz_ocall_dlsym(void** retval, unsigned long long handle, const char* symbol);
sgx_status_t SGX_CDECL libsfuzz_ocall_waitpid(int* retval, int pid, int* stat_loc, int options);
sgx_status_t SGX_CDECL libsfuzz_ocall_write(size_t* retval, int fd, const void* buf, size_t count);
sgx_status_t SGX_CDECL libsfuzz_ocall_read(size_t* retval, int fd, void* buf, size_t count);
sgx_status_t SGX_CDECL libsfuzz_ocall_exit(int stat);
sgx_status_t SGX_CDECL libsfuzz_ocall_calloc(void** retval, size_t items, size_t size);
sgx_status_t SGX_CDECL libsfuzz_ocall_abort();

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif
