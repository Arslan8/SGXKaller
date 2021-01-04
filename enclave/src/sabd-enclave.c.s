	.file	"sabd-enclave.c"
# GNU C11 (Ubuntu 7.5.0-3ubuntu1~18.04) version 7.5.0 (x86_64-linux-gnu)
#	compiled by GNU C version 7.5.0, GMP version 6.1.2, MPFR version 4.0.1, MPC version 1.1.0, isl version isl-0.19-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -I include -I include/bearssl
# -I linux-sgx-sgx_2.1.3-g75dd558bdaff/common/inc
# -I linux-sgx-sgx_2.1.3-g75dd558bdaff/common/inc/tlibc
# -imultiarch x86_64-linux-gnu -D _DEFAULT_SOURCE -D __AFL_COMPILER=1
# -D FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION=1 src/sabd-enclave.c -m64
# -march=skylake -auxbase-strip src/sabd-enclave.c.s -g -ggdb -g -ggdb0 -g
# -O0 -O0 -O3 -Wall -Werror=all -Wextra -Wno-unused-parameter
# -Wno-missing-field-initializers -std=c11 -fstack-protector
# -fvisibility=hidden -fpie -fverbose-asm -funroll-loops -Wformat-security
# options enabled:  -faggressive-loop-optimizations -falign-labels
# -fasynchronous-unwind-tables -fauto-inc-dec -fbranch-count-reg
# -fcaller-saves -fchkp-check-incomplete-type -fchkp-check-read
# -fchkp-check-write -fchkp-instrument-calls -fchkp-narrow-bounds
# -fchkp-optimize -fchkp-store-bounds -fchkp-use-static-bounds
# -fchkp-use-static-const-bounds -fchkp-use-wrappers -fcode-hoisting
# -fcombine-stack-adjustments -fcommon -fcompare-elim -fcprop-registers
# -fcrossjumping -fcse-follow-jumps -fdefer-pop
# -fdelete-null-pointer-checks -fdevirtualize -fdevirtualize-speculatively
# -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
# -fexpensive-optimizations -fforward-propagate -ffp-int-builtin-inexact
# -ffunction-cse -fgcse -fgcse-after-reload -fgcse-lm -fgnu-runtime
# -fgnu-unique -fguess-branch-probability -fhoist-adjacent-loads -fident
# -fif-conversion -fif-conversion2 -findirect-inlining -finline
# -finline-atomics -finline-functions -finline-functions-called-once
# -finline-small-functions -fipa-bit-cp -fipa-cp -fipa-cp-clone -fipa-icf
# -fipa-icf-functions -fipa-icf-variables -fipa-profile -fipa-pure-const
# -fipa-ra -fipa-reference -fipa-sra -fipa-vrp -fira-hoist-pressure
# -fira-share-save-slots -fira-share-spill-slots
# -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -flra-remat -flto-odr-type-merging
# -fmath-errno -fmerge-constants -fmerge-debug-strings
# -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
# -foptimize-strlen -fpartial-inlining -fpeel-loops -fpeephole -fpeephole2
# -fpic -fpie -fplt -fpredictive-commoning -fprefetch-loop-arrays -free
# -freg-struct-return -frename-registers -freorder-blocks
# -freorder-functions -frerun-cse-after-loop
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-fusion -fschedule-insns2
# -fsemantic-interposition -fshow-column -fshrink-wrap
# -fshrink-wrap-separate -fsigned-zeros -fsplit-ivs-in-unroller
# -fsplit-loops -fsplit-paths -fsplit-wide-types -fssa-backprop
# -fssa-phiopt -fstack-protector -fstdarg-opt -fstore-merging
# -fstrict-aliasing -fstrict-overflow -fstrict-volatile-bitfields
# -fsync-libcalls -fthread-jumps -ftoplevel-reorder -ftrapping-math
# -ftree-bit-ccp -ftree-builtin-call-dce -ftree-ccp -ftree-ch
# -ftree-coalesce-vars -ftree-copy-prop -ftree-cselim -ftree-dce
# -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-distribute-patterns -ftree-loop-if-convert -ftree-loop-im
# -ftree-loop-ivcanon -ftree-loop-optimize -ftree-loop-vectorize
# -ftree-parallelize-loops= -ftree-partial-pre -ftree-phiprop -ftree-pre
# -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink
# -ftree-slp-vectorize -ftree-slsr -ftree-sra -ftree-switch-conversion
# -ftree-tail-merge -ftree-ter -ftree-vrp -funit-at-a-time -funroll-loops
# -funswitch-loops -funwind-tables -fvar-tracking
# -fvar-tracking-assignments -fverbose-asm -fweb -fzero-initialized-in-bss
# -m128bit-long-double -m64 -m80387 -madx -maes -malign-stringops -mavx
# -mavx2 -mbmi -mbmi2 -mclflushopt -mcx16 -mf16c -mfancy-math-387 -mfma
# -mfp-ret-in-387 -mfsgsbase -mfxsr -mglibc -mhle -mieee-fp
# -mlong-double-80 -mlzcnt -mmmx -mmovbe -mpclmul -mpopcnt -mprfchw
# -mpush-args -mrdrnd -mrdseed -mred-zone -msahf -msse -msse2 -msse3 -msse4
# -msse4.1 -msse4.2 -mssse3 -mstv -mtls-direct-seg-refs -mvzeroupper
# -mxsave -mxsavec -mxsaveopt -mxsaves

	.text
.Ltext0:
	.p2align 4,,15
	.globl	sabd_lookup_hash
	.hidden	sabd_lookup_hash
	.type	sabd_lookup_hash, @function
sabd_lookup_hash:
.LFB5015:
	.file 1 "src/sabd-enclave.c"
	.loc 1 106 0
	.cfi_startproc
.LVL0:
	leaq	8(%rsp), %r10	#,
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp	#,
	pushq	-8(%r10)	#
	pushq	%rbp	#
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp	#,
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%r10	#
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx	#
	subq	$288, %rsp	#,
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
# src/sabd-enclave.c:110:   uint32_t hash_table_order = likely(ab_jid_count > 1)? _bit_scan_reverse(ab_jid_count - 1) + 1 : 0;
	.loc 1 110 0
	cmpl	$1, %ecx	#, ab_jid_count
	jbe	.L122	#,
.LVL1:
# src/sabd-enclave.c:110:   uint32_t hash_table_order = likely(ab_jid_count > 1)? _bit_scan_reverse(ab_jid_count - 1) + 1 : 0;
	.loc 1 110 0 is_stmt 0 discriminator 1
	leal	-1(%rcx), %ebx	#, tmp554
.LVL2:
.LBB873:
.LBB874:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/ia32intrin.h:41:   return __builtin_ia32_bsrsi (__X);
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/7/include/ia32intrin.h"
	.loc 2 41 0 is_stmt 1 discriminator 1
	bsrl	%ebx, %ebx	# tmp554, tmp553
.LVL3:
.LBE874:
.LBE873:
# src/sabd-enclave.c:110:   uint32_t hash_table_order = likely(ab_jid_count > 1)? _bit_scan_reverse(ab_jid_count - 1) + 1 : 0;
	.loc 1 110 0 discriminator 1
	addl	$1, %ebx	#, iftmp.0_98
.LVL4:
# src/sabd-enclave.c:116:   if (unlikely(hash_table_order > SABD_MAX_HASH_TABLE_ORDER)) {
	.loc 1 116 0 discriminator 1
	cmpl	$13, %ebx	#, iftmp.0_98
	ja	.L33	#,
	movl	$12, %r9d	#, tmp558
	movl	$1, %eax	#, tmp556
	shlx	%ebx, %r9d, %r11d	# iftmp.0_98, tmp558, tmp559
	salq	$3, %r11	#, _730
	shlx	%ebx, %eax, %r15d	# iftmp.0_98, tmp556, _727
	movq	%r11, -288(%rbp)	# _730, %sfp
.LVL5:
.L4:
	movq	%rsi, -312(%rbp)	# in_jid_count, %sfp
# src/sabd-enclave.c:127:   jid_t *hashed_ab_jids = memalign(CACHE_LINE_SIZE, hashed_ab_jids_size);
	.loc 1 127 0
	movq	-288(%rbp), %rsi	# %sfp,
.LVL6:
	movq	%rdi, -304(%rbp)	# in_jids, %sfp
.LVL7:
	movl	$64, %edi	#,
.LVL8:
	movq	%r8, -328(%rbp)	# in_ab_jids_result, %sfp
	movl	%ecx, -112(%rbp)	# ab_jid_count, %sfp
	movq	%rdx, -80(%rbp)	# ab_jids, %sfp
	call	memalign@PLT	#
.LVL9:
	movq	%rax, %r12	#, hashed_ab_jids
.LVL10:
# src/sabd-enclave.c:128:   if (unlikely(hashed_ab_jids == NULL)) {
	.loc 1 128 0
	testq	%rax, %rax	# hashed_ab_jids
	je	.L34	#,
# src/sabd-enclave.c:132:   size_t in_hashed_ab_jids_result_bits_size = hash_table_slot_count * sizeof(uint16_t);
	.loc 1 132 0
	movl	%r15d, %r13d	# _727, _727
# src/sabd-enclave.c:133:   volatile uint16_t *in_hashed_ab_jids_result_bits = memalign(CACHE_LINE_SIZE, in_hashed_ab_jids_result_bits_size);
	.loc 1 133 0
	movl	$64, %edi	#,
# src/sabd-enclave.c:132:   size_t in_hashed_ab_jids_result_bits_size = hash_table_slot_count * sizeof(uint16_t);
	.loc 1 132 0
	addq	%r13, %r13	# in_hashed_ab_jids_result_bits_size
.LVL11:
# src/sabd-enclave.c:133:   volatile uint16_t *in_hashed_ab_jids_result_bits = memalign(CACHE_LINE_SIZE, in_hashed_ab_jids_result_bits_size);
	.loc 1 133 0
	movq	%r13, %rsi	# in_hashed_ab_jids_result_bits_size,
	call	memalign@PLT	#
.LVL12:
# src/sabd-enclave.c:135:   if (unlikely(in_hashed_ab_jids_result_bits == NULL)) {
	.loc 1 135 0
	movq	-80(%rbp), %rcx	# %sfp, ab_jids
	movl	-112(%rbp), %esi	# %sfp, ab_jid_count
	testq	%rax, %rax	# in_hashed_ab_jids_result_bits
# src/sabd-enclave.c:133:   volatile uint16_t *in_hashed_ab_jids_result_bits = memalign(CACHE_LINE_SIZE, in_hashed_ab_jids_result_bits_size);
	.loc 1 133 0
	movq	%rax, -280(%rbp)	# in_hashed_ab_jids_result_bits, %sfp
.LVL13:
# src/sabd-enclave.c:135:   if (unlikely(in_hashed_ab_jids_result_bits == NULL)) {
	.loc 1 135 0
	je	.L123	#,
	movq	%rax, %rdi	# in_hashed_ab_jids_result_bits,
	movl	%esi, -80(%rbp)	# ab_jid_count, %sfp
.LVL14:
# src/sabd-enclave.c:139:   memset_s(in_hashed_ab_jids_result_bits, in_hashed_ab_jids_result_bits_size, 0, in_hashed_ab_jids_result_bits_size);
	.loc 1 139 0
	xorl	%edx, %edx	#
	movq	%r13, %rsi	# in_hashed_ab_jids_result_bits_size,
	movq	%rcx, -112(%rbp)	# ab_jids, %sfp
.LVL15:
	movq	%r13, %rcx	# in_hashed_ab_jids_result_bits_size,
.LBB875:
.LBB876:
.LBB877:
.LBB878:
.LBB879:
.LBB880:
.LBB881:
.LBB882:
# src/sabd-enclave.c:101:   return _mm_cvtsi128_si32(hash) & ((1 << hash_table_order) - 1);
	.loc 1 101 0
	movl	$1, %r14d	#, tmp561
.LBE882:
.LBE881:
.LBE880:
.LBE879:
.LBE878:
.LBE877:
.LBE876:
.LBE875:
# src/sabd-enclave.c:139:   memset_s(in_hashed_ab_jids_result_bits, in_hashed_ab_jids_result_bits_size, 0, in_hashed_ab_jids_result_bits_size);
	.loc 1 139 0
	call	memset_s@PLT	#
.LVL16:
# src/sabd-enclave.c:142:   memset_s(in_ab_jids_result, ab_jid_count, 0xFF, ab_jid_count);
	.loc 1 142 0
	movl	-80(%rbp), %esi	# %sfp,
	movl	$255, %edx	#,
	movq	-328(%rbp), %rdi	# %sfp,
	movq	%rsi, %rcx	# _22,
	call	memset_s@PLT	#
.LVL17:
# src/sabd-enclave.c:145:   memset_s(hashed_ab_jids, hashed_ab_jids_size, 0, hashed_ab_jids_size);
	.loc 1 145 0
	movq	-288(%rbp), %rsi	# %sfp, _730
	movq	%r12, %rdi	# hashed_ab_jids,
	xorl	%edx, %edx	#
	movq	%rsi, %rcx	# _730,
	call	memset_s@PLT	#
.LVL18:
	movq	-112(%rbp), %r10	# %sfp, ab_jids
.LBB1231:
.LBB1228:
.LBB971:
.LBB967:
.LBB956:
.LBB954:
.LBB916:
.LBB910:
# src/sabd-enclave.c:101:   return _mm_cvtsi128_si32(hash) & ((1 << hash_table_order) - 1);
	.loc 1 101 0
	shlx	%ebx, %r14d, %edi	# iftmp.0_98, tmp561, _339
	movl	-80(%rbp), %r13d	# %sfp, ab_jid_count
.LVL19:
	vmovapd	.LC6(%rip), %ymm13	#, tmp907
	movq	%r12, %r9	# hashed_ab_jids, hashed_ab_jids
	leal	-1(%rdi), %r14d	#, _361
	movl	$128, -292(%rbp)	#, %sfp
	movq	%r10, -320(%rbp)	# ivtmp.105, %sfp
	leal	-1(%r13), %ebx	#, tmp563
.LBE910:
.LBE916:
.LBE954:
.LBE956:
# src/sabd-enclave.c:171:       register __m256i chain_block_masks[] = {
	.loc 1 171 0
	vmovdqa	.LC0(%rip), %ymm15	#, chain_block_masks$1
	leaq	-64(%rbp), %r8	#, tmp898
	vmovdqa	.LC1(%rip), %ymm14	#, chain_block_masks$2
	vmovdqa	.LC2(%rip), %ymm12	#, chain_block_masks$0
	leaq	8(%r10,%rbx,8), %rbx	#, _697
	movq	%r10, %r12	# ab_jids, ab_jids
.LVL20:
.L6:
.LBE967:
.LBE971:
.LBB972:
.LBB973:
.LBB974:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/immintrin.h:208:   return __builtin_ia32_rdrand64_step (__P);
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/7/include/immintrin.h"
	.loc 3 208 0
	rdrand	%rax	# tmp629
	movl	$1, %r11d	#, tmp630
	movq	%rax, (%r8)	# tmp629,
	cmovc	%r11d, %eax	# tmp629,, tmp630, _831
.LVL21:
.LBE974:
.LBE973:
# src/sabd-enclave.c:155:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	.loc 1 155 0
	testl	%eax, %eax	# _831
	je	.L16	#,
.LVL22:
.LBB984:
.LBB985:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/immintrin.h:208:   return __builtin_ia32_rdrand64_step (__P);
	.loc 3 208 0
	rdrand	%rdx	# tmp633
	movq	%rdx, 8(%r8)	# tmp633,
	cmovc	%r11d, %edx	# tmp633,, tmp630, _838
.LVL23:
.LBE985:
.LBE984:
# src/sabd-enclave.c:155:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	.loc 1 155 0
	testl	%edx, %edx	# _838
	je	.L16	#,
.L8:
.LVL24:
.LBE972:
.LBB1013:
.LBB1014:
.LBB1015:
.LBB1016:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:592:   return __extension__ (__m128i)(__v2di){ __q0, __q1 };
	.file 4 "/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h"
	.loc 4 592 0
	vmovq	-56(%rbp), %xmm6	# MEM[(uint64_t *)&hash_salt_64 + 8B], tmp1092
	movq	%r9, %r10	# hashed_ab_jids, ivtmp.118
.LBE1016:
.LBE1015:
.LBE1014:
.LBE1013:
.LBB1223:
# src/sabd-enclave.c:167:     for (hash_slot_idx_t hash_slot_idx = 0; likely(hash_slot_idx < hash_table_slot_count); hash_slot_idx++) {
	.loc 1 167 0
	xorl	%edi, %edi	# hash_slot_idx
.LBE1223:
# src/sabd-enclave.c:166:     bool any_hash_slots_overflowed = false;
	.loc 1 166 0
	xorl	%r11d, %r11d	# any_hash_slots_overflowed
.LBB1224:
.LBB1222:
.LBB1019:
.LBB1017:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:592:   return __extension__ (__m128i)(__v2di){ __q0, __q1 };
	.loc 4 592 0
	vpinsrq	$1, -64(%rbp), %xmm6, %xmm3	# MEM[(uint64_t *)&hash_salt_64], tmp1092, tmp772
.LBE1017:
.LBE1019:
.LBB1020:
.LBB1021:
.LBB1022:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm3, %xmm0	#, tmp1094, tmp777
.LBE1022:
.LBE1021:
.LBE1020:
.LBB1037:
.LBB1038:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/wmmintrin.h:89:   return (__m128i) __builtin_ia32_aeskeygenassist128 ((__v2di)__X, __C);
	.file 5 "/usr/lib/gcc/x86_64-linux-gnu/7/include/wmmintrin.h"
	.loc 5 89 0
	vaeskeygenassist	$1, %xmm3, %xmm2	#, tmp772, tmp775
.LBE1038:
.LBE1037:
.LBB1039:
.LBB1018:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:592:   return __extension__ (__m128i)(__v2di){ __q0, __q1 };
	.loc 4 592 0
	vmovaps	%xmm3, -272(%rbp)	# tmp772, %sfp
.LVL25:
.LBE1018:
.LBE1039:
.LBB1040:
.LBB1023:
.LBB1024:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm3, %xmm0, %xmm4	# tmp772, tmp777, _384
.LVL26:
.LBE1024:
.LBE1023:
.LBB1025:
.LBB1026:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1422:   return (__m128i)__builtin_ia32_pshufd ((__v4si)__A, __mask);
	.loc 4 1422 0
	vpshufd	$255, %xmm2, %xmm9	#, tmp775, tmp783
.LBE1026:
.LBE1025:
.LBB1027:
.LBB1028:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm4, %xmm1	#, _384, tmp779
.LVL27:
.LBE1028:
.LBE1027:
.LBB1029:
.LBB1030:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm1, %xmm4, %xmm5	# tmp779, _384, _388
.LVL28:
.LBE1030:
.LBE1029:
.LBB1031:
.LBB1032:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm5, %xmm8	#, _388, tmp781
.LVL29:
.LBE1032:
.LBE1031:
.LBB1033:
.LBB1034:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm9, %xmm8, %xmm10	# tmp783, tmp781, tmp785
	vpxor	%xmm5, %xmm10, %xmm11	# _388, tmp785, _397
.LBE1034:
.LBE1033:
.LBE1040:
.LBB1041:
.LBB1042:
.LBB1043:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm11, %xmm2	#, tmp1098, tmp788
.LBE1043:
.LBE1042:
.LBE1041:
.LBB1058:
.LBB1059:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/wmmintrin.h:89:   return (__m128i) __builtin_ia32_aeskeygenassist128 ((__v2di)__X, __C);
	.loc 5 89 0
	vaeskeygenassist	$2, %xmm11, %xmm3	#, _397, tmp786
.LVL30:
.LBE1059:
.LBE1058:
.LBB1060:
.LBB1036:
.LBB1035:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vmovaps	%xmm11, -80(%rbp)	# _397, %sfp
.LVL31:
.LBE1035:
.LBE1036:
.LBE1060:
.LBB1061:
.LBB1044:
.LBB1045:
	vpxor	%xmm11, %xmm2, %xmm7	# _397, tmp788, _401
.LVL32:
.LBE1045:
.LBE1044:
.LBB1046:
.LBB1047:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1422:   return (__m128i)__builtin_ia32_pshufd ((__v4si)__A, __mask);
	.loc 4 1422 0
	vpshufd	$255, %xmm3, %xmm5	#, tmp786, tmp794
.LBE1047:
.LBE1046:
.LBB1048:
.LBB1049:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm7, %xmm0	#, _401, tmp790
.LVL33:
.LBE1049:
.LBE1048:
.LBB1050:
.LBB1051:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm0, %xmm7, %xmm4	# tmp790, _401, _405
.LVL34:
.LBE1051:
.LBE1050:
.LBB1052:
.LBB1053:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm4, %xmm1	#, _405, tmp792
.LVL35:
.LBE1053:
.LBE1052:
.LBB1054:
.LBB1055:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm5, %xmm1, %xmm8	# tmp794, tmp792, tmp796
	vpxor	%xmm4, %xmm8, %xmm9	# _405, tmp796, _414
.LBE1055:
.LBE1054:
.LBE1061:
.LBB1062:
.LBB1063:
.LBB1064:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm9, %xmm3	#, tmp1102, tmp799
.LBE1064:
.LBE1063:
.LBE1062:
.LBB1079:
.LBB1080:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/wmmintrin.h:89:   return (__m128i) __builtin_ia32_aeskeygenassist128 ((__v2di)__X, __C);
	.loc 5 89 0
	vaeskeygenassist	$4, %xmm9, %xmm10	#, _414, tmp797
.LBE1080:
.LBE1079:
.LBB1081:
.LBB1057:
.LBB1056:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vmovaps	%xmm9, -112(%rbp)	# _414, %sfp
.LVL36:
.LBE1056:
.LBE1057:
.LBE1081:
.LBB1082:
.LBB1065:
.LBB1066:
	vpxor	%xmm9, %xmm3, %xmm6	# _414, tmp799, _418
.LVL37:
.LBE1066:
.LBE1065:
.LBB1067:
.LBB1068:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1422:   return (__m128i)__builtin_ia32_pshufd ((__v4si)__A, __mask);
	.loc 4 1422 0
	vpshufd	$255, %xmm10, %xmm4	#, tmp797, tmp805
.LBE1068:
.LBE1067:
.LBB1069:
.LBB1070:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm6, %xmm2	#, _418, tmp801
.LVL38:
.LBE1070:
.LBE1069:
.LBB1071:
.LBB1072:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm2, %xmm6, %xmm7	# tmp801, _418, _422
.LVL39:
.LBE1072:
.LBE1071:
.LBB1073:
.LBB1074:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm7, %xmm0	#, _422, tmp803
.LVL40:
.LBE1074:
.LBE1073:
.LBB1075:
.LBB1076:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm4, %xmm0, %xmm1	# tmp805, tmp803, tmp807
	vpxor	%xmm7, %xmm1, %xmm5	# _422, tmp807, _431
.LBE1076:
.LBE1075:
.LBE1082:
.LBB1083:
.LBB1084:
.LBB1085:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm5, %xmm10	#, tmp1106, tmp810
.LBE1085:
.LBE1084:
.LBE1083:
.LBB1100:
.LBB1101:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/wmmintrin.h:89:   return (__m128i) __builtin_ia32_aeskeygenassist128 ((__v2di)__X, __C);
	.loc 5 89 0
	vaeskeygenassist	$8, %xmm5, %xmm8	#, _431, tmp808
.LBE1101:
.LBE1100:
.LBB1102:
.LBB1078:
.LBB1077:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vmovaps	%xmm5, -144(%rbp)	# _431, %sfp
.LVL41:
.LBE1077:
.LBE1078:
.LBE1102:
.LBB1103:
.LBB1086:
.LBB1087:
	vpxor	%xmm5, %xmm10, %xmm11	# _431, tmp810, _435
.LVL42:
.LBE1087:
.LBE1086:
.LBB1088:
.LBB1089:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1422:   return (__m128i)__builtin_ia32_pshufd ((__v4si)__A, __mask);
	.loc 4 1422 0
	vpshufd	$255, %xmm8, %xmm2	#, tmp808, tmp816
.LBE1089:
.LBE1088:
.LBB1090:
.LBB1091:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm11, %xmm3	#, _435, tmp812
.LVL43:
.LBE1091:
.LBE1090:
.LBB1092:
.LBB1093:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm3, %xmm11, %xmm6	# tmp812, _435, _439
.LVL44:
.LBE1093:
.LBE1092:
.LBB1094:
.LBB1095:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm6, %xmm7	#, _439, tmp814
.LVL45:
.LBE1095:
.LBE1094:
.LBB1096:
.LBB1097:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm2, %xmm7, %xmm0	# tmp816, tmp814, tmp818
	vpxor	%xmm6, %xmm0, %xmm4	# _439, tmp818, _448
.LBE1097:
.LBE1096:
.LBE1103:
.LBB1104:
.LBB1105:
.LBB1106:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm4, %xmm8	#, tmp1110, tmp821
.LBE1106:
.LBE1105:
.LBE1104:
.LBB1121:
.LBB1122:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/wmmintrin.h:89:   return (__m128i) __builtin_ia32_aeskeygenassist128 ((__v2di)__X, __C);
	.loc 5 89 0
	vaeskeygenassist	$16, %xmm4, %xmm5	#, _448, tmp819
.LBE1122:
.LBE1121:
.LBB1123:
.LBB1099:
.LBB1098:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vmovaps	%xmm4, -176(%rbp)	# _448, %sfp
.LVL46:
.LBE1098:
.LBE1099:
.LBE1123:
.LBB1124:
.LBB1107:
.LBB1108:
	vpxor	%xmm4, %xmm8, %xmm9	# _448, tmp821, _452
.LVL47:
.LBE1108:
.LBE1107:
.LBB1109:
.LBB1110:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1422:   return (__m128i)__builtin_ia32_pshufd ((__v4si)__A, __mask);
	.loc 4 1422 0
	vpshufd	$255, %xmm5, %xmm6	#, tmp819, tmp827
.LBE1110:
.LBE1109:
.LBB1111:
.LBB1112:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm9, %xmm10	#, _452, tmp823
.LVL48:
.LBE1112:
.LBE1111:
.LBB1113:
.LBB1114:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm10, %xmm9, %xmm11	# tmp823, _452, _456
.LVL49:
.LBE1114:
.LBE1113:
.LBB1115:
.LBB1116:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm11, %xmm3	#, _456, tmp825
.LVL50:
.LBE1116:
.LBE1115:
.LBB1117:
.LBB1118:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm6, %xmm3, %xmm7	# tmp827, tmp825, tmp829
	vpxor	%xmm11, %xmm7, %xmm4	# _456, tmp829, _465
.LBE1118:
.LBE1117:
.LBE1124:
.LBB1125:
.LBB1126:
.LBB1127:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm4, %xmm5	#, tmp1114, tmp832
.LBE1127:
.LBE1126:
.LBE1125:
.LBB1142:
.LBB1143:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/wmmintrin.h:89:   return (__m128i) __builtin_ia32_aeskeygenassist128 ((__v2di)__X, __C);
	.loc 5 89 0
	vaeskeygenassist	$32, %xmm4, %xmm2	#, _465, tmp830
.LBE1143:
.LBE1142:
.LBB1144:
.LBB1120:
.LBB1119:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vmovaps	%xmm4, -208(%rbp)	# _465, %sfp
.LVL51:
.LBE1119:
.LBE1120:
.LBE1144:
.LBB1145:
.LBB1128:
.LBB1129:
	vpxor	%xmm4, %xmm5, %xmm8	# _465, tmp832, _469
.LVL52:
.LBE1129:
.LBE1128:
.LBB1130:
.LBB1131:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1422:   return (__m128i)__builtin_ia32_pshufd ((__v4si)__A, __mask);
	.loc 4 1422 0
	vpshufd	$255, %xmm2, %xmm11	#, tmp830, tmp838
.LBE1131:
.LBE1130:
.LBB1132:
.LBB1133:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm8, %xmm1	#, _469, tmp834
.LVL53:
.LBE1133:
.LBE1132:
.LBB1134:
.LBB1135:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm1, %xmm8, %xmm9	# tmp834, _469, _473
.LVL54:
.LBE1135:
.LBE1134:
.LBB1136:
.LBB1137:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm9, %xmm10	#, _473, tmp836
.LVL55:
.LBE1137:
.LBE1136:
.LBB1138:
.LBB1139:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm11, %xmm10, %xmm3	# tmp838, tmp836, tmp840
	vpxor	%xmm9, %xmm3, %xmm6	# _473, tmp840, _482
.LBE1139:
.LBE1138:
.LBE1145:
.LBB1146:
.LBB1147:
.LBB1148:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm6, %xmm2	#, tmp1118, tmp843
.LBE1148:
.LBE1147:
.LBE1146:
.LBB1163:
.LBB1164:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/wmmintrin.h:89:   return (__m128i) __builtin_ia32_aeskeygenassist128 ((__v2di)__X, __C);
	.loc 5 89 0
	vaeskeygenassist	$64, %xmm6, %xmm4	#, _482, tmp841
.LBE1164:
.LBE1163:
.LBB1165:
.LBB1141:
.LBB1140:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vmovaps	%xmm6, -224(%rbp)	# _482, %sfp
.LVL56:
.LBE1140:
.LBE1141:
.LBE1165:
.LBB1166:
.LBB1149:
.LBB1150:
	vpxor	%xmm6, %xmm2, %xmm0	# _482, tmp843, _486
.LVL57:
.LBE1150:
.LBE1149:
.LBB1151:
.LBB1152:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1422:   return (__m128i)__builtin_ia32_pshufd ((__v4si)__A, __mask);
	.loc 4 1422 0
	vpshufd	$255, %xmm4, %xmm9	#, tmp841, tmp849
.LBE1152:
.LBE1151:
.LBB1153:
.LBB1154:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm0, %xmm5	#, _486, tmp845
.LVL58:
.LBE1154:
.LBE1153:
.LBB1155:
.LBB1156:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm5, %xmm0, %xmm8	# tmp845, _486, _490
.LVL59:
.LBE1156:
.LBE1155:
.LBB1157:
.LBB1158:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm8, %xmm1	#, _490, tmp847
.LVL60:
.LBE1158:
.LBE1157:
.LBB1159:
.LBB1160:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm9, %xmm1, %xmm10	# tmp849, tmp847, tmp851
	vpxor	%xmm8, %xmm10, %xmm11	# _490, tmp851, _499
.LBE1160:
.LBE1159:
.LBE1166:
.LBB1167:
.LBB1168:
.LBB1169:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm11, %xmm4	#, tmp1122, tmp854
.LBE1169:
.LBE1168:
.LBE1167:
.LBB1182:
.LBB1183:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/wmmintrin.h:89:   return (__m128i) __builtin_ia32_aeskeygenassist128 ((__v2di)__X, __C);
	.loc 5 89 0
	vaeskeygenassist	$128, %xmm11, %xmm3	#, _499, tmp852
.LBE1183:
.LBE1182:
.LBB1184:
.LBB1162:
.LBB1161:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vmovaps	%xmm11, -240(%rbp)	# _499, %sfp
.LVL61:
.LBE1161:
.LBE1162:
.LBE1184:
.LBB1185:
.LBB1170:
.LBB1171:
	vpxor	%xmm11, %xmm4, %xmm7	# _499, tmp854, _503
.LVL62:
.LBE1171:
.LBE1170:
.LBB1172:
.LBB1173:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1422:   return (__m128i)__builtin_ia32_pshufd ((__v4si)__A, __mask);
	.loc 4 1422 0
	vpshufd	$255, %xmm3, %xmm8	#, tmp852, tmp860
.LBE1173:
.LBE1172:
.LBB1174:
.LBB1175:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm7, %xmm2	#, _503, tmp856
.LVL63:
.LBE1175:
.LBE1174:
.LBB1176:
.LBB1177:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm2, %xmm7, %xmm0	# tmp856, _503, _507
.LVL64:
.LBE1177:
.LBE1176:
.LBB1178:
.LBB1179:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm0, %xmm5	#, _507, tmp858
.LVL65:
.LBE1179:
.LBE1178:
.LBB1180:
.LBB1181:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm8, %xmm5, %xmm1	# tmp860, tmp858, tmp862
	vpxor	%xmm0, %xmm1, %xmm10	# _507, tmp862, _516
.LVL66:
.LBE1181:
.LBE1180:
.LBE1185:
.LBB1186:
.LBB1187:
.LBB1188:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm10, %xmm11	#, _516, tmp865
.LBE1188:
.LBE1187:
.LBE1186:
.LBB1201:
.LBB1202:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/wmmintrin.h:89:   return (__m128i) __builtin_ia32_aeskeygenassist128 ((__v2di)__X, __C);
	.loc 5 89 0
	vaeskeygenassist	$27, %xmm10, %xmm9	#, _516, tmp863
.LVL67:
.LBE1202:
.LBE1201:
.LBB1203:
.LBB1189:
.LBB1190:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm11, %xmm10, %xmm3	# tmp865, _516, _520
.LVL68:
.LBE1190:
.LBE1189:
.LBB1191:
.LBB1192:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1422:   return (__m128i)__builtin_ia32_pshufd ((__v4si)__A, __mask);
	.loc 4 1422 0
	vpshufd	$255, %xmm9, %xmm2	#, tmp863, tmp871
.LBE1192:
.LBE1191:
.LBB1193:
.LBB1194:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm3, %xmm6	#, _520, tmp867
.LVL69:
.LBE1194:
.LBE1193:
.LBB1195:
.LBB1196:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm6, %xmm3, %xmm4	# tmp867, _520, _524
.LVL70:
.LBE1196:
.LBE1195:
.LBB1197:
.LBB1198:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm4, %xmm7	#, _524, tmp869
.LVL71:
.LBE1198:
.LBE1197:
.LBB1199:
.LBB1200:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm2, %xmm7, %xmm0	# tmp871, tmp869, tmp873
	vpxor	%xmm4, %xmm0, %xmm11	# _524, tmp873, _533
.LVL72:
.LBE1200:
.LBE1199:
.LBE1203:
.LBB1204:
.LBB1205:
.LBB1206:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm11, %xmm8	#, _533, tmp876
.LBE1206:
.LBE1205:
.LBE1204:
.LBB1219:
.LBB1220:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/wmmintrin.h:89:   return (__m128i) __builtin_ia32_aeskeygenassist128 ((__v2di)__X, __C);
	.loc 5 89 0
	vaeskeygenassist	$54, %xmm11, %xmm5	#, _533, tmp874
.LVL73:
.LBE1220:
.LBE1219:
.LBB1221:
.LBB1207:
.LBB1208:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm8, %xmm11, %xmm9	# tmp876, _533, _537
.LVL74:
.LBE1208:
.LBE1207:
.LBB1209:
.LBB1210:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1422:   return (__m128i)__builtin_ia32_pshufd ((__v4si)__A, __mask);
	.loc 4 1422 0
	vpshufd	$255, %xmm5, %xmm4	#, tmp874, tmp882
.LBE1210:
.LBE1209:
.LBB1211:
.LBB1212:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm9, %xmm1	#, _537, tmp878
.LVL75:
.LBE1212:
.LBE1211:
.LBB1213:
.LBB1214:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm1, %xmm9, %xmm3	# tmp878, _537, _541
.LVL76:
.LBE1214:
.LBE1213:
.LBB1215:
.LBB1216:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	.loc 4 1193 0
	vpslldq	$4, %xmm3, %xmm6	#, _541, tmp880
.LVL77:
.LBE1216:
.LBE1215:
.LBB1217:
.LBB1218:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0
	vpxor	%xmm4, %xmm6, %xmm7	# tmp882, tmp880, tmp884
	vpxor	%xmm3, %xmm7, %xmm2	# _541, tmp884, _550
	vmovaps	%xmm2, -256(%rbp)	# _550, %sfp
.LVL78:
	.p2align 4,,10
	.p2align 3
.L31:
.LBE1218:
.LBE1217:
.LBE1221:
.LBE1222:
.LBE1224:
.LBB1225:
.LBB968:
.LBB957:
# src/sabd-enclave.c:177:       for (hash_slot_idx_t ab_jid_idx = 0; likely(ab_jid_idx < ab_jid_count); ab_jid_idx++) {
	.loc 1 177 0
	testl	%r13d, %r13d	# ab_jid_count
	je	.L124	#,
.LBE957:
# src/sabd-enclave.c:170:       register __m256i chain_blocks[CHAIN_BLOCK_COUNT] = {0};
	.loc 1 170 0
	vpxor	%xmm7, %xmm7, %xmm7	# chain_blocks$2
.LBB958:
# src/sabd-enclave.c:177:       for (hash_slot_idx_t ab_jid_idx = 0; likely(ab_jid_idx < ab_jid_count); ab_jid_idx++) {
	.loc 1 177 0
	movq	%r12, %rcx	# ab_jids, ivtmp.114
.LBE958:
# src/sabd-enclave.c:171:       register __m256i chain_block_masks[] = {
	.loc 1 171 0
	vmovdqa	%ymm15, %ymm3	# chain_block_masks$1, chain_block_masks$1
# src/sabd-enclave.c:176:       hash_slot_idx_t chain_idx = 0;
	.loc 1 176 0
	xorl	%esi, %esi	# chain_idx
# src/sabd-enclave.c:171:       register __m256i chain_block_masks[] = {
	.loc 1 171 0
	vmovdqa	%ymm14, %ymm4	# chain_block_masks$2, chain_block_masks$2
	vmovdqa	%ymm12, %ymm2	# chain_block_masks$0, chain_block_masks$0
# src/sabd-enclave.c:170:       register __m256i chain_blocks[CHAIN_BLOCK_COUNT] = {0};
	.loc 1 170 0
	vmovdqa	%ymm7, %ymm6	#, chain_blocks$0
	vmovdqa	%ymm7, %ymm5	# tmp27, chain_blocks$1
.LVL79:
	.p2align 4,,10
	.p2align 3
.L10:
.LBB959:
.LBB955:
.LBB917:
.LBB911:
.LBB883:
.LBB884:
.LBB885:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:592:   return __extension__ (__m128i)(__v2di){ __q0, __q1 };
	.loc 4 592 0 discriminator 3
	vmovq	(%rcx), %xmm0	# MEM[base: _703, offset: 0B], tmp571
.LBE885:
.LBE884:
.LBE883:
.LBB886:
.LBB887:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0 discriminator 3
	vpxor	-272(%rbp), %xmm0, %xmm9	# %sfp, tmp571, tmp572
.LBE887:
.LBE886:
.LBE911:
.LBE917:
.LBB918:
.LBB919:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1137:   return __builtin_ia32_vtestzpd256 ((__v4df)__M, (__v4df)__V);
	.file 6 "/usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h"
	.loc 6 1137 0 discriminator 3
	xorl	%edx, %edx	# tmp593
.LBE919:
.LBE918:
.LBB922:
.LBB923:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1344:   return __extension__ (__m256i)(__v4di){ __A, __A, __A, __A };
	.loc 6 1344 0 discriminator 3
	vpbroadcastq	(%rcx), %ymm1	# MEM[base: _703, offset: 0B], tmp570
.LVL80:
.LBE923:
.LBE922:
.LBB924:
.LBB912:
.LBB888:
.LBB889:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/wmmintrin.h:63:   return (__m128i) __builtin_ia32_aesenc128 ((__v2di)__X, (__v2di)__Y);
	.loc 5 63 0 discriminator 3
	vaesenc	-80(%rbp), %xmm9, %xmm8	# %sfp, tmp572, tmp573
.LVL81:
.LBE889:
.LBE888:
.LBB890:
.LBB891:
	vaesenc	-112(%rbp), %xmm8, %xmm0	# %sfp, tmp573, tmp574
.LVL82:
.LBE891:
.LBE890:
.LBB892:
.LBB893:
	vaesenc	-144(%rbp), %xmm0, %xmm9	# %sfp, tmp574, tmp575
.LVL83:
.LBE893:
.LBE892:
.LBB894:
.LBB895:
	vaesenc	-176(%rbp), %xmm9, %xmm8	# %sfp, tmp575, tmp576
.LVL84:
.LBE895:
.LBE894:
.LBB896:
.LBB897:
	vaesenc	-208(%rbp), %xmm8, %xmm0	# %sfp, tmp576, tmp577
.LVL85:
.LBE897:
.LBE896:
.LBB898:
.LBB899:
	vaesenc	-224(%rbp), %xmm0, %xmm9	# %sfp, tmp577, tmp578
.LVL86:
.LBE899:
.LBE898:
.LBB900:
.LBB901:
	vaesenc	-240(%rbp), %xmm9, %xmm8	# %sfp, tmp578, tmp579
.LVL87:
.LBE901:
.LBE900:
.LBB902:
.LBB903:
	vaesenc	%xmm10, %xmm8, %xmm0	# _516, tmp579, tmp580
.LVL88:
.LBE903:
.LBE902:
.LBB904:
.LBB905:
	vaesenc	%xmm11, %xmm0, %xmm9	# _533, tmp580, tmp581
.LVL89:
.LBE905:
.LBE904:
.LBE912:
.LBE924:
.LBB925:
.LBB926:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avx2intrin.h:254:   return (__m256i) ((__v4di)__A == (__v4di)__B);
	.file 7 "/usr/lib/gcc/x86_64-linux-gnu/7/include/avx2intrin.h"
	.loc 7 254 0 discriminator 3
	vpcmpeqq	%ymm1, %ymm6, %ymm0	# tmp570, chain_blocks$0, tmp588
.LBE926:
.LBE925:
.LBB927:
.LBB913:
.LBB906:
.LBB907:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/wmmintrin.h:71:   return (__m128i) __builtin_ia32_aesenclast128 ((__v2di)__X, (__v2di)__Y);
	.loc 5 71 0 discriminator 3
	vaesenclast	-256(%rbp), %xmm9, %xmm8	# %sfp, tmp581, tmp582
.LVL90:
.LBE907:
.LBE906:
.LBE913:
.LBE927:
.LBB928:
.LBB929:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avx2intrin.h:254:   return (__m256i) ((__v4di)__A == (__v4di)__B);
	.loc 7 254 0 discriminator 3
	vpcmpeqq	%ymm1, %ymm5, %ymm9	# tmp570, chain_blocks$1, tmp586
.LBE929:
.LBE928:
.LBB930:
.LBB914:
.LBB908:
.LBB909:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:226:   return __builtin_ia32_vec_ext_v4si ((__v4si)__A, 0);
	.loc 4 226 0 discriminator 3
	vmovd	%xmm8, %eax	# tmp582, tmp584
.LVL91:
.LBE909:
.LBE908:
.LBE914:
.LBE930:
.LBB931:
.LBB932:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avx2intrin.h:254:   return (__m256i) ((__v4di)__A == (__v4di)__B);
	.loc 7 254 0 discriminator 3
	vpcmpeqq	%ymm1, %ymm7, %ymm8	# tmp570, chain_blocks$2, tmp591
.LBE932:
.LBE931:
.LBB933:
.LBB934:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avx2intrin.h:576:   return (__m256i) ((__v4du)__A | (__v4du)__B);
	.loc 7 576 0 discriminator 3
	vpor	%ymm0, %ymm9, %ymm9	# tmp588, tmp586, tmp589
.LBE934:
.LBE933:
# src/sabd-enclave.c:193:         bool jid_not_in_chain = _mm256_testz_pd((__m256d) chain_eq, (__m256d) chain_eq);
	.loc 1 193 0 discriminator 3
	vpor	%ymm8, %ymm9, %ymm0	# tmp591, tmp589, _49
.LVL92:
.LBB935:
.LBB936:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:221:   return (__m256d) __builtin_ia32_blendvpd256 ((__v4df)__X,
	.loc 6 221 0 discriminator 3
	vblendvpd	%ymm3, %ymm1, %ymm5, %ymm9	# chain_block_masks$1, _53, chain_blocks$1, _265
.LBE936:
.LBE935:
.LBB937:
.LBB938:
	vblendvpd	%ymm2, %ymm1, %ymm6, %ymm8	# chain_block_masks$0, _53, chain_blocks$0, _264
.LBE938:
.LBE937:
.LBB939:
.LBB920:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1137:   return __builtin_ia32_vtestzpd256 ((__v4df)__M, (__v4df)__V);
	.loc 6 1137 0 discriminator 3
	vtestpd	%ymm0, %ymm0	# _49, _49
.LBE920:
.LBE939:
.LBB940:
.LBB941:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:221:   return (__m256d) __builtin_ia32_blendvpd256 ((__v4df)__X,
	.loc 6 221 0 discriminator 3
	vblendvpd	%ymm4, %ymm1, %ymm7, %ymm1	# chain_block_masks$2, _53, chain_blocks$2, _236
.LBE941:
.LBE940:
# src/sabd-enclave.c:199:         chain_blocks[0] = (__m256i) _mm256_blendv_pd((__m256d) chain_blocks[0], (__m256d) ab_jid_block, (__m256d) chain_block_masks[0]);
	.loc 1 199 0 discriminator 3
	vmovdqa	%ymm8, %ymm6	# _264, chain_blocks$0
.LVL93:
# src/sabd-enclave.c:201:         chain_blocks[2] = (__m256i) _mm256_blendv_pd((__m256d) chain_blocks[2], (__m256d) ab_jid_block, (__m256d) chain_block_masks[2]);
	.loc 1 201 0 discriminator 3
	vmovdqa	%ymm1, %ymm7	# _236, chain_blocks$2
.LBB942:
.LBB921:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1137:   return __builtin_ia32_vtestzpd256 ((__v4df)__M, (__v4df)__V);
	.loc 6 1137 0 discriminator 3
	sete	%dl	#, tmp593
.LVL94:
.LBE921:
.LBE942:
.LBB943:
.LBB915:
# src/sabd-enclave.c:101:   return _mm_cvtsi128_si32(hash) & ((1 << hash_table_order) - 1);
	.loc 1 101 0 discriminator 3
	andl	%r14d, %eax	# _361, tmp594
.LVL95:
	addq	$8, %rcx	#, ivtmp.114
.LVL96:
.LBE915:
.LBE943:
# src/sabd-enclave.c:184:           (((uint64_t) (((int64_t) (((uint64_t) ab_jid_hash_slot_idx) ^ ((uint64_t) hash_slot_idx))) - 1))
	.loc 1 184 0 discriminator 3
	xorl	%edi, %eax	# hash_slot_idx, tmp596
	subq	$1, %rax	#, tmp597
# src/sabd-enclave.c:185:            >> (sizeof(hash_slot_idx) * 8)) & 1;
	.loc 1 185 0 discriminator 3
	shrq	$32, %rax	#, tmp598
# src/sabd-enclave.c:196:         uint64_t should_insert_jid = hash_slot_matches & jid_not_in_chain;
	.loc 1 196 0 discriminator 3
	andq	%rdx, %rax	# tmp593, should_insert_jid
.LVL97:
.LBB944:
.LBB945:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1344:   return __extension__ (__m256i)(__v4di){ __A, __A, __A, __A };
	.loc 6 1344 0 discriminator 3
	vmovq	%rax, %xmm5	# should_insert_jid, should_insert_jid
.LBE945:
.LBE944:
# src/sabd-enclave.c:197:         chain_idx += should_insert_jid;
	.loc 1 197 0 discriminator 3
	addl	%eax, %esi	# should_insert_jid, chain_idx
.LVL98:
.LBB947:
.LBB946:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1344:   return __extension__ (__m256i)(__v4di){ __A, __A, __A, __A };
	.loc 6 1344 0 discriminator 3
	vpbroadcastq	%xmm5, %ymm0	# should_insert_jid, tmp613
.LVL99:
.LBE946:
.LBE947:
# src/sabd-enclave.c:200:         chain_blocks[1] = (__m256i) _mm256_blendv_pd((__m256d) chain_blocks[1], (__m256d) ab_jid_block, (__m256d) chain_block_masks[1]);
	.loc 1 200 0 discriminator 3
	vmovdqa	%ymm9, %ymm5	# _265, chain_blocks$1
.LBB948:
.LBB949:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avx2intrin.h:128:   return (__m256i) ((__v4du)__A + (__v4du)__B);
	.loc 7 128 0 discriminator 3
	vpaddq	%ymm0, %ymm2, %ymm2	# tmp613, chain_block_masks$0, chain_block_masks$0
.LVL100:
.LBE949:
.LBE948:
.LBB950:
.LBB951:
	vpaddq	%ymm0, %ymm4, %ymm4	# tmp613, chain_block_masks$2, chain_block_masks$2
.LBE951:
.LBE950:
.LBB952:
.LBB953:
	vpaddq	%ymm0, %ymm3, %ymm3	# tmp613, chain_block_masks$1, chain_block_masks$1
.LBE953:
.LBE952:
.LBE955:
# src/sabd-enclave.c:177:       for (hash_slot_idx_t ab_jid_idx = 0; likely(ab_jid_idx < ab_jid_count); ab_jid_idx++) {
	.loc 1 177 0 discriminator 3
	cmpq	%rcx, %rbx	# ivtmp.114, _697
	jne	.L10	#,
	cmpl	$12, %esi	#, chain_idx
	seta	%cl	#, tmp615
.LVL101:
	orl	%ecx, %r11d	# tmp615, any_hash_slots_overflowed
.LVL102:
.L12:
.LBE959:
.LBB960:
.LBB961:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:221:   return (__m256d) __builtin_ia32_blendvpd256 ((__v4df)__X,
	.loc 6 221 0
	vblendvpd	%ymm2, %ymm13, %ymm8, %ymm2	# _815, tmp907, _264, tmp616
.LVL103:
.LBE961:
.LBE960:
.LBB962:
.LBB963:
	vblendvpd	%ymm3, %ymm13, %ymm9, %ymm3	# _817, tmp907, _265, tmp620
.LVL104:
.LBE963:
.LBE962:
.LBE968:
# src/sabd-enclave.c:167:     for (hash_slot_idx_t hash_slot_idx = 0; likely(hash_slot_idx < hash_table_slot_count); hash_slot_idx++) {
	.loc 1 167 0
	addl	$1, %edi	#, hash_slot_idx
.LVL105:
	addq	$96, %r10	#, ivtmp.118
.LBB969:
.LBB964:
.LBB965:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:221:   return (__m256d) __builtin_ia32_blendvpd256 ((__v4df)__X,
	.loc 6 221 0
	vblendvpd	%ymm4, %ymm13, %ymm1, %ymm4	# _819, tmp907, _236, tmp624
.LVL106:
.LBE965:
.LBE964:
# src/sabd-enclave.c:215:       p_chain_blocks[0] = chain_blocks[0];
	.loc 1 215 0
	vmovdqa	%ymm2, -96(%r10)	# tmp616, MEM[base: _693, offset: 0B]
# src/sabd-enclave.c:216:       p_chain_blocks[1] = chain_blocks[1];
	.loc 1 216 0
	vmovdqa	%ymm3, -64(%r10)	# tmp620, MEM[base: _693, offset: 32B]
# src/sabd-enclave.c:217:       p_chain_blocks[2] = chain_blocks[2];
	.loc 1 217 0
	vmovdqa	%ymm4, -32(%r10)	# tmp624, MEM[base: _693, offset: 64B]
.LVL107:
.LBE969:
# src/sabd-enclave.c:167:     for (hash_slot_idx_t hash_slot_idx = 0; likely(hash_slot_idx < hash_table_slot_count); hash_slot_idx++) {
	.loc 1 167 0
	cmpl	%r15d, %edi	# _727, hash_slot_idx
	jne	.L31	#,
.LVL108:
.LBE1225:
# src/sabd-enclave.c:223:     if (unlikely(!hash_table_constructed)) {
	.loc 1 223 0
	testb	%r11b, %r11b	# any_hash_slots_overflowed
	jne	.L125	#,
	movq	-304(%rbp), %rdi	# %sfp, ivtmp.110
.LVL109:
	movq	-312(%rbp), %r10	# %sfp, in_jid_count
	movq	%r9, %r12	# hashed_ab_jids, hashed_ab_jids
	movl	%r13d, %r8d	# ab_jid_count, ab_jid_count
	movq	-320(%rbp), %r13	# %sfp, ivtmp.105
.LVL110:
	leaq	(%rdi,%r10,8), %r9	#, _707
.LBE1228:
.LBE1231:
.LBB1232:
# src/sabd-enclave.c:238:   for (size_t in_jid_idx = 0; likely(in_jid_idx < in_jid_count); in_jid_idx++) {
	.loc 1 238 0
	testq	%r10, %r10	# in_jid_count
	je	.L15	#,
	movq	-280(%rbp), %rsi	# %sfp, in_hashed_ab_jids_result_bits
	vmovdqa	-80(%rbp), %xmm13	# %sfp, _397
	vmovdqa	-112(%rbp), %xmm14	# %sfp, _414
	vmovdqa	-144(%rbp), %xmm15	# %sfp, _431
	vmovdqa	-176(%rbp), %xmm5	# %sfp, _448
	vmovdqa	-208(%rbp), %xmm6	# %sfp, _465
	vmovdqa	-224(%rbp), %xmm7	# %sfp, _482
	vmovdqa	-240(%rbp), %xmm8	# %sfp, _499
	vmovdqa	-256(%rbp), %xmm9	# %sfp, _550
	vmovdqa	-272(%rbp), %xmm12	# %sfp, tmp772
.LVL111:
.L26:
.LBB1233:
.LBB1234:
.LBB1235:
.LBB1236:
.LBB1237:
.LBB1238:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:592:   return __extension__ (__m128i)(__v2di){ __q0, __q1 };
	.loc 4 592 0 discriminator 3
	vmovq	(%rdi), %xmm0	# MEM[base: _710, offset: 0B], tmp696
.LBE1238:
.LBE1237:
.LBE1236:
.LBE1235:
.LBE1234:
.LBB1264:
.LBB1265:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1344:   return __extension__ (__m256i)(__v4di){ __A, __A, __A, __A };
	.loc 6 1344 0 discriminator 3
	vpbroadcastq	(%rdi), %ymm1	# MEM[base: _710, offset: 0B], tmp695
.LVL112:
	addq	$8, %rdi	#, ivtmp.110
.LVL113:
.LBE1265:
.LBE1264:
.LBB1266:
.LBB1263:
.LBB1239:
.LBB1240:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	.loc 4 1293 0 discriminator 3
	vpxor	%xmm12, %xmm0, %xmm2	# tmp772, tmp696, tmp697
.LBE1240:
.LBE1239:
.LBB1241:
.LBB1242:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/wmmintrin.h:63:   return (__m128i) __builtin_ia32_aesenc128 ((__v2di)__X, (__v2di)__Y);
	.loc 5 63 0 discriminator 3
	vaesenc	%xmm13, %xmm2, %xmm3	# _397, tmp697, tmp698
.LVL114:
.LBE1242:
.LBE1241:
.LBB1243:
.LBB1244:
	vaesenc	%xmm14, %xmm3, %xmm4	# _414, tmp698, tmp699
.LVL115:
.LBE1244:
.LBE1243:
.LBB1245:
.LBB1246:
	vaesenc	%xmm15, %xmm4, %xmm0	# _431, tmp699, tmp700
.LVL116:
.LBE1246:
.LBE1245:
.LBB1247:
.LBB1248:
	vaesenc	%xmm5, %xmm0, %xmm2	# _448, tmp700, tmp701
.LVL117:
.LBE1248:
.LBE1247:
.LBB1249:
.LBB1250:
	vaesenc	%xmm6, %xmm2, %xmm3	# _465, tmp701, tmp702
.LVL118:
.LBE1250:
.LBE1249:
.LBB1251:
.LBB1252:
	vaesenc	%xmm7, %xmm3, %xmm4	# _482, tmp702, tmp703
.LVL119:
.LBE1252:
.LBE1251:
.LBB1253:
.LBB1254:
	vaesenc	%xmm8, %xmm4, %xmm0	# _499, tmp703, tmp704
.LVL120:
.LBE1254:
.LBE1253:
.LBB1255:
.LBB1256:
	vaesenc	%xmm10, %xmm0, %xmm2	# _516, tmp704, tmp705
.LVL121:
.LBE1256:
.LBE1255:
.LBB1257:
.LBB1258:
	vaesenc	%xmm11, %xmm2, %xmm3	# _533, tmp705, tmp706
.LVL122:
.LBE1258:
.LBE1257:
.LBB1259:
.LBB1260:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/wmmintrin.h:71:   return (__m128i) __builtin_ia32_aesenclast128 ((__v2di)__X, (__v2di)__Y);
	.loc 5 71 0 discriminator 3
	vaesenclast	%xmm9, %xmm3, %xmm4	# _550, tmp706, tmp707
.LVL123:
.LBE1260:
.LBE1259:
.LBB1261:
.LBB1262:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h:226:   return __builtin_ia32_vec_ext_v4si ((__v4si)__A, 0);
	.loc 4 226 0 discriminator 3
	vmovd	%xmm4, %eax	# tmp707, tmp709
.LBE1262:
.LBE1261:
# src/sabd-enclave.c:101:   return _mm_cvtsi128_si32(hash) & ((1 << hash_table_order) - 1);
	.loc 1 101 0 discriminator 3
	andl	%r14d, %eax	# _361, _362
.LVL124:
.LBE1263:
.LBE1266:
# src/sabd-enclave.c:246:     __m256i *chain_blocks = (__m256i *) &hashed_ab_jids[in_jid_hash_slot_idx * chain_length];
	.loc 1 246 0 discriminator 3
	leal	(%rax,%rax,2), %r11d	#, tmp712
# src/sabd-enclave.c:253:     volatile uint16_t *chain_result_bits = &in_hashed_ab_jids_result_bits[in_jid_hash_slot_idx];
	.loc 1 253 0 discriminator 3
	cltq
# src/sabd-enclave.c:246:     __m256i *chain_blocks = (__m256i *) &hashed_ab_jids[in_jid_hash_slot_idx * chain_length];
	.loc 1 246 0 discriminator 3
	sall	$2, %r11d	#,
	leaq	(%r12,%r11,8), %rcx	#, chain_blocks
.LVL125:
# src/sabd-enclave.c:253:     volatile uint16_t *chain_result_bits = &in_hashed_ab_jids_result_bits[in_jid_hash_slot_idx];
	.loc 1 253 0 discriminator 3
	leaq	(%rsi,%rax,2), %r11	#, chain_result_bits
.LBB1267:
.LBB1268:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avx2intrin.h:254:   return (__m256i) ((__v4di)__A == (__v4di)__B);
	.loc 7 254 0 discriminator 3
	vmovdqa	(%rcx), %ymm0	# *chain_blocks_297, *chain_blocks_297
.LBE1268:
.LBE1267:
.LBB1269:
.LBB1270:
	vmovdqa	32(%rcx), %ymm3	# MEM[(__m256i * {ref-all})chain_blocks_297 + 32B], MEM[(__m256i * {ref-all})chain_blocks_297 + 32B]
.LBE1270:
.LBE1269:
# src/sabd-enclave.c:254:     *chain_result_bits = (*chain_result_bits ^ 0xF000) | chain_eq_mask;
	.loc 1 254 0 discriminator 3
	movzwl	(%r11), %eax	# *chain_result_bits_302, _124
.LBB1271:
.LBB1272:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1191:   return __builtin_ia32_movmskpd256 ((__v4df)__A);
	.loc 6 1191 0 discriminator 3
	vpcmpeqq	%ymm1, %ymm0, %ymm2	# tmp695, *chain_blocks_297, tmp720
.LBE1272:
.LBE1271:
.LBB1274:
.LBB1275:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avx2intrin.h:254:   return (__m256i) ((__v4di)__A == (__v4di)__B);
	.loc 7 254 0 discriminator 3
	vmovdqa	64(%rcx), %ymm0	# MEM[(__m256i * {ref-all})chain_blocks_297 + 64B], MEM[(__m256i * {ref-all})chain_blocks_297 + 64B]
.LBE1275:
.LBE1274:
.LBB1276:
.LBB1277:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1191:   return __builtin_ia32_movmskpd256 ((__v4df)__A);
	.loc 6 1191 0 discriminator 3
	vpcmpeqq	%ymm1, %ymm3, %ymm4	# tmp695, MEM[(__m256i * {ref-all})chain_blocks_297 + 32B], tmp725
.LBE1277:
.LBE1276:
# src/sabd-enclave.c:254:     *chain_result_bits = (*chain_result_bits ^ 0xF000) | chain_eq_mask;
	.loc 1 254 0 discriminator 3
	xorw	$-4096, %ax	#, tmp737
.LBB1279:
.LBB1280:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1191:   return __builtin_ia32_movmskpd256 ((__v4df)__A);
	.loc 6 1191 0 discriminator 3
	vpcmpeqq	%ymm1, %ymm0, %ymm1	# tmp695, MEM[(__m256i * {ref-all})chain_blocks_297 + 64B], tmp730
.LBE1280:
.LBE1279:
.LBB1282:
.LBB1278:
	vmovmskpd	%ymm4, %edx	# tmp725, tmp721
.LBE1278:
.LBE1282:
.LBB1283:
.LBB1273:
	vmovmskpd	%ymm2, %r10d	# tmp720, tmp716
.LBE1273:
.LBE1283:
# src/sabd-enclave.c:249:       (_mm256_movemask_pd((__m256d) _mm256_cmpeq_epi64(in_jid_block, chain_blocks[1])) << 4) |
	.loc 1 249 0 discriminator 3
	sall	$4, %edx	#, tmp733
.LBB1284:
.LBB1281:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1191:   return __builtin_ia32_movmskpd256 ((__v4df)__A);
	.loc 6 1191 0 discriminator 3
	vmovmskpd	%ymm1, %ecx	# tmp730, tmp726
.LVL126:
.LBE1281:
.LBE1284:
# src/sabd-enclave.c:250:       (_mm256_movemask_pd((__m256d) _mm256_cmpeq_epi64(in_jid_block, chain_blocks[2])) << 8);
	.loc 1 250 0 discriminator 3
	sall	$8, %ecx	#, tmp734
# src/sabd-enclave.c:249:       (_mm256_movemask_pd((__m256d) _mm256_cmpeq_epi64(in_jid_block, chain_blocks[1])) << 4) |
	.loc 1 249 0 discriminator 3
	orl	%ecx, %edx	# tmp734, tmp735
	orl	%edx, %r10d	# tmp735, chain_eq_mask
# src/sabd-enclave.c:254:     *chain_result_bits = (*chain_result_bits ^ 0xF000) | chain_eq_mask;
	.loc 1 254 0 discriminator 3
	orl	%r10d, %eax	# chain_eq_mask, _126
	movw	%ax, (%r11)	# _126, *chain_result_bits_302
.LVL127:
.LBE1233:
# src/sabd-enclave.c:238:   for (size_t in_jid_idx = 0; likely(in_jid_idx < in_jid_count); in_jid_idx++) {
	.loc 1 238 0 discriminator 3
	cmpq	%rdi, %r9	# ivtmp.110, _707
	jne	.L26	#,
.LVL128:
.L15:
	leal	-1(%r15), %r11d	#,
	leaq	96(%r12), %r14	#, tmp896
.LBE1232:
.LBB1285:
# src/sabd-enclave.c:258:   for (hash_slot_idx_t ab_jid_idx = 0; likely(ab_jid_idx < ab_jid_count); ab_jid_idx++) {
	.loc 1 258 0
	testl	%r8d, %r8d	# ab_jid_count
	je	.L27	#,
	leal	-1(%r15), %r14d	#,
	movq	-328(%rbp), %r11	# %sfp, ivtmp.106
	movq	-280(%rbp), %r8	# %sfp, in_hashed_ab_jids_result_bits
	movq	%r14, %r15	#,
.LVL129:
	leaq	(%r14,%r14,2), %r9	#, tmp742
	leaq	96(%r12), %r14	#, tmp896
	movl	%r15d, -80(%rbp)	# tmp894, %sfp
.LVL130:
	salq	$5, %r9	#, tmp743
	addq	%r14, %r9	# tmp896, _835
.LVL131:
	.p2align 4,,10
	.p2align 3
.L29:
	movq	%r9, %rsi	# _835, tmp927
.LBB1286:
# src/sabd-enclave.c:261:     uint16_t ab_jid_result = 0;
	.loc 1 261 0
	xorl	%eax, %eax	# ab_jid_result
.LBB1287:
.LBB1288:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1344:   return __extension__ (__m256i)(__v4di){ __A, __A, __A, __A };
	.loc 6 1344 0
	vpbroadcastq	0(%r13), %ymm10	# MEM[base: _720, offset: 0B], _315
.LVL132:
	movq	%r8, %rdi	# in_hashed_ab_jids_result_bits, ivtmp.100
	subq	%r12, %rsi	# hashed_ab_jids, tmp927
	movq	%r12, %rcx	# hashed_ab_jids, ivtmp.99
	andl	$32, %esi	#, tmp927
	je	.L28	#,
.LVL133:
.LBE1288:
.LBE1287:
.LBB1289:
.LBB1290:
.LBB1291:
.LBB1292:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avx2intrin.h:254:   return (__m256i) ((__v4di)__A == (__v4di)__B);
	.loc 7 254 0
	vmovdqa	32(%r12), %ymm14	# MEM[base: _770, offset: 32B], MEM[base: _770, offset: 32B]
.LBE1292:
.LBE1291:
.LBB1295:
.LBB1296:
	vmovdqa	64(%r12), %ymm5	# MEM[base: _770, offset: 64B], MEM[base: _770, offset: 64B]
	leaq	96(%r12), %rcx	#, ivtmp.99
.LVL134:
.LBE1296:
.LBE1295:
.LBB1299:
.LBB1300:
	vmovdqa	(%r12), %ymm11	# MEM[base: _770, offset: 0B], MEM[base: _770, offset: 0B]
.LBE1300:
.LBE1299:
# src/sabd-enclave.c:269:       uint16_t chain_result = in_hashed_ab_jids_result_bits[hash_slot_idx] & 0xFFF;
	.loc 1 269 0
	movzwl	(%r8), %edi	# *_154, _155
.LBB1303:
.LBB1304:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1191:   return __builtin_ia32_movmskpd256 ((__v4df)__A);
	.loc 6 1191 0
	vpcmpeqq	%ymm10, %ymm14, %ymm15	# _315, MEM[base: _770, offset: 32B], tmp979
.LBE1304:
.LBE1303:
.LBB1310:
.LBB1311:
	vpcmpeqq	%ymm10, %ymm5, %ymm6	# _315, MEM[base: _770, offset: 64B], tmp983
.LBE1311:
.LBE1310:
.LBB1317:
.LBB1318:
	vpcmpeqq	%ymm10, %ymm11, %ymm13	# _315, MEM[base: _770, offset: 0B], tmp975
.LBE1318:
.LBE1317:
# src/sabd-enclave.c:269:       uint16_t chain_result = in_hashed_ab_jids_result_bits[hash_slot_idx] & 0xFFF;
	.loc 1 269 0
	andw	$4095, %di	#, chain_result
.LBB1323:
.LBB1305:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1191:   return __builtin_ia32_movmskpd256 ((__v4df)__A);
	.loc 6 1191 0
	vmovmskpd	%ymm15, %eax	# tmp979, tmp980
.LBE1305:
.LBE1323:
.LBB1324:
.LBB1312:
	vmovmskpd	%ymm6, %edx	# tmp983, tmp984
.LBE1312:
.LBE1324:
# src/sabd-enclave.c:267:         (_mm256_movemask_pd((__m256d) _mm256_cmpeq_epi64(ab_jid_block, chain_blocks[1])) << 4) |
	.loc 1 267 0
	sall	$4, %eax	#, tmp980
# src/sabd-enclave.c:268:         (_mm256_movemask_pd((__m256d) _mm256_cmpeq_epi64(ab_jid_block, chain_blocks[2])) << 8);
	.loc 1 268 0
	sall	$8, %edx	#, tmp984
.LBB1325:
.LBB1319:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1191:   return __builtin_ia32_movmskpd256 ((__v4df)__A);
	.loc 6 1191 0
	vmovmskpd	%ymm13, %r10d	# tmp975, tmp976
.LVL135:
.LBE1319:
.LBE1325:
# src/sabd-enclave.c:267:         (_mm256_movemask_pd((__m256d) _mm256_cmpeq_epi64(ab_jid_block, chain_blocks[1])) << 4) |
	.loc 1 267 0
	orl	%edx, %eax	# tmp987, tmp988
	orl	%r10d, %eax	# tmp976, chain_eq_mask
# src/sabd-enclave.c:270:       ab_jid_result |= chain_eq_mask & chain_result;
	.loc 1 270 0
	andl	%edi, %eax	# chain_result, ab_jid_result
.LVL136:
	leaq	2(%r8), %rdi	#, ivtmp.100
.LBE1290:
# src/sabd-enclave.c:263:     for (hash_slot_idx_t hash_slot_idx = 0; likely(hash_slot_idx < hash_table_slot_count); hash_slot_idx++) {
	.loc 1 263 0
	cmpq	%r9, %rcx	# _835, ivtmp.99
	je	.L114	#,
.LVL137:
	.p2align 4,,10
	.p2align 3
.L28:
.LBB1343:
.LBB1326:
.LBB1293:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avx2intrin.h:254:   return (__m256i) ((__v4di)__A == (__v4di)__B);
	.loc 7 254 0 discriminator 3
	vmovdqa	32(%rcx), %ymm9	# MEM[base: _770, offset: 32B], MEM[base: _770, offset: 32B]
.LBE1293:
.LBE1326:
.LBB1327:
.LBB1301:
	vmovdqa	(%rcx), %ymm7	# MEM[base: _770, offset: 0B], MEM[base: _770, offset: 0B]
	addq	$192, %rcx	#, ivtmp.99
	addq	$4, %rdi	#, ivtmp.100
.LBE1301:
.LBE1327:
.LBB1328:
.LBB1297:
	vmovdqa	-128(%rcx), %ymm2	# MEM[base: _770, offset: 64B], MEM[base: _770, offset: 64B]
.LBE1297:
.LBE1328:
.LBB1329:
.LBB1294:
	vmovdqa	-64(%rcx), %ymm1	# MEM[base: _770, offset: 32B], MEM[base: _770, offset: 32B]
.LBE1294:
.LBE1329:
.LBB1330:
.LBB1306:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1191:   return __builtin_ia32_movmskpd256 ((__v4df)__A);
	.loc 6 1191 0 discriminator 3
	vpcmpeqq	%ymm10, %ymm9, %ymm12	# _315, MEM[base: _770, offset: 32B], tmp755
.LBE1306:
.LBE1330:
.LBB1331:
.LBB1298:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avx2intrin.h:254:   return (__m256i) ((__v4di)__A == (__v4di)__B);
	.loc 7 254 0 discriminator 3
	vmovdqa	-32(%rcx), %ymm13	# MEM[base: _770, offset: 64B], MEM[base: _770, offset: 64B]
.LBE1298:
.LBE1331:
.LBB1332:
.LBB1320:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1191:   return __builtin_ia32_movmskpd256 ((__v4df)__A);
	.loc 6 1191 0 discriminator 3
	vpcmpeqq	%ymm10, %ymm7, %ymm8	# _315, MEM[base: _770, offset: 0B], tmp750
.LBE1320:
.LBE1332:
# src/sabd-enclave.c:269:       uint16_t chain_result = in_hashed_ab_jids_result_bits[hash_slot_idx] & 0xFFF;
	.loc 1 269 0 discriminator 3
	movzwl	-4(%rdi), %r15d	# *_154, _155
.LBB1333:
.LBB1313:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1191:   return __builtin_ia32_movmskpd256 ((__v4df)__A);
	.loc 6 1191 0 discriminator 3
	vpcmpeqq	%ymm10, %ymm2, %ymm3	# _315, MEM[base: _770, offset: 64B], tmp760
.LBE1313:
.LBE1333:
.LBB1334:
.LBB1302:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avx2intrin.h:254:   return (__m256i) ((__v4di)__A == (__v4di)__B);
	.loc 7 254 0 discriminator 3
	vmovdqa	-96(%rcx), %ymm4	# MEM[base: _770, offset: 0B], MEM[base: _770, offset: 0B]
.LBE1302:
.LBE1334:
.LBB1335:
.LBB1307:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1191:   return __builtin_ia32_movmskpd256 ((__v4df)__A);
	.loc 6 1191 0 discriminator 3
	vpcmpeqq	%ymm10, %ymm1, %ymm11	# _315, MEM[base: _770, offset: 32B], tmp946
.LBE1307:
.LBE1335:
.LBB1336:
.LBB1314:
	vpcmpeqq	%ymm10, %ymm13, %ymm14	# _315, MEM[base: _770, offset: 64B], tmp950
.LBE1314:
.LBE1336:
# src/sabd-enclave.c:269:       uint16_t chain_result = in_hashed_ab_jids_result_bits[hash_slot_idx] & 0xFFF;
	.loc 1 269 0 discriminator 3
	andw	$4095, %r15w	#, chain_result
.LBB1337:
.LBB1308:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1191:   return __builtin_ia32_movmskpd256 ((__v4df)__A);
	.loc 6 1191 0 discriminator 3
	vmovmskpd	%ymm12, %edx	# tmp755, tmp751
.LBE1308:
.LBE1337:
.LBB1338:
.LBB1321:
	vpcmpeqq	%ymm10, %ymm4, %ymm0	# _315, MEM[base: _770, offset: 0B], tmp942
	vmovmskpd	%ymm8, %r10d	# tmp750, tmp746
.LBE1321:
.LBE1338:
.LBB1339:
.LBB1315:
	vmovmskpd	%ymm3, %esi	# tmp760, tmp756
.LVL138:
.LBE1315:
.LBE1339:
# src/sabd-enclave.c:267:         (_mm256_movemask_pd((__m256d) _mm256_cmpeq_epi64(ab_jid_block, chain_blocks[1])) << 4) |
	.loc 1 267 0 discriminator 3
	sall	$4, %edx	#, tmp761
.LVL139:
# src/sabd-enclave.c:268:         (_mm256_movemask_pd((__m256d) _mm256_cmpeq_epi64(ab_jid_block, chain_blocks[2])) << 8);
	.loc 1 268 0 discriminator 3
	sall	$8, %esi	#, tmp762
.LVL140:
# src/sabd-enclave.c:267:         (_mm256_movemask_pd((__m256d) _mm256_cmpeq_epi64(ab_jid_block, chain_blocks[1])) << 4) |
	.loc 1 267 0 discriminator 3
	orl	%edx, %esi	# tmp761, tmp763
.LBB1340:
.LBB1309:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1191:   return __builtin_ia32_movmskpd256 ((__v4df)__A);
	.loc 6 1191 0 discriminator 3
	vmovmskpd	%ymm11, %edx	# tmp946, tmp947
.LBE1309:
.LBE1340:
# src/sabd-enclave.c:267:         (_mm256_movemask_pd((__m256d) _mm256_cmpeq_epi64(ab_jid_block, chain_blocks[1])) << 4) |
	.loc 1 267 0 discriminator 3
	orl	%esi, %r10d	# tmp763, chain_eq_mask
.LVL141:
.LBB1341:
.LBB1316:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1191:   return __builtin_ia32_movmskpd256 ((__v4df)__A);
	.loc 6 1191 0 discriminator 3
	vmovmskpd	%ymm14, %esi	# tmp950, tmp951
.LBE1316:
.LBE1341:
# src/sabd-enclave.c:267:         (_mm256_movemask_pd((__m256d) _mm256_cmpeq_epi64(ab_jid_block, chain_blocks[1])) << 4) |
	.loc 1 267 0 discriminator 3
	sall	$4, %edx	#, tmp953
# src/sabd-enclave.c:270:       ab_jid_result |= chain_eq_mask & chain_result;
	.loc 1 270 0 discriminator 3
	andl	%r10d, %r15d	# chain_eq_mask, tmp766
# src/sabd-enclave.c:268:         (_mm256_movemask_pd((__m256d) _mm256_cmpeq_epi64(ab_jid_block, chain_blocks[2])) << 8);
	.loc 1 268 0 discriminator 3
	sall	$8, %esi	#, tmp954
.LBB1342:
.LBB1322:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/avxintrin.h:1191:   return __builtin_ia32_movmskpd256 ((__v4df)__A);
	.loc 6 1191 0 discriminator 3
	vmovmskpd	%ymm0, %r10d	# tmp942, tmp943
.LBE1322:
.LBE1342:
# src/sabd-enclave.c:270:       ab_jid_result |= chain_eq_mask & chain_result;
	.loc 1 270 0 discriminator 3
	orl	%r15d, %eax	# tmp766, ab_jid_result
# src/sabd-enclave.c:269:       uint16_t chain_result = in_hashed_ab_jids_result_bits[hash_slot_idx] & 0xFFF;
	.loc 1 269 0 discriminator 3
	movzwl	-2(%rdi), %r15d	# *_154, _155
# src/sabd-enclave.c:267:         (_mm256_movemask_pd((__m256d) _mm256_cmpeq_epi64(ab_jid_block, chain_blocks[1])) << 4) |
	.loc 1 267 0 discriminator 3
	orl	%edx, %esi	# tmp953, tmp955
	orl	%esi, %r10d	# tmp955, chain_eq_mask
# src/sabd-enclave.c:269:       uint16_t chain_result = in_hashed_ab_jids_result_bits[hash_slot_idx] & 0xFFF;
	.loc 1 269 0 discriminator 3
	andw	$4095, %r15w	#, chain_result
# src/sabd-enclave.c:270:       ab_jid_result |= chain_eq_mask & chain_result;
	.loc 1 270 0 discriminator 3
	andl	%r10d, %r15d	# chain_eq_mask, tmp958
.LVL142:
	orl	%r15d, %eax	# tmp958, ab_jid_result
.LVL143:
.LBE1343:
# src/sabd-enclave.c:263:     for (hash_slot_idx_t hash_slot_idx = 0; likely(hash_slot_idx < hash_table_slot_count); hash_slot_idx++) {
	.loc 1 263 0 discriminator 3
	cmpq	%r9, %rcx	# _835, ivtmp.99
	jne	.L28	#,
.LVL144:
.L114:
	testw	%ax, %ax	# ab_jid_result
	setne	%al	#, tmp767
	addq	$8, %r13	#, ivtmp.105
.LVL145:
	addq	$1, %r11	#, ivtmp.106
.LVL146:
.LBE1289:
# src/sabd-enclave.c:273:     in_ab_jids_result[ab_jid_idx] = !!ab_jid_result;
	.loc 1 273 0
	movb	%al, -1(%r11)	# tmp767, *_161
.LVL147:
.LBE1286:
# src/sabd-enclave.c:258:   for (hash_slot_idx_t ab_jid_idx = 0; likely(ab_jid_idx < ab_jid_count); ab_jid_idx++) {
	.loc 1 258 0
	cmpq	%rbx, %r13	# _697, ivtmp.105
	jne	.L29	#,
	movl	-80(%rbp), %r11d	# %sfp,
.L27:
.LVL148:
	leaq	(%r11,%r11,2), %rbx	#, tmp890
	movq	-280(%rbp), %rdx	# %sfp, ivtmp.93
	movq	%r12, %rax	# hashed_ab_jids, ivtmp.94
.LBE1285:
.LBB1344:
.LBB1345:
# src/sabd-enclave.c:280:     chain_blocks[0] = _mm256_setzero_si256();
	.loc 1 280 0
	vpxor	%xmm10, %xmm10, %xmm10	# tmp768
	movabsq	$192153584101141163, %r9	#, tmp920
	salq	$5, %rbx	#, tmp891
	addq	%rbx, %r14	# tmp891, _735
	movq	%r14, %r13	# _735, tmp916
	subq	%r12, %r13	# hashed_ab_jids, tmp916
	subq	$96, %r13	#, tmp917
	shrq	$5, %r13	#, tmp918
	imulq	%r9, %r13	# tmp920, tmp919
	addq	$1, %r13	#, tmp922
	andl	$7, %r13d	#, tmp923
	je	.L30	#,
	cmpq	$1, %r13	#, tmp923
	je	.L87	#,
	cmpq	$2, %r13	#, tmp923
	je	.L88	#,
	cmpq	$3, %r13	#, tmp923
	je	.L89	#,
	cmpq	$4, %r13	#, tmp923
	je	.L90	#,
	cmpq	$5, %r13	#, tmp923
	je	.L91	#,
	cmpq	$6, %r13	#, tmp923
	je	.L92	#,
.LVL149:
# src/sabd-enclave.c:278:     in_hashed_ab_jids_result_bits[hash_slot_idx] = 0x8000;
	.loc 1 278 0
	movl	$-32768, %r8d	#,
	leaq	2(%rdx), %rdx	#, ivtmp.93
	leaq	96(%r12), %rax	#, ivtmp.94
	movw	%r8w, -2(%rdx)	#, *_168
.LVL150:
# src/sabd-enclave.c:280:     chain_blocks[0] = _mm256_setzero_si256();
	.loc 1 280 0
	vmovdqa	%ymm10, (%r12)	# tmp768, *chain_blocks_272
# src/sabd-enclave.c:281:     chain_blocks[1] = _mm256_setzero_si256();
	.loc 1 281 0
	vmovdqa	%ymm10, 32(%r12)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 32B]
# src/sabd-enclave.c:282:     chain_blocks[2] = _mm256_setzero_si256();
	.loc 1 282 0
	vmovdqa	%ymm10, 64(%r12)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 64B]
.LVL151:
.L92:
# src/sabd-enclave.c:278:     in_hashed_ab_jids_result_bits[hash_slot_idx] = 0x8000;
	.loc 1 278 0
	movl	$-32768, %ecx	#,
	addq	$2, %rdx	#, ivtmp.93
	addq	$96, %rax	#, ivtmp.94
	movw	%cx, -2(%rdx)	#, *_168
.LVL152:
# src/sabd-enclave.c:280:     chain_blocks[0] = _mm256_setzero_si256();
	.loc 1 280 0
	vmovdqa	%ymm10, -96(%rax)	# tmp768, *chain_blocks_272
# src/sabd-enclave.c:281:     chain_blocks[1] = _mm256_setzero_si256();
	.loc 1 281 0
	vmovdqa	%ymm10, -64(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 32B]
# src/sabd-enclave.c:282:     chain_blocks[2] = _mm256_setzero_si256();
	.loc 1 282 0
	vmovdqa	%ymm10, -32(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 64B]
.LVL153:
.L91:
# src/sabd-enclave.c:278:     in_hashed_ab_jids_result_bits[hash_slot_idx] = 0x8000;
	.loc 1 278 0
	movl	$-32768, %edi	#,
	addq	$2, %rdx	#, ivtmp.93
	addq	$96, %rax	#, ivtmp.94
	movw	%di, -2(%rdx)	#, *_168
# src/sabd-enclave.c:280:     chain_blocks[0] = _mm256_setzero_si256();
	.loc 1 280 0
	vmovdqa	%ymm10, -96(%rax)	# tmp768, *chain_blocks_272
# src/sabd-enclave.c:281:     chain_blocks[1] = _mm256_setzero_si256();
	.loc 1 281 0
	vmovdqa	%ymm10, -64(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 32B]
# src/sabd-enclave.c:282:     chain_blocks[2] = _mm256_setzero_si256();
	.loc 1 282 0
	vmovdqa	%ymm10, -32(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 64B]
.L90:
# src/sabd-enclave.c:278:     in_hashed_ab_jids_result_bits[hash_slot_idx] = 0x8000;
	.loc 1 278 0
	movl	$-32768, %r10d	#,
	addq	$2, %rdx	#, ivtmp.93
	addq	$96, %rax	#, ivtmp.94
	movw	%r10w, -2(%rdx)	#, *_168
# src/sabd-enclave.c:280:     chain_blocks[0] = _mm256_setzero_si256();
	.loc 1 280 0
	vmovdqa	%ymm10, -96(%rax)	# tmp768, *chain_blocks_272
# src/sabd-enclave.c:281:     chain_blocks[1] = _mm256_setzero_si256();
	.loc 1 281 0
	vmovdqa	%ymm10, -64(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 32B]
# src/sabd-enclave.c:282:     chain_blocks[2] = _mm256_setzero_si256();
	.loc 1 282 0
	vmovdqa	%ymm10, -32(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 64B]
.L89:
# src/sabd-enclave.c:278:     in_hashed_ab_jids_result_bits[hash_slot_idx] = 0x8000;
	.loc 1 278 0
	movl	$-32768, %esi	#,
	addq	$2, %rdx	#, ivtmp.93
	addq	$96, %rax	#, ivtmp.94
	movw	%si, -2(%rdx)	#, *_168
# src/sabd-enclave.c:280:     chain_blocks[0] = _mm256_setzero_si256();
	.loc 1 280 0
	vmovdqa	%ymm10, -96(%rax)	# tmp768, *chain_blocks_272
# src/sabd-enclave.c:281:     chain_blocks[1] = _mm256_setzero_si256();
	.loc 1 281 0
	vmovdqa	%ymm10, -64(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 32B]
# src/sabd-enclave.c:282:     chain_blocks[2] = _mm256_setzero_si256();
	.loc 1 282 0
	vmovdqa	%ymm10, -32(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 64B]
.L88:
# src/sabd-enclave.c:278:     in_hashed_ab_jids_result_bits[hash_slot_idx] = 0x8000;
	.loc 1 278 0
	movl	$-32768, %r15d	#,
	addq	$2, %rdx	#, ivtmp.93
	addq	$96, %rax	#, ivtmp.94
	movw	%r15w, -2(%rdx)	#, *_168
# src/sabd-enclave.c:280:     chain_blocks[0] = _mm256_setzero_si256();
	.loc 1 280 0
	vmovdqa	%ymm10, -96(%rax)	# tmp768, *chain_blocks_272
# src/sabd-enclave.c:281:     chain_blocks[1] = _mm256_setzero_si256();
	.loc 1 281 0
	vmovdqa	%ymm10, -64(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 32B]
# src/sabd-enclave.c:282:     chain_blocks[2] = _mm256_setzero_si256();
	.loc 1 282 0
	vmovdqa	%ymm10, -32(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 64B]
.L87:
# src/sabd-enclave.c:278:     in_hashed_ab_jids_result_bits[hash_slot_idx] = 0x8000;
	.loc 1 278 0
	movl	$-32768, %r11d	#,
	addq	$96, %rax	#, ivtmp.94
	addq	$2, %rdx	#, ivtmp.93
	movw	%r11w, -2(%rdx)	#, *_168
# src/sabd-enclave.c:280:     chain_blocks[0] = _mm256_setzero_si256();
	.loc 1 280 0
	vmovdqa	%ymm10, -96(%rax)	# tmp768, *chain_blocks_272
# src/sabd-enclave.c:281:     chain_blocks[1] = _mm256_setzero_si256();
	.loc 1 281 0
	vmovdqa	%ymm10, -64(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 32B]
# src/sabd-enclave.c:282:     chain_blocks[2] = _mm256_setzero_si256();
	.loc 1 282 0
	vmovdqa	%ymm10, -32(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 64B]
.LBE1345:
# src/sabd-enclave.c:277:   for (hash_slot_idx_t hash_slot_idx = 0; likely(hash_slot_idx < hash_table_slot_count); hash_slot_idx++) {
	.loc 1 277 0
	cmpq	%rax, %r14	# ivtmp.94, _735
	je	.L113	#,
.L30:
.LBB1346:
# src/sabd-enclave.c:278:     in_hashed_ab_jids_result_bits[hash_slot_idx] = 0x8000;
	.loc 1 278 0 discriminator 3
	movl	$-32768, %ebx	#,
	movl	$-32768, %r13d	#,
	movl	$-32768, %ecx	#,
	movl	$-32768, %r9d	#,
	movl	$-32768, %r8d	#,
	movl	$-32768, %edi	#,
	movl	$-32768, %esi	#,
	movw	%bx, (%rdx)	#, *_168
	movl	$-32768, %r10d	#,
# src/sabd-enclave.c:280:     chain_blocks[0] = _mm256_setzero_si256();
	.loc 1 280 0 discriminator 3
	vmovdqa	%ymm10, (%rax)	# tmp768, *chain_blocks_272
	addq	$768, %rax	#, ivtmp.94
	addq	$16, %rdx	#, ivtmp.93
# src/sabd-enclave.c:281:     chain_blocks[1] = _mm256_setzero_si256();
	.loc 1 281 0 discriminator 3
	vmovdqa	%ymm10, -736(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 32B]
# src/sabd-enclave.c:282:     chain_blocks[2] = _mm256_setzero_si256();
	.loc 1 282 0 discriminator 3
	vmovdqa	%ymm10, -704(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 64B]
# src/sabd-enclave.c:278:     in_hashed_ab_jids_result_bits[hash_slot_idx] = 0x8000;
	.loc 1 278 0 discriminator 3
	movw	%r13w, -14(%rdx)	#, *_168
# src/sabd-enclave.c:280:     chain_blocks[0] = _mm256_setzero_si256();
	.loc 1 280 0 discriminator 3
	vmovdqa	%ymm10, -672(%rax)	# tmp768, *chain_blocks_272
# src/sabd-enclave.c:281:     chain_blocks[1] = _mm256_setzero_si256();
	.loc 1 281 0 discriminator 3
	vmovdqa	%ymm10, -640(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 32B]
# src/sabd-enclave.c:282:     chain_blocks[2] = _mm256_setzero_si256();
	.loc 1 282 0 discriminator 3
	vmovdqa	%ymm10, -608(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 64B]
# src/sabd-enclave.c:278:     in_hashed_ab_jids_result_bits[hash_slot_idx] = 0x8000;
	.loc 1 278 0 discriminator 3
	movw	%r9w, -12(%rdx)	#, *_168
# src/sabd-enclave.c:280:     chain_blocks[0] = _mm256_setzero_si256();
	.loc 1 280 0 discriminator 3
	vmovdqa	%ymm10, -576(%rax)	# tmp768, *chain_blocks_272
# src/sabd-enclave.c:281:     chain_blocks[1] = _mm256_setzero_si256();
	.loc 1 281 0 discriminator 3
	vmovdqa	%ymm10, -544(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 32B]
# src/sabd-enclave.c:282:     chain_blocks[2] = _mm256_setzero_si256();
	.loc 1 282 0 discriminator 3
	vmovdqa	%ymm10, -512(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 64B]
# src/sabd-enclave.c:278:     in_hashed_ab_jids_result_bits[hash_slot_idx] = 0x8000;
	.loc 1 278 0 discriminator 3
	movw	%r8w, -10(%rdx)	#, *_168
# src/sabd-enclave.c:280:     chain_blocks[0] = _mm256_setzero_si256();
	.loc 1 280 0 discriminator 3
	vmovdqa	%ymm10, -480(%rax)	# tmp768, *chain_blocks_272
# src/sabd-enclave.c:281:     chain_blocks[1] = _mm256_setzero_si256();
	.loc 1 281 0 discriminator 3
	vmovdqa	%ymm10, -448(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 32B]
# src/sabd-enclave.c:282:     chain_blocks[2] = _mm256_setzero_si256();
	.loc 1 282 0 discriminator 3
	vmovdqa	%ymm10, -416(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 64B]
# src/sabd-enclave.c:278:     in_hashed_ab_jids_result_bits[hash_slot_idx] = 0x8000;
	.loc 1 278 0 discriminator 3
	movw	%cx, -8(%rdx)	#, *_168
# src/sabd-enclave.c:280:     chain_blocks[0] = _mm256_setzero_si256();
	.loc 1 280 0 discriminator 3
	vmovdqa	%ymm10, -384(%rax)	# tmp768, *chain_blocks_272
# src/sabd-enclave.c:281:     chain_blocks[1] = _mm256_setzero_si256();
	.loc 1 281 0 discriminator 3
	vmovdqa	%ymm10, -352(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 32B]
# src/sabd-enclave.c:282:     chain_blocks[2] = _mm256_setzero_si256();
	.loc 1 282 0 discriminator 3
	vmovdqa	%ymm10, -320(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 64B]
# src/sabd-enclave.c:278:     in_hashed_ab_jids_result_bits[hash_slot_idx] = 0x8000;
	.loc 1 278 0 discriminator 3
	movw	%di, -6(%rdx)	#, *_168
# src/sabd-enclave.c:280:     chain_blocks[0] = _mm256_setzero_si256();
	.loc 1 280 0 discriminator 3
	vmovdqa	%ymm10, -288(%rax)	# tmp768, *chain_blocks_272
# src/sabd-enclave.c:281:     chain_blocks[1] = _mm256_setzero_si256();
	.loc 1 281 0 discriminator 3
	vmovdqa	%ymm10, -256(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 32B]
# src/sabd-enclave.c:282:     chain_blocks[2] = _mm256_setzero_si256();
	.loc 1 282 0 discriminator 3
	vmovdqa	%ymm10, -224(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 64B]
# src/sabd-enclave.c:278:     in_hashed_ab_jids_result_bits[hash_slot_idx] = 0x8000;
	.loc 1 278 0 discriminator 3
	movw	%r10w, -4(%rdx)	#, *_168
# src/sabd-enclave.c:280:     chain_blocks[0] = _mm256_setzero_si256();
	.loc 1 280 0 discriminator 3
	vmovdqa	%ymm10, -192(%rax)	# tmp768, *chain_blocks_272
# src/sabd-enclave.c:281:     chain_blocks[1] = _mm256_setzero_si256();
	.loc 1 281 0 discriminator 3
	vmovdqa	%ymm10, -160(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 32B]
# src/sabd-enclave.c:282:     chain_blocks[2] = _mm256_setzero_si256();
	.loc 1 282 0 discriminator 3
	vmovdqa	%ymm10, -128(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 64B]
# src/sabd-enclave.c:278:     in_hashed_ab_jids_result_bits[hash_slot_idx] = 0x8000;
	.loc 1 278 0 discriminator 3
	movw	%si, -2(%rdx)	#, *_168
# src/sabd-enclave.c:280:     chain_blocks[0] = _mm256_setzero_si256();
	.loc 1 280 0 discriminator 3
	vmovdqa	%ymm10, -96(%rax)	# tmp768, *chain_blocks_272
# src/sabd-enclave.c:281:     chain_blocks[1] = _mm256_setzero_si256();
	.loc 1 281 0 discriminator 3
	vmovdqa	%ymm10, -64(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 32B]
# src/sabd-enclave.c:282:     chain_blocks[2] = _mm256_setzero_si256();
	.loc 1 282 0 discriminator 3
	vmovdqa	%ymm10, -32(%rax)	# tmp768, MEM[(volatile __m256i * {ref-all})chain_blocks_272 + 64B]
.LBE1346:
# src/sabd-enclave.c:277:   for (hash_slot_idx_t hash_slot_idx = 0; likely(hash_slot_idx < hash_table_slot_count); hash_slot_idx++) {
	.loc 1 277 0 discriminator 3
	cmpq	%rax, %r14	# ivtmp.94, _735
	jne	.L30	#,
.L113:
.LBE1344:
# src/sabd-enclave.c:285:   free((void *) in_hashed_ab_jids_result_bits);
	.loc 1 285 0
	movq	-280(%rbp), %rdi	# %sfp,
	vzeroupper
	call	free@PLT	#
.LVL154:
# src/sabd-enclave.c:286:   free(hashed_ab_jids);
	.loc 1 286 0
	movq	%r12, %rdi	# hashed_ab_jids,
	call	free@PLT	#
.LVL155:
# src/sabd-enclave.c:287:   return SGX_SUCCESS;
	.loc 1 287 0
	xorl	%eax, %eax	# <retval>
.LVL156:
.L118:
# src/sabd-enclave.c:288: }
	.loc 1 288 0
	addq	$288, %rsp	#,
	popq	%rbx	#
	popq	%rdx	#
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	leaq	-8(%rdx), %rsp	#,
	.cfi_def_cfa 7, 8
	ret
.LVL157:
.L125:
	.cfi_restore_state
.LBB1347:
.LBB1229:
# src/sabd-enclave.c:224:       memset_s(hashed_ab_jids, hashed_ab_jids_size, 0, hashed_ab_jids_size);
	.loc 1 224 0
	movq	-288(%rbp), %rsi	# %sfp, _730
	xorl	%edx, %edx	#
	movq	%r9, %rdi	# hashed_ab_jids,
.LVL158:
	movq	%r9, -80(%rbp)	# hashed_ab_jids, %sfp
.LVL159:
	movq	%r8, -224(%rbp)	# tmp898, %sfp
	movq	%rsi, %rcx	# _730,
	vmovdqa	%ymm12, -208(%rbp)	# chain_block_masks$0, %sfp
	vmovdqa	%ymm14, -176(%rbp)	# chain_block_masks$2, %sfp
	vmovdqa	%ymm15, -144(%rbp)	# chain_block_masks$1, %sfp
	vmovapd	%ymm13, -112(%rbp)	# tmp907, %sfp
	vzeroupper
	call	memset_s@PLT	#
.LVL160:
.LBE1229:
# src/sabd-enclave.c:150:   for (uint32_t hash_table_tries = 0; !hash_table_constructed && likely(hash_table_tries < 128); hash_table_tries++) {
	.loc 1 150 0
	subl	$1, -292(%rbp)	#, %sfp
	movq	-80(%rbp), %r9	# %sfp, hashed_ab_jids
	vmovapd	-112(%rbp), %ymm13	# %sfp, tmp907
	vmovdqa	-144(%rbp), %ymm15	# %sfp, chain_block_masks$1
	vmovdqa	-176(%rbp), %ymm14	# %sfp, chain_block_masks$2
	vmovdqa	-208(%rbp), %ymm12	# %sfp, chain_block_masks$0
	movq	-224(%rbp), %r8	# %sfp, tmp898
	jne	.L6	#,
.LVL161:
.L120:
.LBE1347:
# src/sabd-enclave.c:233:     free((void *) in_hashed_ab_jids_result_bits);
	.loc 1 233 0
	movq	-280(%rbp), %rdi	# %sfp,
	movq	%r9, %r12	# hashed_ab_jids, hashed_ab_jids
	vzeroupper
	call	free@PLT	#
.LVL162:
# src/sabd-enclave.c:234:     free(hashed_ab_jids);
	.loc 1 234 0
	movq	%r12, %rdi	# hashed_ab_jids,
	call	free@PLT	#
.LVL163:
# src/sabd-enclave.c:235:     return SGX_ERROR_UNEXPECTED;
	.loc 1 235 0
	movl	$1, %eax	#, <retval>
	jmp	.L118	#
.LVL164:
	.p2align 4,,10
	.p2align 3
.L124:
.LBB1348:
.LBB1230:
.LBB1226:
.LBB970:
.LBB966:
# src/sabd-enclave.c:177:       for (hash_slot_idx_t ab_jid_idx = 0; likely(ab_jid_idx < ab_jid_count); ab_jid_idx++) {
	.loc 1 177 0
	vxorpd	%xmm1, %xmm1, %xmm1	# _236
	vmovapd	.LC3(%rip), %ymm4	#, _819
	vmovapd	.LC4(%rip), %ymm3	#, _817
	vmovapd	%ymm1, %ymm9	#, _265
	vmovapd	%ymm1, %ymm8	#, _264
	vmovapd	.LC5(%rip), %ymm2	#, _815
	jmp	.L12	#
.LVL165:
.L16:
.LBE966:
.LBE970:
.LBE1226:
.LBB1227:
.LBB995:
.LBB975:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/immintrin.h:208:   return __builtin_ia32_rdrand64_step (__P);
	.loc 3 208 0
	rdrand	%rcx	# tmp636
	movl	$1, %esi	#, tmp637
	movq	%rcx, (%r8)	# tmp636,
	cmovc	%esi, %ecx	# tmp636,, tmp637, _813
.LVL166:
.LBE975:
.LBE995:
# src/sabd-enclave.c:155:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	.loc 1 155 0
	testl	%ecx, %ecx	# _813
	je	.L17	#,
.LVL167:
.LBB996:
.LBB986:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/immintrin.h:208:   return __builtin_ia32_rdrand64_step (__P);
	.loc 3 208 0
	rdrand	%rdi	# tmp640
	movq	%rdi, 8(%r8)	# tmp640,
	cmovc	%esi, %edi	# tmp640,, tmp637, _811
.LVL168:
.LBE986:
.LBE996:
# src/sabd-enclave.c:155:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	.loc 1 155 0
	testl	%edi, %edi	# _811
	jne	.L8	#,
.L17:
.LVL169:
.LBB997:
.LBB976:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/immintrin.h:208:   return __builtin_ia32_rdrand64_step (__P);
	.loc 3 208 0
	rdrand	%r10	# tmp643
	movl	$1, %r11d	#, tmp644
	movq	%r10, (%r8)	# tmp643,
	cmovc	%r11d, %r10d	# tmp643,, tmp644, _805
.LVL170:
.LBE976:
.LBE997:
# src/sabd-enclave.c:155:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	.loc 1 155 0
	testl	%r10d, %r10d	# _805
	je	.L18	#,
.LVL171:
.LBB998:
.LBB987:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/immintrin.h:208:   return __builtin_ia32_rdrand64_step (__P);
	.loc 3 208 0
	rdrand	%rax	# tmp647
	movq	%rax, 8(%r8)	# tmp647,
	cmovc	%r11d, %eax	# tmp647,, tmp644, _803
.LVL172:
.LBE987:
.LBE998:
# src/sabd-enclave.c:155:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	.loc 1 155 0
	testl	%eax, %eax	# _803
	jne	.L8	#,
.L18:
.LVL173:
.LBB999:
.LBB977:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/immintrin.h:208:   return __builtin_ia32_rdrand64_step (__P);
	.loc 3 208 0
	rdrand	%rcx	# tmp650
	movl	$1, %edx	#, tmp651
	movq	%rcx, (%r8)	# tmp650,
	cmovc	%edx, %ecx	# tmp650,, tmp651, _797
.LVL174:
.LBE977:
.LBE999:
# src/sabd-enclave.c:155:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	.loc 1 155 0
	testl	%ecx, %ecx	# _797
	je	.L19	#,
.LVL175:
.LBB1000:
.LBB988:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/immintrin.h:208:   return __builtin_ia32_rdrand64_step (__P);
	.loc 3 208 0
	rdrand	%rsi	# tmp654
	movq	%rsi, 8(%r8)	# tmp654,
	cmovc	%edx, %esi	# tmp654,, tmp651, _795
.LVL176:
.LBE988:
.LBE1000:
# src/sabd-enclave.c:155:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	.loc 1 155 0
	testl	%esi, %esi	# _795
	jne	.L8	#,
.L19:
.LVL177:
.LBB1001:
.LBB978:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/immintrin.h:208:   return __builtin_ia32_rdrand64_step (__P);
	.loc 3 208 0
	rdrand	%rdi	# tmp657
	movl	$1, %r10d	#, tmp658
	movq	%rdi, (%r8)	# tmp657,
	cmovc	%r10d, %edi	# tmp657,, tmp658, _789
.LVL178:
.LBE978:
.LBE1001:
# src/sabd-enclave.c:155:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	.loc 1 155 0
	testl	%edi, %edi	# _789
	je	.L20	#,
.LVL179:
.LBB1002:
.LBB989:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/immintrin.h:208:   return __builtin_ia32_rdrand64_step (__P);
	.loc 3 208 0
	rdrand	%r11	# tmp661
	movq	%r11, 8(%r8)	# tmp661,
	cmovc	%r10d, %r11d	# tmp661,, tmp658, _787
.LVL180:
.LBE989:
.LBE1002:
# src/sabd-enclave.c:155:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	.loc 1 155 0
	testl	%r11d, %r11d	# _787
	jne	.L8	#,
.L20:
.LVL181:
.LBB1003:
.LBB979:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/immintrin.h:208:   return __builtin_ia32_rdrand64_step (__P);
	.loc 3 208 0
	rdrand	%rax	# tmp664
	movl	$1, %ecx	#, tmp665
	movq	%rax, (%r8)	# tmp664,
	cmovc	%ecx, %eax	# tmp664,, tmp665, _768
.LVL182:
.LBE979:
.LBE1003:
# src/sabd-enclave.c:155:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	.loc 1 155 0
	testl	%eax, %eax	# _768
	je	.L21	#,
.LVL183:
.LBB1004:
.LBB990:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/immintrin.h:208:   return __builtin_ia32_rdrand64_step (__P);
	.loc 3 208 0
	rdrand	%rdx	# tmp668
	movq	%rdx, 8(%r8)	# tmp668,
	cmovc	%ecx, %edx	# tmp668,, tmp665, _766
.LVL184:
.LBE990:
.LBE1004:
# src/sabd-enclave.c:155:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	.loc 1 155 0
	testl	%edx, %edx	# _766
	jne	.L8	#,
.L21:
.LVL185:
.LBB1005:
.LBB980:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/immintrin.h:208:   return __builtin_ia32_rdrand64_step (__P);
	.loc 3 208 0
	rdrand	%rsi	# tmp671
	movl	$1, %edi	#, tmp672
	movq	%rsi, (%r8)	# tmp671,
	cmovc	%edi, %esi	# tmp671,, tmp672, _760
.LVL186:
.LBE980:
.LBE1005:
# src/sabd-enclave.c:155:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	.loc 1 155 0
	testl	%esi, %esi	# _760
	je	.L22	#,
.LVL187:
.LBB1006:
.LBB991:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/immintrin.h:208:   return __builtin_ia32_rdrand64_step (__P);
	.loc 3 208 0
	rdrand	%r10	# tmp675
	movq	%r10, 8(%r8)	# tmp675,
	cmovc	%edi, %r10d	# tmp675,, tmp672, _758
.LVL188:
.LBE991:
.LBE1006:
# src/sabd-enclave.c:155:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	.loc 1 155 0
	testl	%r10d, %r10d	# _758
	jne	.L8	#,
.L22:
.LVL189:
.LBB1007:
.LBB981:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/immintrin.h:208:   return __builtin_ia32_rdrand64_step (__P);
	.loc 3 208 0
	rdrand	%r11	# tmp678
	movl	$1, %ecx	#, tmp679
	movq	%r11, (%r8)	# tmp678,
	cmovc	%ecx, %r11d	# tmp678,, tmp679, _752
.LVL190:
.LBE981:
.LBE1007:
# src/sabd-enclave.c:155:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	.loc 1 155 0
	testl	%r11d, %r11d	# _752
	je	.L23	#,
.LVL191:
.LBB1008:
.LBB992:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/immintrin.h:208:   return __builtin_ia32_rdrand64_step (__P);
	.loc 3 208 0
	rdrand	%rax	# tmp682
	movq	%rax, 8(%r8)	# tmp682,
	cmovc	%ecx, %eax	# tmp682,, tmp679, _750
.LVL192:
.LBE992:
.LBE1008:
# src/sabd-enclave.c:155:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	.loc 1 155 0
	testl	%eax, %eax	# _750
	jne	.L8	#,
.L23:
.LVL193:
.LBB1009:
.LBB982:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/immintrin.h:208:   return __builtin_ia32_rdrand64_step (__P);
	.loc 3 208 0
	rdrand	%rsi	# tmp685
	movl	$1, %edx	#, tmp686
	movq	%rsi, (%r8)	# tmp685,
	cmovc	%edx, %esi	# tmp685,, tmp686, _744
.LVL194:
.LBE982:
.LBE1009:
# src/sabd-enclave.c:155:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	.loc 1 155 0
	testl	%esi, %esi	# _744
	je	.L24	#,
.LVL195:
.LBB1010:
.LBB993:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/immintrin.h:208:   return __builtin_ia32_rdrand64_step (__P);
	.loc 3 208 0
	rdrand	%rdi	# tmp689
	movq	%rdi, 8(%r8)	# tmp689,
	cmovc	%edx, %edi	# tmp689,, tmp686, _742
.LVL196:
.LBE993:
.LBE1010:
# src/sabd-enclave.c:155:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	.loc 1 155 0
	testl	%edi, %edi	# _742
	jne	.L8	#,
.L24:
.LVL197:
.LBB1011:
.LBB983:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/immintrin.h:208:   return __builtin_ia32_rdrand64_step (__P);
	.loc 3 208 0
	rdrand	%r10	# tmp692
	movl	$1, %r11d	#, tmp693
	movq	%r10, (%r8)	# tmp692,
	cmovc	%r11d, %r10d	# tmp692,, tmp693, _275
.LVL198:
.LBE983:
.LBE1011:
# src/sabd-enclave.c:155:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	.loc 1 155 0
	testl	%r10d, %r10d	# _275
	je	.L120	#,
.LVL199:
.LBB1012:
.LBB994:
# /usr/lib/gcc/x86_64-linux-gnu/7/include/immintrin.h:208:   return __builtin_ia32_rdrand64_step (__P);
	.loc 3 208 0
	rdrand	%rcx	# tmp568
	movq	%rcx, 8(%r8)	# tmp568,
	cmovc	%r11d, %ecx	# tmp568,, tmp693, _273
.LVL200:
.LBE994:
.LBE1012:
# src/sabd-enclave.c:155:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	.loc 1 155 0
	testl	%ecx, %ecx	# _273
	jne	.L8	#,
	jmp	.L120	#
.LVL201:
	.p2align 4,,10
	.p2align 3
.L33:
.LBE1227:
.LBE1230:
.LBE1348:
# src/sabd-enclave.c:117:     return SGX_ERROR_INVALID_PARAMETER;
	.loc 1 117 0
	movl	$2, %eax	#, <retval>
	jmp	.L118	#
.LVL202:
.L122:
# src/sabd-enclave.c:113:   if (unlikely(ab_jid_count == 0)) {
	.loc 1 113 0
	testl	%ecx, %ecx	# ab_jid_count
	je	.L32	#,
	movq	$96, -288(%rbp)	#, %sfp
	movl	$1, %r15d	#, _727
# src/sabd-enclave.c:110:   uint32_t hash_table_order = likely(ab_jid_count > 1)? _bit_scan_reverse(ab_jid_count - 1) + 1 : 0;
	.loc 1 110 0
	xorl	%ebx, %ebx	# iftmp.0_98
	jmp	.L4	#
.LVL203:
.L34:
# src/sabd-enclave.c:129:     return SGX_ERROR_OUT_OF_MEMORY;
	.loc 1 129 0
	movl	$3, %eax	#, <retval>
.LVL204:
	jmp	.L118	#
.LVL205:
.L123:
# src/sabd-enclave.c:136:     free(hashed_ab_jids);
	.loc 1 136 0
	movq	%r12, %rdi	# hashed_ab_jids,
	call	free@PLT	#
.LVL206:
# src/sabd-enclave.c:137:     return SGX_ERROR_OUT_OF_MEMORY;
	.loc 1 137 0
	movl	$3, %eax	#, <retval>
	jmp	.L118	#
.LVL207:
.L32:
# src/sabd-enclave.c:114:     return SGX_SUCCESS;
	.loc 1 114 0
	xorl	%eax, %eax	# <retval>
	jmp	.L118	#
	.cfi_endproc
.LFE5015:
	.size	sabd_lookup_hash, .-sabd_lookup_hash
	.p2align 4,,15
	.globl	sgxsd_enclave_server_init
	.hidden	sgxsd_enclave_server_init
	.type	sgxsd_enclave_server_init, @function
sgxsd_enclave_server_init:
.LFB5016:
	.loc 1 307 0
	.cfi_startproc
.LVL208:
# src/sabd-enclave.c:309:     return SGX_ERROR_INVALID_PARAMETER;
	.loc 1 309 0
	movl	$2, %eax	#, <retval>
# src/sabd-enclave.c:308:   if (p_args == NULL) {
	.loc 1 308 0
	testq	%rdi, %rdi	# p_args
	je	.L134	#,
# src/sabd-enclave.c:307: sgx_status_t sgxsd_enclave_server_init(const sabd_start_args_t *p_args, sabd_state_t **pp_state) {
	.loc 1 307 0
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rsi, %r13	# pp_state, pp_state
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx	# p_args, p_args
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 48
# src/sabd-enclave.c:313:   size_t state_size = sizeof(sabd_state_t) + sizeof(jid_t) * p_args->max_ab_jids;
	.loc 1 313 0
	movl	(%rdi), %eax	# p_args_7(D)->max_ab_jids, p_args_7(D)->max_ab_jids
# src/sabd-enclave.c:314:   sabd_state_t *p_state = memalign(CACHE_LINE_SIZE, state_size);
	.loc 1 314 0
	movl	$64, %edi	#,
.LVL209:
# src/sabd-enclave.c:313:   size_t state_size = sizeof(sabd_state_t) + sizeof(jid_t) * p_args->max_ab_jids;
	.loc 1 313 0
	leaq	64(,%rax,8), %r12	#, state_size
.LVL210:
# src/sabd-enclave.c:314:   sabd_state_t *p_state = memalign(CACHE_LINE_SIZE, state_size);
	.loc 1 314 0
	movq	%r12, %rsi	# state_size,
.LVL211:
	call	memalign@PLT	#
.LVL212:
	movq	%rax, %rbp	#, p_state
.LVL213:
# src/sabd-enclave.c:316:     return SGX_ERROR_OUT_OF_MEMORY;
	.loc 1 316 0
	movl	$3, %eax	#, <retval>
.LVL214:
# src/sabd-enclave.c:315:   if (p_state == NULL) {
	.loc 1 315 0
	testq	%rbp, %rbp	# p_state
	je	.L132	#,
# src/sabd-enclave.c:318:   memset_s(p_state, state_size, 0, state_size);
	.loc 1 318 0
	xorl	%edx, %edx	#
	movq	%r12, %rcx	# state_size,
	movq	%r12, %rsi	# state_size,
	movq	%rbp, %rdi	# p_state,
	call	memset_s@PLT	#
.LVL215:
# src/sabd-enclave.c:322:     .max_ab_jids = p_args->max_ab_jids,
	.loc 1 322 0
	movl	(%rbx), %edx	# p_args_7(D)->max_ab_jids, _4
# src/sabd-enclave.c:319:   *p_state = (sabd_state_t) {
	.loc 1 319 0
	movl	$0, 8(%rbp)	#, p_state_11->ab_jid_count
# src/sabd-enclave.c:325:   return SGX_SUCCESS;
	.loc 1 325 0
	xorl	%eax, %eax	# <retval>
# src/sabd-enclave.c:319:   *p_state = (sabd_state_t) {
	.loc 1 319 0
	movq	$0, 0(%rbp)	#, p_state_11->msgs
	movl	%edx, 12(%rbp)	# _4, p_state_11->max_ab_jids
# src/sabd-enclave.c:324:   *pp_state = p_state;
	.loc 1 324 0
	movq	%rbp, 0(%r13)	# p_state, *pp_state_16(D)
.L132:
# src/sabd-enclave.c:326: }
	.loc 1 326 0
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 40
	popq	%rbx	#
	.cfi_def_cfa_offset 32
.LVL216:
	popq	%rbp	#
	.cfi_def_cfa_offset 24
.LVL217:
	popq	%r12	#
	.cfi_def_cfa_offset 16
.LVL218:
	popq	%r13	#
	.cfi_def_cfa_offset 8
.LVL219:
	ret
.LVL220:
	.p2align 4,,10
	.p2align 3
.L134:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	ret
	.cfi_endproc
.LFE5016:
	.size	sgxsd_enclave_server_init, .-sgxsd_enclave_server_init
	.p2align 4,,15
	.globl	sgxsd_enclave_server_handle_call
	.hidden	sgxsd_enclave_server_handle_call
	.type	sgxsd_enclave_server_handle_call, @function
sgxsd_enclave_server_handle_call:
.LFB5017:
	.loc 1 329 0
	.cfi_startproc
.LVL221:
	pushq	%r14	#
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13	#
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12	#
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp	#
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx	#
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
# src/sabd-enclave.c:330:   sabd_state_t *p_state = *pp_state;
	.loc 1 330 0
	movq	(%rcx), %rbx	# *pp_state_19(D), p_state
.LVL222:
# src/sabd-enclave.c:331:   if (p_state == NULL) {
	.loc 1 331 0
	testq	%rbx, %rbx	# p_state
	je	.L139	#,
# src/sabd-enclave.c:334:   if (p_args == NULL) {
	.loc 1 334 0
	testq	%rdi, %rdi	# p_args
	je	.L140	#,
# src/sabd-enclave.c:337:   if (p_args->ab_jid_count == 0 ||
	.loc 1 337 0
	movl	(%rdi), %ecx	# p_args_21(D)->ab_jid_count, _1
.LVL223:
# src/sabd-enclave.c:335:     return SGX_ERROR_INVALID_PARAMETER;
	.loc 1 335 0
	movl	$2, %eax	#, <retval>
# src/sabd-enclave.c:337:   if (p_args->ab_jid_count == 0 ||
	.loc 1 337 0
	testl	%ecx, %ecx	# _1
	je	.L148	#,
# src/sabd-enclave.c:338:       p_args->ab_jid_count > p_state->max_ab_jids - p_state->ab_jid_count ||
	.loc 1 338 0 discriminator 1
	movl	12(%rbx), %r8d	# p_state_20->max_ab_jids, p_state_20->max_ab_jids
	subl	8(%rbx), %r8d	# p_state_20->ab_jid_count, tmp115
# src/sabd-enclave.c:337:   if (p_args->ab_jid_count == 0 ||
	.loc 1 337 0 discriminator 1
	cmpl	%r8d, %ecx	# tmp115, _1
	ja	.L148	#,
# src/sabd-enclave.c:338:       p_args->ab_jid_count > p_state->max_ab_jids - p_state->ab_jid_count ||
	.loc 1 338 0
	testb	$7, %dl	#, msg
	jne	.L148	#,
# src/sabd-enclave.c:340:       msg.size / 8 != p_args->ab_jid_count) {
	.loc 1 340 0
	movl	%edx, %ebp	# msg, tmp118
	shrl	$3, %ebp	#, tmp118
# src/sabd-enclave.c:339:       msg.size % 8 != 0 ||
	.loc 1 339 0
	cmpl	%ebp, %ecx	# tmp118, _1
	je	.L150	#,
.LVL224:
.L148:
# src/sabd-enclave.c:361: }
	.loc 1 361 0
	popq	%rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 40
.LVL225:
	popq	%rbp	#
	.cfi_def_cfa_offset 32
	popq	%r12	#
	.cfi_def_cfa_offset 24
.LVL226:
	popq	%r13	#
	.cfi_def_cfa_offset 16
.LVL227:
	popq	%r14	#
	.cfi_def_cfa_offset 8
	ret
.LVL228:
	.p2align 4,,10
	.p2align 3
.L150:
	.cfi_restore_state
# src/sabd-enclave.c:343:   sgx_lfence();
	.loc 1 343 0
	lfence
	movq	%rdi, %rbp	# p_args, p_args
# src/sabd-enclave.c:345:   sabd_msg_t *p_sabd_msg = malloc(sizeof(sabd_msg_t));
	.loc 1 345 0
	movl	$56, %edi	#,
.LVL229:
	movq	%rdx, %r12	# msg, msg
	movq	%rsi, %r13	# msg, msg
	call	malloc@PLT	#
.LVL230:
	movq	%rax, %r14	#, tmp119
.LVL231:
# src/sabd-enclave.c:347:     return SGX_ERROR_OUT_OF_MEMORY;
	.loc 1 347 0
	movl	$3, %eax	#, <retval>
.LVL232:
# src/sabd-enclave.c:346:   if (p_sabd_msg == NULL) {
	.loc 1 346 0
	testq	%r14, %r14	# tmp119
	je	.L148	#,
# src/sabd-enclave.c:351:     .prev = p_state->msgs,
	.loc 1 351 0
	movq	(%rbx), %rax	# p_state_20->msgs, _8
# src/sabd-enclave.c:352:     .ab_jid_count = p_args->ab_jid_count,
	.loc 1 352 0
	movl	0(%rbp), %edx	# p_args_21(D)->ab_jid_count, _7
# src/sabd-enclave.c:349:   *p_sabd_msg = (sabd_msg_t) {
	.loc 1 349 0
	vmovdqu	48(%rsp), %xmm0	# from, from
	vmovdqu	64(%rsp), %xmm1	# from, from
	movq	80(%rsp), %rsi	# from, from
# src/sabd-enclave.c:355:   memcpy(&p_state->ab_jids[p_state->ab_jid_count], msg.data, msg.size);
	.loc 1 355 0
	movl	8(%rbx), %edi	# p_state_20->ab_jid_count, p_state_20->ab_jid_count
# src/sabd-enclave.c:349:   *p_sabd_msg = (sabd_msg_t) {
	.loc 1 349 0
	movl	%edx, 40(%r14)	# _7, p_sabd_msg_24->ab_jid_count
# src/sabd-enclave.c:355:   memcpy(&p_state->ab_jids[p_state->ab_jid_count], msg.data, msg.size);
	.loc 1 355 0
	movl	%r12d, %edx	# msg, msg$size
# src/sabd-enclave.c:349:   *p_sabd_msg = (sabd_msg_t) {
	.loc 1 349 0
	vmovups	%xmm0, (%r14)	# from, p_sabd_msg_24->from
	vmovups	%xmm1, 16(%r14)	# from, p_sabd_msg_24->from
# src/sabd-enclave.c:355:   memcpy(&p_state->ab_jids[p_state->ab_jid_count], msg.data, msg.size);
	.loc 1 355 0
	leaq	64(%rbx,%rdi,8), %rdi	#, tmp126
# src/sabd-enclave.c:349:   *p_sabd_msg = (sabd_msg_t) {
	.loc 1 349 0
	movq	%rsi, 32(%r14)	# from, p_sabd_msg_24->from
# src/sabd-enclave.c:355:   memcpy(&p_state->ab_jids[p_state->ab_jid_count], msg.data, msg.size);
	.loc 1 355 0
	movq	%r13, %rsi	# msg,
# src/sabd-enclave.c:349:   *p_sabd_msg = (sabd_msg_t) {
	.loc 1 349 0
	movq	%rax, 48(%r14)	# _8, p_sabd_msg_24->prev
# src/sabd-enclave.c:354:   p_state->msgs = p_sabd_msg;
	.loc 1 354 0
	movq	%r14, (%rbx)	# tmp119, p_state_20->msgs
# src/sabd-enclave.c:355:   memcpy(&p_state->ab_jids[p_state->ab_jid_count], msg.data, msg.size);
	.loc 1 355 0
	call	memcpy@PLT	#
.LVL233:
# src/sabd-enclave.c:356:   p_state->ab_jid_count += p_sabd_msg->ab_jid_count;
	.loc 1 356 0
	movl	40(%r14), %r9d	# p_sabd_msg_24->ab_jid_count, p_sabd_msg_24->ab_jid_count
	addl	%r9d, 8(%rbx)	# p_sabd_msg_24->ab_jid_count, p_state_20->ab_jid_count
# src/sabd-enclave.c:358:   memset_s(&from, sizeof(from), 0, sizeof(from));
	.loc 1 358 0
	xorl	%edx, %edx	#
	movl	$40, %ecx	#,
	movl	$40, %esi	#,
	leaq	48(%rsp), %rdi	#,
	call	memset_s@PLT	#
.LVL234:
# src/sabd-enclave.c:360:   return SGX_SUCCESS;
	.loc 1 360 0
	xorl	%eax, %eax	# <retval>
	jmp	.L148	#
.LVL235:
	.p2align 4,,10
	.p2align 3
.L139:
# src/sabd-enclave.c:361: }
	.loc 1 361 0
	popq	%rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 40
.LVL236:
# src/sabd-enclave.c:332:     return SGX_ERROR_INVALID_STATE;
	.loc 1 332 0
	movl	$5, %eax	#, <retval>
# src/sabd-enclave.c:361: }
	.loc 1 361 0
	popq	%rbp	#
	.cfi_def_cfa_offset 32
	popq	%r12	#
	.cfi_def_cfa_offset 24
	popq	%r13	#
	.cfi_def_cfa_offset 16
	popq	%r14	#
	.cfi_def_cfa_offset 8
	ret
.LVL237:
	.p2align 4,,10
	.p2align 3
.L140:
	.cfi_restore_state
	popq	%rbx	#
	.cfi_def_cfa_offset 40
.LVL238:
# src/sabd-enclave.c:335:     return SGX_ERROR_INVALID_PARAMETER;
	.loc 1 335 0
	movl	$2, %eax	#, <retval>
# src/sabd-enclave.c:361: }
	.loc 1 361 0
	popq	%rbp	#
	.cfi_def_cfa_offset 32
	popq	%r12	#
	.cfi_def_cfa_offset 24
	popq	%r13	#
	.cfi_def_cfa_offset 16
	popq	%r14	#
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5017:
	.size	sgxsd_enclave_server_handle_call, .-sgxsd_enclave_server_handle_call
	.p2align 4,,15
	.globl	sgxsd_enclave_server_terminate
	.hidden	sgxsd_enclave_server_terminate
	.type	sgxsd_enclave_server_terminate, @function
sgxsd_enclave_server_terminate:
.LFB5018:
	.loc 1 362 0
	.cfi_startproc
.LVL239:
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp	#,
	.cfi_def_cfa_offset 112
# src/sabd-enclave.c:363:   if (p_state == NULL) {
	.loc 1 363 0
	testq	%rsi, %rsi	# p_state
	je	.L169	#,
	movq	%rsi, %rbp	# p_state, p_state
	movq	%rdi, %rbx	# p_args, p_args
.LVL240:
# src/sabd-enclave.c:369:   if (p_args == NULL) {
	.loc 1 369 0
	testq	%rdi, %rdi	# p_args
	je	.L195	#,
.LBB1349:
# src/sabd-enclave.c:374:     if (p_args->in_jid_count > SIZE_MAX / sizeof(p_args->in_jids[0]) ||
	.loc 1 374 0
	movabsq	$2305843009213693951, %rax	#, tmp141
# src/sabd-enclave.c:373:     size_t in_jids_size = p_args->in_jid_count * sizeof(p_args->in_jids[0]);
	.loc 1 373 0
	movq	8(%rdi), %r12	# p_args_35(D)->in_jid_count, _1
.LVL241:
# src/sabd-enclave.c:374:     if (p_args->in_jid_count > SIZE_MAX / sizeof(p_args->in_jids[0]) ||
	.loc 1 374 0
	cmpq	%rax, %r12	# tmp141, _1
	jbe	.L157	#,
.LVL242:
.L195:
.LBE1349:
# src/sabd-enclave.c:385:   if (p_state->ab_jid_count != 0) {
	.loc 1 385 0
	movl	8(%rbp), %edi	# p_state_34(D)->ab_jid_count,
.LVL243:
	testl	%edi, %edi	# _69
	jne	.L193	#,
.LVL244:
.L154:
# src/sabd-enclave.c:427:   size_t state_size = sizeof(sabd_state_t) + sizeof(jid_t) * p_state->max_ab_jids;
	.loc 1 427 0
	movl	12(%rbp), %r10d	# p_state_34(D)->max_ab_jids, p_state_34(D)->max_ab_jids
# src/sabd-enclave.c:428:   memset_s(p_state, state_size, 0, state_size);
	.loc 1 428 0
	xorl	%edx, %edx	#
	movq	%rbp, %rdi	# p_state,
# src/sabd-enclave.c:429:   free(p_state);
	.loc 1 429 0
	movl	$2, %r13d	#, <retval>
# src/sabd-enclave.c:427:   size_t state_size = sizeof(sabd_state_t) + sizeof(jid_t) * p_state->max_ab_jids;
	.loc 1 427 0
	leaq	64(,%r10,8), %rsi	#, state_size
.LVL245:
# src/sabd-enclave.c:428:   memset_s(p_state, state_size, 0, state_size);
	.loc 1 428 0
	movq	%rsi, %rcx	# state_size,
	call	memset_s@PLT	#
.LVL246:
# src/sabd-enclave.c:429:   free(p_state);
	.loc 1 429 0
	movq	%rbp, %rdi	# p_state,
	call	free@PLT	#
.LVL247:
.L190:
# src/sabd-enclave.c:438: }
	.loc 1 438 0
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r13d, %eax	# <retval>,
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
	ret
.LVL248:
	.p2align 4,,10
	.p2align 3
.L157:
	.cfi_restore_state
.LBB1350:
# src/sabd-enclave.c:375:         sgx_is_outside_enclave(p_args->in_jids, in_jids_size) != 1) {
	.loc 1 375 0 discriminator 1
	movq	(%rdi), %rdi	# p_args_35(D)->in_jids,
# src/sabd-enclave.c:373:     size_t in_jids_size = p_args->in_jid_count * sizeof(p_args->in_jids[0]);
	.loc 1 373 0 discriminator 1
	leaq	0(,%r12,8), %rsi	#, in_jids_size
.LVL249:
# src/sabd-enclave.c:375:         sgx_is_outside_enclave(p_args->in_jids, in_jids_size) != 1) {
	.loc 1 375 0 discriminator 1
	call	sgx_is_outside_enclave@PLT	#
.LVL250:
.LBE1350:
# src/sabd-enclave.c:385:   if (p_state->ab_jid_count != 0) {
	.loc 1 385 0 discriminator 1
	movl	8(%rbp), %edi	# p_state_34(D)->ab_jid_count,
.LBB1351:
# src/sabd-enclave.c:374:     if (p_args->in_jid_count > SIZE_MAX / sizeof(p_args->in_jids[0]) ||
	.loc 1 374 0 discriminator 1
	cmpl	$1, %eax	#, _4
	je	.L196	#,
.LVL251:
.LBE1351:
# src/sabd-enclave.c:385:   if (p_state->ab_jid_count != 0) {
	.loc 1 385 0
	testl	%edi, %edi	# _83
	je	.L154	#,
.LVL252:
	.p2align 4,,10
	.p2align 3
.L193:
.LBB1352:
# src/sabd-enclave.c:386:     uint8_t *in_ab_jids_result = malloc(p_state->ab_jid_count);
	.loc 1 386 0
	call	malloc@PLT	#
.LVL253:
.LBB1353:
# src/sabd-enclave.c:402:     for (sabd_msg_t *p_msg = p_state->msgs; p_msg != NULL;) {
	.loc 1 402 0
	movq	0(%rbp), %rbx	# p_state_34(D)->msgs, p_msg
.LVL254:
.LBE1353:
.LBE1352:
.LBB1366:
# src/sabd-enclave.c:376:       validate_args_res = SGX_ERROR_INVALID_PARAMETER;
	.loc 1 376 0
	movl	$2, %r13d	#, <retval>
.LBE1366:
.LBB1367:
# src/sabd-enclave.c:386:     uint8_t *in_ab_jids_result = malloc(p_state->ab_jid_count);
	.loc 1 386 0
	movq	%rax, %r14	#, in_ab_jids_result
.LVL255:
.LBB1360:
# src/sabd-enclave.c:402:     for (sabd_msg_t *p_msg = p_state->msgs; p_msg != NULL;) {
	.loc 1 402 0
	testq	%rbx, %rbx	# p_msg
	je	.L189	#,
.LVL256:
	.p2align 4,,10
	.p2align 3
.L163:
.LBB1354:
# src/sabd-enclave.c:417:       memset_s(p_msg, sizeof(*p_msg), 0, sizeof(*p_msg));
	.loc 1 417 0
	movq	%rbx, %rdi	# p_msg,
# src/sabd-enclave.c:416:       sabd_msg_t *p_prev_msg = p_msg->prev;
	.loc 1 416 0
	movq	48(%rbx), %r15	# p_msg_104->prev, p_prev_msg
.LVL257:
# src/sabd-enclave.c:417:       memset_s(p_msg, sizeof(*p_msg), 0, sizeof(*p_msg));
	.loc 1 417 0
	movl	$56, %ecx	#,
	xorl	%edx, %edx	#
	movl	$56, %esi	#,
	call	memset_s@PLT	#
.LVL258:
# src/sabd-enclave.c:418:       free(p_msg);
	.loc 1 418 0
	movq	%rbx, %rdi	# p_msg,
	movq	%r15, %rbx	# p_prev_msg, p_msg
.LVL259:
	call	free@PLT	#
.LVL260:
.LBE1354:
# src/sabd-enclave.c:402:     for (sabd_msg_t *p_msg = p_state->msgs; p_msg != NULL;) {
	.loc 1 402 0
	testq	%r15, %r15	# p_msg
	jne	.L163	#,
.LVL261:
.L189:
.LBE1360:
# src/sabd-enclave.c:422:     free(in_ab_jids_result);
	.loc 1 422 0
	movq	%r14, %rdi	# in_ab_jids_result,
	call	free@PLT	#
.LVL262:
.LBE1367:
# src/sabd-enclave.c:427:   size_t state_size = sizeof(sabd_state_t) + sizeof(jid_t) * p_state->max_ab_jids;
	.loc 1 427 0
	movl	12(%rbp), %r11d	# p_state_34(D)->max_ab_jids, p_state_34(D)->max_ab_jids
# src/sabd-enclave.c:428:   memset_s(p_state, state_size, 0, state_size);
	.loc 1 428 0
	movq	%rbp, %rdi	# p_state,
	xorl	%edx, %edx	#
# src/sabd-enclave.c:427:   size_t state_size = sizeof(sabd_state_t) + sizeof(jid_t) * p_state->max_ab_jids;
	.loc 1 427 0
	leaq	64(,%r11,8), %rsi	#, state_size
.LVL263:
# src/sabd-enclave.c:428:   memset_s(p_state, state_size, 0, state_size);
	.loc 1 428 0
	movq	%rsi, %rcx	# state_size,
	call	memset_s@PLT	#
.LVL264:
# src/sabd-enclave.c:429:   free(p_state);
	.loc 1 429 0
	movq	%rbp, %rdi	# p_state,
	call	free@PLT	#
.LVL265:
	jmp	.L190	#
.LVL266:
	.p2align 4,,10
	.p2align 3
.L169:
# src/sabd-enclave.c:364:     return SGX_ERROR_INVALID_STATE;
	.loc 1 364 0
	movl	$5, %r13d	#, <retval>
	jmp	.L190	#
.LVL267:
	.p2align 4,,10
	.p2align 3
.L196:
# src/sabd-enclave.c:385:   if (p_state->ab_jid_count != 0) {
	.loc 1 385 0
	testl	%edi, %edi	# _76
	jne	.L197	#,
.LVL268:
# src/sabd-enclave.c:427:   size_t state_size = sizeof(sabd_state_t) + sizeof(jid_t) * p_state->max_ab_jids;
	.loc 1 427 0
	movl	12(%rbp), %edx	# p_state_34(D)->max_ab_jids, p_state_34(D)->max_ab_jids
# src/sabd-enclave.c:428:   memset_s(p_state, state_size, 0, state_size);
	.loc 1 428 0
	movq	%rbp, %rdi	# p_state,
# src/sabd-enclave.c:384:   sgx_status_t replies_res = SGX_SUCCESS;
	.loc 1 384 0
	xorl	%r13d, %r13d	# <retval>
# src/sabd-enclave.c:427:   size_t state_size = sizeof(sabd_state_t) + sizeof(jid_t) * p_state->max_ab_jids;
	.loc 1 427 0
	leaq	64(,%rdx,8), %rsi	#, state_size
.LVL269:
# src/sabd-enclave.c:428:   memset_s(p_state, state_size, 0, state_size);
	.loc 1 428 0
	xorl	%edx, %edx	#
	movq	%rsi, %rcx	# state_size,
	call	memset_s@PLT	#
.LVL270:
# src/sabd-enclave.c:429:   free(p_state);
	.loc 1 429 0
	movq	%rbp, %rdi	# p_state,
	call	free@PLT	#
.LVL271:
	jmp	.L190	#
	.p2align 4,,10
	.p2align 3
.L197:
.LBB1368:
# src/sabd-enclave.c:386:     uint8_t *in_ab_jids_result = malloc(p_state->ab_jid_count);
	.loc 1 386 0
	call	malloc@PLT	#
.LVL272:
	movq	%rax, %r14	#, in_ab_jids_result
.LVL273:
# src/sabd-enclave.c:390:     } else if (in_ab_jids_result != NULL) {
	.loc 1 390 0
	testq	%rax, %rax	# in_ab_jids_result
	je	.L198	#,
# src/sabd-enclave.c:392:       sgx_lfence();
	.loc 1 392 0
	lfence
# src/sabd-enclave.c:394:       lookup_res = sabd_lookup_hash(p_args->in_jids, validated_in_jid_count,
	.loc 1 394 0
	movq	(%rbx), %rdi	# p_args_35(D)->in_jids,
	movq	%r12, %rsi	# _1,
# src/sabd-enclave.c:395:                                     p_state->ab_jids, p_state->ab_jid_count,
	.loc 1 395 0
	leaq	64(%rbp), %rdx	#, tmp150
# src/sabd-enclave.c:394:       lookup_res = sabd_lookup_hash(p_args->in_jids, validated_in_jid_count,
	.loc 1 394 0
	movl	8(%rbp), %ecx	# p_state_34(D)->ab_jid_count, p_state_34(D)->ab_jid_count
	movq	%rax, %r8	# in_ab_jids_result,
	call	sabd_lookup_hash	#
.LVL274:
.LBB1361:
# src/sabd-enclave.c:402:     for (sabd_msg_t *p_msg = p_state->msgs; p_msg != NULL;) {
	.loc 1 402 0
	movq	0(%rbp), %rbx	# p_state_34(D)->msgs, p_msg
.LVL275:
	movl	8(%rbp), %r12d	# p_state_34(D)->ab_jid_count, ab_jid_idx
.LVL276:
.LBE1361:
# src/sabd-enclave.c:394:       lookup_res = sabd_lookup_hash(p_args->in_jids, validated_in_jid_count,
	.loc 1 394 0
	movl	%eax, %r13d	#, <retval>
.LVL277:
.LBB1362:
# src/sabd-enclave.c:402:     for (sabd_msg_t *p_msg = p_state->msgs; p_msg != NULL;) {
	.loc 1 402 0
	testq	%rbx, %rbx	# p_msg
	je	.L189	#,
.LBE1362:
.LBE1368:
# src/sabd-enclave.c:384:   sgx_status_t replies_res = SGX_SUCCESS;
	.loc 1 384 0
	movl	$0, 44(%rsp)	#, %sfp
	testl	%eax, %eax	# <retval>
	je	.L162	#,
	jmp	.L163	#
.LVL278:
	.p2align 4,,10
	.p2align 3
.L199:
.LBB1369:
.LBB1363:
.LBB1358:
# src/sabd-enclave.c:417:       memset_s(p_msg, sizeof(*p_msg), 0, sizeof(*p_msg));
	.loc 1 417 0
	call	memset_s@PLT	#
.LVL279:
# src/sabd-enclave.c:418:       free(p_msg);
	.loc 1 418 0
	movq	%rbx, %rdi	# p_msg,
	call	free@PLT	#
.LVL280:
.LBE1358:
# src/sabd-enclave.c:402:     for (sabd_msg_t *p_msg = p_state->msgs; p_msg != NULL;) {
	.loc 1 402 0
	movl	44(%rsp), %r13d	# %sfp, <retval>
	testq	%r15, %r15	# p_msg
	je	.L167	#,
.LVL281:
	.p2align 4,,10
	.p2align 3
.L166:
	movl	%r13d, 44(%rsp)	# <retval>, %sfp
	movq	%r15, %rbx	# p_msg, p_msg
.LVL282:
.L162:
.LBB1359:
.LBB1355:
# src/sabd-enclave.c:404:         ab_jid_idx -= p_msg->ab_jid_count;
	.loc 1 404 0
	movl	40(%rbx), %esi	# p_msg_113->ab_jid_count, _10
# src/sabd-enclave.c:410:         sgx_status_t reply_res = sgxsd_enclave_server_reply(reply_buf, p_msg->from);
	.loc 1 410 0
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 120
# src/sabd-enclave.c:404:         ab_jid_idx -= p_msg->ab_jid_count;
	.loc 1 404 0
	subl	%esi, %r12d	# _10, ab_jid_idx
.LVL283:
# src/sabd-enclave.c:406:           .data = &in_ab_jids_result[ab_jid_idx],
	.loc 1 406 0
	movl	%r12d, %ecx	# ab_jid_idx, ab_jid_idx
# src/sabd-enclave.c:405:         sgxsd_msg_buf_t reply_buf = {
	.loc 1 405 0
	leaq	(%r14,%rcx), %rdi	#, tmp179
	movq	%rdi, 24(%rsp)	# tmp179, %sfp
	vmovdqa	24(%rsp), %xmm1	# %sfp, tmp181
	vpinsrd	$2, %esi, %xmm1, %xmm0	#, _10, tmp181, tmp153
	vmovaps	%xmm0, 8(%rsp)	# tmp153, %sfp
	vmovdqa	8(%rsp), %xmm2	# %sfp, tmp182
# src/sabd-enclave.c:410:         sgx_status_t reply_res = sgxsd_enclave_server_reply(reply_buf, p_msg->from);
	.loc 1 410 0
	movq	16(%rsp), %rsi	# %sfp, tmp174
# src/sabd-enclave.c:405:         sgxsd_msg_buf_t reply_buf = {
	.loc 1 405 0
	vmovaps	%xmm2, 24(%rsp)	# tmp182, %sfp
# src/sabd-enclave.c:410:         sgx_status_t reply_res = sgxsd_enclave_server_reply(reply_buf, p_msg->from);
	.loc 1 410 0
	pushq	32(%rbx)	# p_msg_113->from
	.cfi_def_cfa_offset 128
	pushq	24(%rbx)	# p_msg_113->from
	.cfi_def_cfa_offset 136
	pushq	16(%rbx)	# p_msg_113->from
	.cfi_def_cfa_offset 144
	pushq	8(%rbx)	# p_msg_113->from
	.cfi_def_cfa_offset 152
	pushq	(%rbx)	# p_msg_113->from
	.cfi_def_cfa_offset 160
	movq	48(%rsp), %rdi	# %sfp,
	call	sgxsd_enclave_server_reply@PLT	#
.LVL284:
# src/sabd-enclave.c:411:         if (replies_res == SGX_SUCCESS) {
	.loc 1 411 0
	addq	$48, %rsp	#,
	.cfi_def_cfa_offset 112
	movl	44(%rsp), %r8d	# %sfp,
.LBE1355:
# src/sabd-enclave.c:417:       memset_s(p_msg, sizeof(*p_msg), 0, sizeof(*p_msg));
	.loc 1 417 0
	xorl	%edx, %edx	#
.LBB1356:
# src/sabd-enclave.c:410:         sgx_status_t reply_res = sgxsd_enclave_server_reply(reply_buf, p_msg->from);
	.loc 1 410 0
	movl	%eax, %r13d	#, <retval>
.LBE1356:
# src/sabd-enclave.c:416:       sabd_msg_t *p_prev_msg = p_msg->prev;
	.loc 1 416 0
	movq	48(%rbx), %r15	# p_msg_113->prev, p_msg
.LVL285:
# src/sabd-enclave.c:417:       memset_s(p_msg, sizeof(*p_msg), 0, sizeof(*p_msg));
	.loc 1 417 0
	movl	$56, %ecx	#,
	movq	%rbx, %rdi	# p_msg,
	movl	$56, %esi	#,
.LBB1357:
# src/sabd-enclave.c:411:         if (replies_res == SGX_SUCCESS) {
	.loc 1 411 0
	testl	%r8d, %r8d	#
	jne	.L199	#,
.LVL286:
.LBE1357:
# src/sabd-enclave.c:417:       memset_s(p_msg, sizeof(*p_msg), 0, sizeof(*p_msg));
	.loc 1 417 0
	call	memset_s@PLT	#
.LVL287:
# src/sabd-enclave.c:418:       free(p_msg);
	.loc 1 418 0
	movq	%rbx, %rdi	# p_msg,
	call	free@PLT	#
.LVL288:
.LBE1359:
# src/sabd-enclave.c:402:     for (sabd_msg_t *p_msg = p_state->msgs; p_msg != NULL;) {
	.loc 1 402 0
	testq	%r15, %r15	# p_msg
	jne	.L166	#,
.L167:
.LBE1363:
# src/sabd-enclave.c:422:     free(in_ab_jids_result);
	.loc 1 422 0
	movq	%r14, %rdi	# in_ab_jids_result,
	call	free@PLT	#
.LVL289:
.LBE1369:
# src/sabd-enclave.c:427:   size_t state_size = sizeof(sabd_state_t) + sizeof(jid_t) * p_state->max_ab_jids;
	.loc 1 427 0
	movl	12(%rbp), %r9d	# p_state_34(D)->max_ab_jids, p_state_34(D)->max_ab_jids
# src/sabd-enclave.c:428:   memset_s(p_state, state_size, 0, state_size);
	.loc 1 428 0
	xorl	%edx, %edx	#
	movq	%rbp, %rdi	# p_state,
# src/sabd-enclave.c:427:   size_t state_size = sizeof(sabd_state_t) + sizeof(jid_t) * p_state->max_ab_jids;
	.loc 1 427 0
	leaq	64(,%r9,8), %rsi	#, state_size
.LVL290:
# src/sabd-enclave.c:428:   memset_s(p_state, state_size, 0, state_size);
	.loc 1 428 0
	movq	%rsi, %rcx	# state_size,
	call	memset_s@PLT	#
.LVL291:
# src/sabd-enclave.c:429:   free(p_state);
	.loc 1 429 0
	movq	%rbp, %rdi	# p_state,
# src/sabd-enclave.c:432:       return SGX_ERROR_UNEXPECTED;
	.loc 1 432 0
	movl	$1, %ebp	#, tmp175
.LVL292:
# src/sabd-enclave.c:429:   free(p_state);
	.loc 1 429 0
	call	free@PLT	#
.LVL293:
# src/sabd-enclave.c:432:       return SGX_ERROR_UNEXPECTED;
	.loc 1 432 0
	cmpl	$2, %r13d	#, <retval>
.LVL294:
	cmove	%ebp, %r13d	# <retval>,, tmp175, <retval>
.LVL295:
	jmp	.L190	#
.LVL296:
	.p2align 4,,10
	.p2align 3
.L198:
.LBB1370:
.LBB1364:
# src/sabd-enclave.c:402:     for (sabd_msg_t *p_msg = p_state->msgs; p_msg != NULL;) {
	.loc 1 402 0
	movq	0(%rbp), %rbx	# p_state_34(D)->msgs, p_msg
.LVL297:
.LBE1364:
# src/sabd-enclave.c:398:       lookup_res = SGX_ERROR_OUT_OF_MEMORY;
	.loc 1 398 0
	movl	$3, %r13d	#, <retval>
.LBB1365:
# src/sabd-enclave.c:402:     for (sabd_msg_t *p_msg = p_state->msgs; p_msg != NULL;) {
	.loc 1 402 0
	testq	%rbx, %rbx	# p_msg
	jne	.L163	#,
	jmp	.L189	#
.LBE1365:
.LBE1370:
	.cfi_endproc
.LFE5018:
	.size	sgxsd_enclave_server_terminate, .-sgxsd_enclave_server_terminate
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.quad	-8
	.quad	-7
	.quad	-6
	.quad	-5
	.align 32
.LC1:
	.quad	-12
	.quad	-11
	.quad	-10
	.quad	-9
	.align 32
.LC2:
	.quad	-4
	.quad	-3
	.quad	-2
	.quad	-1
	.align 32
.LC3:
	.long	4294967284
	.long	-1
	.long	4294967285
	.long	-1
	.long	4294967286
	.long	-1
	.long	4294967287
	.long	-1
	.align 32
.LC4:
	.long	4294967288
	.long	-1
	.long	4294967289
	.long	-1
	.long	4294967290
	.long	-1
	.long	4294967291
	.long	-1
	.align 32
.LC5:
	.long	4294967292
	.long	-1
	.long	4294967293
	.long	-1
	.long	4294967294
	.long	-1
	.long	4294967295
	.long	-1
	.align 32
.LC6:
	.long	4294967295
	.long	-1
	.long	4294967295
	.long	-1
	.long	4294967295
	.long	-1
	.long	4294967295
	.long	-1
	.text
.Letext0:
	.file 8 "linux-sgx-sgx_2.1.3-g75dd558bdaff/common/inc/tlibc/sys/_types.h"
	.file 9 "linux-sgx-sgx_2.1.3-g75dd558bdaff/common/inc/tlibc/stdlib.h"
	.file 10 "linux-sgx-sgx_2.1.3-g75dd558bdaff/common/inc/tlibc/sys/stdint.h"
	.file 11 "include/sabd.h"
	.file 12 "linux-sgx-sgx_2.1.3-g75dd558bdaff/common/inc/sgx_error.h"
	.file 13 "include/sgxsd.h"
	.file 14 "include/sgxsd-enclave.h"
	.file 15 "linux-sgx-sgx_2.1.3-g75dd558bdaff/common/inc/sgx_trts.h"
	.file 16 "linux-sgx-sgx_2.1.3-g75dd558bdaff/common/inc/tlibc/string.h"
	.file 17 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x2d7f
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF252
	.byte	0xc
	.long	.LASF253
	.long	.LASF254
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF3
	.byte	0x8
	.byte	0x28
	.long	0x3f
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF2
	.uleb128 0x3
	.long	.LASF4
	.byte	0x8
	.byte	0x2a
	.long	0x58
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x5
	.long	0x5f
	.uleb128 0x3
	.long	.LASF6
	.byte	0x8
	.byte	0x2c
	.long	0x76
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0x3
	.long	.LASF8
	.byte	0x8
	.byte	0x2e
	.long	0x88
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF9
	.uleb128 0x3
	.long	.LASF10
	.byte	0x8
	.byte	0x2f
	.long	0x9a
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF11
	.uleb128 0x3
	.long	.LASF12
	.byte	0x8
	.byte	0x66
	.long	0x9a
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF13
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF14
	.uleb128 0x6
	.byte	0x8
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF15
	.uleb128 0x3
	.long	.LASF16
	.byte	0x9
	.byte	0x2b
	.long	0xa1
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF17
	.uleb128 0x3
	.long	.LASF18
	.byte	0xa
	.byte	0x21
	.long	0x34
	.uleb128 0x7
	.long	0xd5
	.uleb128 0x3
	.long	.LASF19
	.byte	0xa
	.byte	0x2b
	.long	0x4d
	.uleb128 0x7
	.long	0xe5
	.uleb128 0x3
	.long	.LASF20
	.byte	0xa
	.byte	0x35
	.long	0x6b
	.uleb128 0x3
	.long	.LASF21
	.byte	0xa
	.byte	0x3a
	.long	0x7d
	.uleb128 0x3
	.long	.LASF22
	.byte	0xa
	.byte	0x3f
	.long	0x8f
	.uleb128 0x3
	.long	.LASF23
	.byte	0x4
	.byte	0x29
	.long	0x121
	.uleb128 0x8
	.long	0xce
	.long	0x12d
	.uleb128 0x9
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.long	.LASF24
	.byte	0x4
	.byte	0x2a
	.long	0x138
	.uleb128 0x8
	.long	0x144
	.long	0x144
	.uleb128 0x9
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF25
	.uleb128 0x3
	.long	.LASF26
	.byte	0x4
	.byte	0x2b
	.long	0x156
	.uleb128 0x8
	.long	0x5f
	.long	0x162
	.uleb128 0x9
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.long	.LASF27
	.byte	0x4
	.byte	0x35
	.long	0x16d
	.uleb128 0x8
	.long	0xce
	.long	0x179
	.uleb128 0x9
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.long	.LASF28
	.byte	0x6
	.byte	0x29
	.long	0x184
	.uleb128 0x8
	.long	0xac
	.long	0x190
	.uleb128 0x9
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.long	.LASF29
	.byte	0x6
	.byte	0x2b
	.long	0x19b
	.uleb128 0x8
	.long	0xce
	.long	0x1a7
	.uleb128 0x9
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.long	.LASF30
	.byte	0x6
	.byte	0x2c
	.long	0x1b2
	.uleb128 0x8
	.long	0x144
	.long	0x1be
	.uleb128 0x9
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.long	.LASF31
	.byte	0x6
	.byte	0x31
	.long	0x1c9
	.uleb128 0x8
	.long	0xbc
	.long	0x1d5
	.uleb128 0x9
	.byte	0x1f
	.byte	0
	.uleb128 0x3
	.long	.LASF32
	.byte	0x6
	.byte	0x39
	.long	0x1e5
	.uleb128 0x7
	.long	0x1d5
	.uleb128 0x8
	.long	0xce
	.long	0x1f1
	.uleb128 0x9
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.long	.LASF33
	.byte	0x6
	.byte	0x3b
	.long	0x1fc
	.uleb128 0x8
	.long	0xac
	.long	0x208
	.uleb128 0x9
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.long	.LASF34
	.byte	0xb
	.byte	0x1a
	.long	0x10b
	.uleb128 0x5
	.long	0x208
	.uleb128 0xa
	.long	.LASF36
	.byte	0x4
	.byte	0xb
	.byte	0x1c
	.long	0x231
	.uleb128 0xb
	.long	.LASF38
	.byte	0xb
	.byte	0x1d
	.long	0xf5
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	.LASF35
	.byte	0xb
	.byte	0x1e
	.long	0x218
	.uleb128 0x5
	.long	0x231
	.uleb128 0xa
	.long	.LASF37
	.byte	0x4
	.byte	0xb
	.byte	0x21
	.long	0x25a
	.uleb128 0xb
	.long	.LASF39
	.byte	0xb
	.byte	0x22
	.long	0xf5
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	.LASF40
	.byte	0xb
	.byte	0x23
	.long	0x241
	.uleb128 0x5
	.long	0x25a
	.uleb128 0xa
	.long	.LASF41
	.byte	0x10
	.byte	0xb
	.byte	0x26
	.long	0x28f
	.uleb128 0xb
	.long	.LASF42
	.byte	0xb
	.byte	0x27
	.long	0x28f
	.byte	0
	.uleb128 0xb
	.long	.LASF43
	.byte	0xb
	.byte	0x28
	.long	0xc3
	.byte	0x8
	.byte	0
	.uleb128 0xc
	.byte	0x8
	.long	0x208
	.uleb128 0x3
	.long	.LASF44
	.byte	0xb
	.byte	0x29
	.long	0x26a
	.uleb128 0x5
	.long	0x295
	.uleb128 0xd
	.long	.LASF255
	.byte	0x7
	.byte	0x4
	.long	0x76
	.byte	0xc
	.byte	0x25
	.long	0x46a
	.uleb128 0xe
	.long	.LASF45
	.byte	0
	.uleb128 0xe
	.long	.LASF46
	.byte	0x1
	.uleb128 0xe
	.long	.LASF47
	.byte	0x2
	.uleb128 0xe
	.long	.LASF48
	.byte	0x3
	.uleb128 0xe
	.long	.LASF49
	.byte	0x4
	.uleb128 0xe
	.long	.LASF50
	.byte	0x5
	.uleb128 0xf
	.long	.LASF51
	.value	0x1001
	.uleb128 0xf
	.long	.LASF52
	.value	0x1003
	.uleb128 0xf
	.long	.LASF53
	.value	0x1006
	.uleb128 0xf
	.long	.LASF54
	.value	0x1007
	.uleb128 0xf
	.long	.LASF55
	.value	0x1008
	.uleb128 0xf
	.long	.LASF56
	.value	0x1009
	.uleb128 0xf
	.long	.LASF57
	.value	0x2000
	.uleb128 0xf
	.long	.LASF58
	.value	0x2001
	.uleb128 0xf
	.long	.LASF59
	.value	0x2002
	.uleb128 0xf
	.long	.LASF60
	.value	0x2003
	.uleb128 0xf
	.long	.LASF61
	.value	0x2004
	.uleb128 0xf
	.long	.LASF62
	.value	0x2005
	.uleb128 0xf
	.long	.LASF63
	.value	0x2006
	.uleb128 0xf
	.long	.LASF64
	.value	0x2007
	.uleb128 0xf
	.long	.LASF65
	.value	0x2009
	.uleb128 0xf
	.long	.LASF66
	.value	0x200c
	.uleb128 0xf
	.long	.LASF67
	.value	0x200d
	.uleb128 0xf
	.long	.LASF68
	.value	0x200e
	.uleb128 0xf
	.long	.LASF69
	.value	0x200f
	.uleb128 0xf
	.long	.LASF70
	.value	0x2010
	.uleb128 0xf
	.long	.LASF71
	.value	0x2011
	.uleb128 0xf
	.long	.LASF72
	.value	0x3001
	.uleb128 0xf
	.long	.LASF73
	.value	0x3002
	.uleb128 0xf
	.long	.LASF74
	.value	0x3003
	.uleb128 0xf
	.long	.LASF75
	.value	0x3004
	.uleb128 0xf
	.long	.LASF76
	.value	0x3005
	.uleb128 0xf
	.long	.LASF77
	.value	0x4001
	.uleb128 0xf
	.long	.LASF78
	.value	0x4002
	.uleb128 0xf
	.long	.LASF79
	.value	0x4003
	.uleb128 0xf
	.long	.LASF80
	.value	0x4004
	.uleb128 0xf
	.long	.LASF81
	.value	0x4005
	.uleb128 0xf
	.long	.LASF82
	.value	0x4006
	.uleb128 0xf
	.long	.LASF83
	.value	0x4007
	.uleb128 0xf
	.long	.LASF84
	.value	0x4008
	.uleb128 0xf
	.long	.LASF85
	.value	0x400a
	.uleb128 0xf
	.long	.LASF86
	.value	0x400c
	.uleb128 0xf
	.long	.LASF87
	.value	0x400d
	.uleb128 0xf
	.long	.LASF88
	.value	0x400e
	.uleb128 0xf
	.long	.LASF89
	.value	0x400f
	.uleb128 0xf
	.long	.LASF90
	.value	0x4011
	.uleb128 0xf
	.long	.LASF91
	.value	0x4012
	.uleb128 0xf
	.long	.LASF92
	.value	0x5002
	.uleb128 0xf
	.long	.LASF93
	.value	0x6001
	.uleb128 0xf
	.long	.LASF94
	.value	0x6002
	.uleb128 0xf
	.long	.LASF95
	.value	0x6003
	.uleb128 0xf
	.long	.LASF96
	.value	0x6004
	.uleb128 0xf
	.long	.LASF97
	.value	0x6005
	.uleb128 0xf
	.long	.LASF98
	.value	0x7001
	.uleb128 0xf
	.long	.LASF99
	.value	0x7002
	.uleb128 0xf
	.long	.LASF100
	.value	0x7003
	.uleb128 0xf
	.long	.LASF101
	.value	0x7004
	.uleb128 0xf
	.long	.LASF102
	.value	0x7005
	.uleb128 0xf
	.long	.LASF103
	.value	0x7006
	.uleb128 0xf
	.long	.LASF104
	.value	0x7007
	.uleb128 0xf
	.long	.LASF105
	.value	0x7008
	.uleb128 0xf
	.long	.LASF106
	.value	0x7009
	.uleb128 0xf
	.long	.LASF107
	.value	0xf001
	.byte	0
	.uleb128 0x3
	.long	.LASF108
	.byte	0xc
	.byte	0x73
	.long	0x2a5
	.uleb128 0x10
	.long	0xd5
	.long	0x485
	.uleb128 0x11
	.long	0x9a
	.byte	0x1f
	.byte	0
	.uleb128 0xa
	.long	.LASF109
	.byte	0x20
	.byte	0xd
	.byte	0x33
	.long	0x49e
	.uleb128 0xb
	.long	.LASF110
	.byte	0xd
	.byte	0x34
	.long	0x475
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	.LASF111
	.byte	0xd
	.byte	0x35
	.long	0x485
	.uleb128 0x12
	.byte	0x8
	.byte	0xd
	.byte	0x55
	.long	0x4c8
	.uleb128 0x13
	.long	.LASF112
	.byte	0xd
	.byte	0x56
	.long	0xba
	.uleb128 0x14
	.string	"tag"
	.byte	0xd
	.byte	0x57
	.long	0x10b
	.byte	0
	.uleb128 0xa
	.long	.LASF113
	.byte	0x8
	.byte	0xd
	.byte	0x54
	.long	0x4db
	.uleb128 0x15
	.long	0x4a9
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	.LASF114
	.byte	0xd
	.byte	0x59
	.long	0x4c8
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF115
	.uleb128 0xa
	.long	.LASF116
	.byte	0x10
	.byte	0xe
	.byte	0x1c
	.long	0x512
	.uleb128 0xb
	.long	.LASF110
	.byte	0xe
	.byte	0x1d
	.long	0x512
	.byte	0
	.uleb128 0xb
	.long	.LASF117
	.byte	0xe
	.byte	0x1e
	.long	0xf5
	.byte	0x8
	.byte	0
	.uleb128 0xc
	.byte	0x8
	.long	0xd5
	.uleb128 0x3
	.long	.LASF118
	.byte	0xe
	.byte	0x1f
	.long	0x4ed
	.uleb128 0xa
	.long	.LASF119
	.byte	0x28
	.byte	0xe
	.byte	0x21
	.long	0x548
	.uleb128 0x16
	.string	"tag"
	.byte	0xe
	.byte	0x22
	.long	0x4db
	.byte	0
	.uleb128 0xb
	.long	.LASF120
	.byte	0xe
	.byte	0x23
	.long	0x49e
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF121
	.byte	0xe
	.byte	0x24
	.long	0x523
	.uleb128 0x17
	.long	.LASF256
	.byte	0x40
	.byte	0x40
	.byte	0x1
	.value	0x12c
	.long	0x597
	.uleb128 0x18
	.long	.LASF122
	.byte	0x1
	.value	0x12d
	.long	0x621
	.byte	0
	.uleb128 0x18
	.long	.LASF39
	.byte	0x1
	.value	0x12e
	.long	0x597
	.byte	0x8
	.uleb128 0x18
	.long	.LASF38
	.byte	0x1
	.value	0x12f
	.long	0x597
	.byte	0xc
	.uleb128 0x19
	.long	.LASF149
	.byte	0x1
	.value	0x130
	.long	0x627
	.byte	0x40
	.byte	0x40
	.byte	0
	.uleb128 0x3
	.long	.LASF123
	.byte	0x1
	.byte	0x38
	.long	0xf5
	.uleb128 0x5
	.long	0x597
	.uleb128 0xa
	.long	.LASF124
	.byte	0xb0
	.byte	0x1
	.byte	0x39
	.long	0x5bf
	.uleb128 0x16
	.string	"sk"
	.byte	0x1
	.byte	0x3a
	.long	0x5bf
	.byte	0
	.byte	0
	.uleb128 0x10
	.long	0x162
	.long	0x5cf
	.uleb128 0x11
	.long	0x9a
	.byte	0xa
	.byte	0
	.uleb128 0x3
	.long	.LASF125
	.byte	0x1
	.byte	0x3b
	.long	0x5a7
	.uleb128 0x1a
	.long	.LASF126
	.byte	0x38
	.byte	0x1
	.value	0x126
	.long	0x60f
	.uleb128 0x18
	.long	.LASF127
	.byte	0x1
	.value	0x127
	.long	0x548
	.byte	0
	.uleb128 0x18
	.long	.LASF39
	.byte	0x1
	.value	0x128
	.long	0x597
	.byte	0x28
	.uleb128 0x18
	.long	.LASF128
	.byte	0x1
	.value	0x129
	.long	0x60f
	.byte	0x30
	.byte	0
	.uleb128 0xc
	.byte	0x8
	.long	0x5da
	.uleb128 0x1b
	.long	.LASF129
	.byte	0x1
	.value	0x12a
	.long	0x5da
	.uleb128 0xc
	.byte	0x8
	.long	0x615
	.uleb128 0x10
	.long	0x208
	.long	0x636
	.uleb128 0x1c
	.long	0x9a
	.byte	0
	.uleb128 0x1d
	.long	.LASF257
	.byte	0x1
	.value	0x131
	.long	0x553
	.byte	0x40
	.uleb128 0x1e
	.long	.LASF143
	.byte	0x1
	.value	0x16a
	.long	0x46a
	.quad	.LFB5018
	.quad	.LFE5018-.LFB5018
	.uleb128 0x1
	.byte	0x9c
	.long	0x968
	.uleb128 0x1f
	.long	.LASF130
	.byte	0x1
	.value	0x16a
	.long	0x968
	.long	.LLST137
	.uleb128 0x1f
	.long	.LASF131
	.byte	0x1
	.value	0x16a
	.long	0x96e
	.long	.LLST138
	.uleb128 0x20
	.long	.LASF132
	.byte	0x1
	.value	0x16f
	.long	0x46a
	.long	.LLST139
	.uleb128 0x20
	.long	.LASF133
	.byte	0x1
	.value	0x170
	.long	0xc3
	.long	.LLST140
	.uleb128 0x20
	.long	.LASF134
	.byte	0x1
	.value	0x17f
	.long	0x46a
	.long	.LLST141
	.uleb128 0x20
	.long	.LASF135
	.byte	0x1
	.value	0x180
	.long	0x46a
	.long	.LLST142
	.uleb128 0x20
	.long	.LASF136
	.byte	0x1
	.value	0x1ab
	.long	0xc3
	.long	.LLST143
	.uleb128 0x21
	.long	.Ldebug_ranges0+0xbc0
	.long	0x705
	.uleb128 0x20
	.long	.LASF137
	.byte	0x1
	.value	0x175
	.long	0xc3
	.long	.LLST144
	.uleb128 0x22
	.quad	.LVL250
	.long	0x2d31
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x4
	.byte	0x7c
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	.Ldebug_ranges0+0xc10
	.long	0x895
	.uleb128 0x20
	.long	.LASF138
	.byte	0x1
	.value	0x182
	.long	0x512
	.long	.LLST145
	.uleb128 0x20
	.long	.LASF139
	.byte	0x1
	.value	0x191
	.long	0x597
	.long	.LLST146
	.uleb128 0x21
	.long	.Ldebug_ranges0+0xc70
	.long	0x829
	.uleb128 0x20
	.long	.LASF140
	.byte	0x1
	.value	0x192
	.long	0x621
	.long	.LLST147
	.uleb128 0x24
	.long	.Ldebug_ranges0+0xcf0
	.uleb128 0x20
	.long	.LASF141
	.byte	0x1
	.value	0x1a0
	.long	0x621
	.long	.LLST148
	.uleb128 0x21
	.long	.Ldebug_ranges0+0xd30
	.long	0x78f
	.uleb128 0x25
	.long	.LASF152
	.byte	0x1
	.value	0x195
	.long	0x518
	.uleb128 0x20
	.long	.LASF142
	.byte	0x1
	.value	0x19a
	.long	0x46a
	.long	.LLST149
	.uleb128 0x26
	.quad	.LVL284
	.long	0x2d3c
	.byte	0
	.uleb128 0x27
	.quad	.LVL258
	.long	0x2d47
	.long	0x7b8
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0x38
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x38
	.byte	0
	.uleb128 0x26
	.quad	.LVL260
	.long	0x2d52
	.uleb128 0x26
	.quad	.LVL279
	.long	0x2d47
	.uleb128 0x27
	.quad	.LVL280
	.long	0x2d52
	.long	0x7ea
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x27
	.quad	.LVL287
	.long	0x2d47
	.long	0x813
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0x38
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x38
	.byte	0
	.uleb128 0x22
	.quad	.LVL288
	.long	0x2d52
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x26
	.quad	.LVL253
	.long	0x2d5d
	.uleb128 0x27
	.quad	.LVL262
	.long	0x2d52
	.long	0x84e
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x26
	.quad	.LVL272
	.long	0x2d5d
	.uleb128 0x27
	.quad	.LVL274
	.long	0xb09
	.long	0x880
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x76
	.sleb128 64
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x22
	.quad	.LVL289
	.long	0x2d52
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x27
	.quad	.LVL246
	.long	0x2d47
	.long	0x8b2
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x27
	.quad	.LVL247
	.long	0x2d52
	.long	0x8ca
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x27
	.quad	.LVL264
	.long	0x2d47
	.long	0x8e7
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x27
	.quad	.LVL265
	.long	0x2d52
	.long	0x8ff
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x27
	.quad	.LVL270
	.long	0x2d47
	.long	0x91d
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x27
	.quad	.LVL271
	.long	0x2d52
	.long	0x935
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x27
	.quad	.LVL291
	.long	0x2d47
	.long	0x952
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x22
	.quad	.LVL293
	.long	0x2d52
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x8
	.long	0x2a0
	.uleb128 0xc
	.byte	0x8
	.long	0x636
	.uleb128 0x1e
	.long	.LASF144
	.byte	0x1
	.value	0x147
	.long	0x46a
	.quad	.LFB5017
	.quad	.LFE5017-.LFB5017
	.uleb128 0x1
	.byte	0x9c
	.long	0xa51
	.uleb128 0x1f
	.long	.LASF130
	.byte	0x1
	.value	0x147
	.long	0xa51
	.long	.LLST132
	.uleb128 0x28
	.string	"msg"
	.byte	0x1
	.value	0x148
	.long	0x518
	.long	.LLST133
	.uleb128 0x29
	.long	.LASF127
	.byte	0x1
	.value	0x148
	.long	0x548
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1f
	.long	.LASF145
	.byte	0x1
	.value	0x149
	.long	0xa57
	.long	.LLST134
	.uleb128 0x20
	.long	.LASF131
	.byte	0x1
	.value	0x14a
	.long	0x96e
	.long	.LLST135
	.uleb128 0x20
	.long	.LASF146
	.byte	0x1
	.value	0x159
	.long	0x621
	.long	.LLST136
	.uleb128 0x27
	.quad	.LVL230
	.long	0x2d5d
	.long	0xa0d
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x38
	.byte	0
	.uleb128 0x27
	.quad	.LVL233
	.long	0x2d68
	.long	0xa2b
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x8
	.byte	0x7c
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0
	.uleb128 0x22
	.quad	.LVL234
	.long	0x2d47
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0x28
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x28
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x8
	.long	0x265
	.uleb128 0xc
	.byte	0x8
	.long	0x96e
	.uleb128 0x1e
	.long	.LASF147
	.byte	0x1
	.value	0x133
	.long	0x46a
	.quad	.LFB5016
	.quad	.LFE5016-.LFB5016
	.uleb128 0x1
	.byte	0x9c
	.long	0xb03
	.uleb128 0x1f
	.long	.LASF130
	.byte	0x1
	.value	0x133
	.long	0xb03
	.long	.LLST128
	.uleb128 0x1f
	.long	.LASF145
	.byte	0x1
	.value	0x133
	.long	0xa57
	.long	.LLST129
	.uleb128 0x20
	.long	.LASF136
	.byte	0x1
	.value	0x139
	.long	0xc3
	.long	.LLST130
	.uleb128 0x20
	.long	.LASF131
	.byte	0x1
	.value	0x13a
	.long	0x96e
	.long	.LLST131
	.uleb128 0x27
	.quad	.LVL212
	.long	0x2d77
	.long	0xadd
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x40
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x22
	.quad	.LVL215
	.long	0x2d47
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x8
	.long	0x23c
	.uleb128 0x2a
	.long	.LASF148
	.byte	0x1
	.byte	0x68
	.long	0x46a
	.quad	.LFB5015
	.quad	.LFE5015-.LFB5015
	.uleb128 0x1
	.byte	0x9c
	.long	0x27c1
	.uleb128 0x2b
	.long	.LASF42
	.byte	0x1
	.byte	0x68
	.long	0x27c1
	.long	.LLST0
	.uleb128 0x2b
	.long	.LASF43
	.byte	0x1
	.byte	0x68
	.long	0xc3
	.long	.LLST1
	.uleb128 0x2b
	.long	.LASF149
	.byte	0x1
	.byte	0x69
	.long	0x27c1
	.long	.LLST2
	.uleb128 0x2b
	.long	.LASF39
	.byte	0x1
	.byte	0x69
	.long	0x597
	.long	.LLST3
	.uleb128 0x2b
	.long	.LASF138
	.byte	0x1
	.byte	0x6a
	.long	0x27c7
	.long	.LLST4
	.uleb128 0x2c
	.long	.LASF150
	.byte	0x1
	.byte	0x6b
	.long	0x5a2
	.byte	0xc
	.uleb128 0x2d
	.long	.LASF151
	.byte	0x1
	.byte	0x6e
	.long	0xf5
	.long	.LLST5
	.uleb128 0x2e
	.long	.LASF153
	.byte	0x1
	.byte	0x78
	.long	0x597
	.uleb128 0x2e
	.long	.LASF154
	.byte	0x1
	.byte	0x7a
	.long	0x597
	.uleb128 0x2e
	.long	.LASF155
	.byte	0x1
	.byte	0x7e
	.long	0xc3
	.uleb128 0x2d
	.long	.LASF156
	.byte	0x1
	.byte	0x7f
	.long	0x28f
	.long	.LLST6
	.uleb128 0x2d
	.long	.LASF157
	.byte	0x1
	.byte	0x84
	.long	0xc3
	.long	.LLST7
	.uleb128 0x2d
	.long	.LASF158
	.byte	0x1
	.byte	0x85
	.long	0x27cd
	.long	.LLST8
	.uleb128 0x2d
	.long	.LASF159
	.byte	0x1
	.byte	0x94
	.long	0x5cf
	.long	.LLST9
	.uleb128 0x2d
	.long	.LASF160
	.byte	0x1
	.byte	0x95
	.long	0x4e6
	.long	.LLST10
	.uleb128 0x21
	.long	.Ldebug_ranges0+0
	.long	0x20a2
	.uleb128 0x2d
	.long	.LASF161
	.byte	0x1
	.byte	0x96
	.long	0xf5
	.long	.LLST12
	.uleb128 0x24
	.long	.Ldebug_ranges0+0x50
	.uleb128 0x2f
	.long	.LASF162
	.byte	0x1
	.byte	0x98
	.long	0x27d3
	.uleb128 0x2
	.byte	0x76
	.sleb128 -64
	.uleb128 0x2d
	.long	.LASF163
	.byte	0x1
	.byte	0x99
	.long	0x4e6
	.long	.LLST13
	.uleb128 0x2d
	.long	.LASF164
	.byte	0x1
	.byte	0xa6
	.long	0x4e6
	.long	.LLST14
	.uleb128 0x21
	.long	.Ldebug_ranges0+0x300
	.long	0xc98
	.uleb128 0x2e
	.long	.LASF165
	.byte	0x1
	.byte	0x9a
	.long	0xf5
	.uleb128 0x30
	.long	0x288d
	.quad	.LBB973
	.long	.Ldebug_ranges0+0x330
	.byte	0x1
	.byte	0x9b
	.long	0xc7a
	.uleb128 0x31
	.long	0x289d
	.long	.LLST43
	.byte	0
	.uleb128 0x32
	.long	0x288d
	.quad	.LBB984
	.long	.Ldebug_ranges0+0x3e0
	.byte	0x1
	.byte	0x9b
	.uleb128 0x31
	.long	0x289d
	.long	.LLST44
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	.Ldebug_ranges0+0xa0
	.long	0x125b
	.uleb128 0x2d
	.long	.LASF166
	.byte	0x1
	.byte	0xa7
	.long	0x597
	.long	.LLST15
	.uleb128 0x24
	.long	.Ldebug_ranges0+0x100
	.uleb128 0x2d
	.long	.LASF167
	.byte	0x1
	.byte	0xaa
	.long	0x27e3
	.long	.LLST16
	.uleb128 0x2d
	.long	.LASF168
	.byte	0x1
	.byte	0xab
	.long	0x27e3
	.long	.LLST17
	.uleb128 0x2d
	.long	.LASF169
	.byte	0x1
	.byte	0xb0
	.long	0x597
	.long	.LLST18
	.uleb128 0x2e
	.long	.LASF170
	.byte	0x1
	.byte	0xd0
	.long	0x1d5
	.uleb128 0x2e
	.long	.LASF171
	.byte	0x1
	.byte	0xd6
	.long	0x27f3
	.uleb128 0x21
	.long	.Ldebug_ranges0+0x160
	.long	0x11d0
	.uleb128 0x2d
	.long	.LASF139
	.byte	0x1
	.byte	0xb1
	.long	0x597
	.long	.LLST19
	.uleb128 0x24
	.long	.Ldebug_ranges0+0x1d0
	.uleb128 0x2d
	.long	.LASF172
	.byte	0x1
	.byte	0xb2
	.long	0x208
	.long	.LLST20
	.uleb128 0x2e
	.long	.LASF173
	.byte	0x1
	.byte	0xb3
	.long	0x1d5
	.uleb128 0x2e
	.long	.LASF174
	.byte	0x1
	.byte	0xb4
	.long	0x597
	.uleb128 0x2d
	.long	.LASF175
	.byte	0x1
	.byte	0xb7
	.long	0x10b
	.long	.LLST21
	.uleb128 0x2e
	.long	.LASF176
	.byte	0x1
	.byte	0xbe
	.long	0x1d5
	.uleb128 0x2d
	.long	.LASF177
	.byte	0x1
	.byte	0xc1
	.long	0x4e6
	.long	.LLST22
	.uleb128 0x2d
	.long	.LASF178
	.byte	0x1
	.byte	0xc4
	.long	0x10b
	.long	.LLST23
	.uleb128 0x30
	.long	0x27ff
	.quad	.LBB881
	.long	.Ldebug_ranges0+0x210
	.byte	0x1
	.byte	0xb4
	.long	0xfd7
	.uleb128 0x33
	.long	0x2825
	.uleb128 0x31
	.long	0x281a
	.long	.LLST24
	.uleb128 0x31
	.long	0x280f
	.long	.LLST25
	.uleb128 0x24
	.long	.Ldebug_ranges0+0x210
	.uleb128 0x34
	.long	0x2830
	.uleb128 0x35
	.long	0x2c33
	.quad	.LBB883
	.quad	.LBE883-.LBB883
	.byte	0x1
	.byte	0x58
	.long	0xdee
	.uleb128 0x33
	.long	0x2c44
	.uleb128 0x36
	.long	0x2ccf
	.quad	.LBB884
	.quad	.LBE884-.LBB884
	.byte	0x4
	.value	0x5e8
	.uleb128 0x33
	.long	0x2cec
	.uleb128 0x33
	.long	0x2ce0
	.byte	0
	.byte	0
	.uleb128 0x35
	.long	0x2c7b
	.quad	.LBB886
	.quad	.LBE886-.LBB886
	.byte	0x1
	.byte	0x59
	.long	0xe14
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x33
	.long	0x2c8c
	.byte	0
	.uleb128 0x35
	.long	0x2c0c
	.quad	.LBB888
	.quad	.LBE888-.LBB888
	.byte	0x1
	.byte	0x5a
	.long	0xe3e
	.uleb128 0x31
	.long	0x2c27
	.long	.LLST26
	.uleb128 0x33
	.long	0x2c1c
	.byte	0
	.uleb128 0x35
	.long	0x2c0c
	.quad	.LBB890
	.quad	.LBE890-.LBB890
	.byte	0x1
	.byte	0x5b
	.long	0xe68
	.uleb128 0x31
	.long	0x2c27
	.long	.LLST27
	.uleb128 0x33
	.long	0x2c1c
	.byte	0
	.uleb128 0x35
	.long	0x2c0c
	.quad	.LBB892
	.quad	.LBE892-.LBB892
	.byte	0x1
	.byte	0x5c
	.long	0xe92
	.uleb128 0x31
	.long	0x2c27
	.long	.LLST28
	.uleb128 0x33
	.long	0x2c1c
	.byte	0
	.uleb128 0x35
	.long	0x2c0c
	.quad	.LBB894
	.quad	.LBE894-.LBB894
	.byte	0x1
	.byte	0x5d
	.long	0xebc
	.uleb128 0x31
	.long	0x2c27
	.long	.LLST29
	.uleb128 0x33
	.long	0x2c1c
	.byte	0
	.uleb128 0x35
	.long	0x2c0c
	.quad	.LBB896
	.quad	.LBE896-.LBB896
	.byte	0x1
	.byte	0x5e
	.long	0xee6
	.uleb128 0x31
	.long	0x2c27
	.long	.LLST30
	.uleb128 0x33
	.long	0x2c1c
	.byte	0
	.uleb128 0x35
	.long	0x2c0c
	.quad	.LBB898
	.quad	.LBE898-.LBB898
	.byte	0x1
	.byte	0x5f
	.long	0xf10
	.uleb128 0x31
	.long	0x2c27
	.long	.LLST31
	.uleb128 0x33
	.long	0x2c1c
	.byte	0
	.uleb128 0x35
	.long	0x2c0c
	.quad	.LBB900
	.quad	.LBE900-.LBB900
	.byte	0x1
	.byte	0x60
	.long	0xf3a
	.uleb128 0x31
	.long	0x2c27
	.long	.LLST32
	.uleb128 0x33
	.long	0x2c1c
	.byte	0
	.uleb128 0x35
	.long	0x2c0c
	.quad	.LBB902
	.quad	.LBE902-.LBB902
	.byte	0x1
	.byte	0x61
	.long	0xf64
	.uleb128 0x31
	.long	0x2c27
	.long	.LLST33
	.uleb128 0x33
	.long	0x2c1c
	.byte	0
	.uleb128 0x35
	.long	0x2c0c
	.quad	.LBB904
	.quad	.LBE904-.LBB904
	.byte	0x1
	.byte	0x62
	.long	0xf8e
	.uleb128 0x31
	.long	0x2c27
	.long	.LLST34
	.uleb128 0x33
	.long	0x2c1c
	.byte	0
	.uleb128 0x35
	.long	0x2be5
	.quad	.LBB906
	.quad	.LBE906-.LBB906
	.byte	0x1
	.byte	0x63
	.long	0xfb8
	.uleb128 0x31
	.long	0x2c00
	.long	.LLST35
	.uleb128 0x33
	.long	0x2bf5
	.byte	0
	.uleb128 0x37
	.long	0x2cf9
	.quad	.LBB908
	.quad	.LBE908-.LBB908
	.byte	0x1
	.byte	0x65
	.uleb128 0x33
	.long	0x2d09
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x30
	.long	0x2b62
	.quad	.LBB918
	.long	.Ldebug_ranges0+0x290
	.byte	0x1
	.byte	0xc1
	.long	0x1001
	.uleb128 0x31
	.long	0x2b7f
	.long	.LLST36
	.uleb128 0x31
	.long	0x2b73
	.long	.LLST36
	.byte	0
	.uleb128 0x35
	.long	0x2927
	.quad	.LBB922
	.quad	.LBE922-.LBB922
	.byte	0x1
	.byte	0xb3
	.long	0x1026
	.uleb128 0x31
	.long	0x2938
	.long	.LLST38
	.byte	0
	.uleb128 0x35
	.long	0x28d9
	.quad	.LBB925
	.quad	.LBE925-.LBB925
	.byte	0x1
	.byte	0xbe
	.long	0x104c
	.uleb128 0x33
	.long	0x28f4
	.uleb128 0x33
	.long	0x28e9
	.byte	0
	.uleb128 0x35
	.long	0x28d9
	.quad	.LBB928
	.quad	.LBE928-.LBB928
	.byte	0x1
	.byte	0xbf
	.long	0x1072
	.uleb128 0x33
	.long	0x28f4
	.uleb128 0x33
	.long	0x28e9
	.byte	0
	.uleb128 0x35
	.long	0x28d9
	.quad	.LBB931
	.quad	.LBE931-.LBB931
	.byte	0x1
	.byte	0xc0
	.long	0x1098
	.uleb128 0x33
	.long	0x28f4
	.uleb128 0x33
	.long	0x28e9
	.byte	0
	.uleb128 0x35
	.long	0x28af
	.quad	.LBB933
	.quad	.LBE933-.LBB933
	.byte	0x1
	.byte	0xbf
	.long	0x10be
	.uleb128 0x33
	.long	0x28cc
	.uleb128 0x33
	.long	0x28c0
	.byte	0
	.uleb128 0x35
	.long	0x2b8c
	.quad	.LBB935
	.quad	.LBE935-.LBB935
	.byte	0x1
	.byte	0xc8
	.long	0x10e9
	.uleb128 0x33
	.long	0x2bb2
	.uleb128 0x33
	.long	0x2ba7
	.uleb128 0x33
	.long	0x2b9c
	.byte	0
	.uleb128 0x35
	.long	0x2b8c
	.quad	.LBB937
	.quad	.LBE937-.LBB937
	.byte	0x1
	.byte	0xc7
	.long	0x1114
	.uleb128 0x33
	.long	0x2bb2
	.uleb128 0x33
	.long	0x2ba7
	.uleb128 0x33
	.long	0x2b9c
	.byte	0
	.uleb128 0x35
	.long	0x2b8c
	.quad	.LBB940
	.quad	.LBE940-.LBB940
	.byte	0x1
	.byte	0xc9
	.long	0x113f
	.uleb128 0x33
	.long	0x2bb2
	.uleb128 0x33
	.long	0x2ba7
	.uleb128 0x33
	.long	0x2b9c
	.byte	0
	.uleb128 0x30
	.long	0x2927
	.quad	.LBB944
	.long	.Ldebug_ranges0+0x2d0
	.byte	0x1
	.byte	0xcb
	.long	0x115c
	.uleb128 0x33
	.long	0x2938
	.byte	0
	.uleb128 0x35
	.long	0x2900
	.quad	.LBB948
	.quad	.LBE948-.LBB948
	.byte	0x1
	.byte	0xcb
	.long	0x1186
	.uleb128 0x33
	.long	0x291b
	.uleb128 0x31
	.long	0x2910
	.long	.LLST39
	.byte	0
	.uleb128 0x35
	.long	0x2900
	.quad	.LBB950
	.quad	.LBE950-.LBB950
	.byte	0x1
	.byte	0xcd
	.long	0x11ac
	.uleb128 0x33
	.long	0x291b
	.uleb128 0x33
	.long	0x2910
	.byte	0
	.uleb128 0x37
	.long	0x2900
	.quad	.LBB952
	.quad	.LBE952-.LBB952
	.byte	0x1
	.byte	0xcc
	.uleb128 0x33
	.long	0x291b
	.uleb128 0x33
	.long	0x2910
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x35
	.long	0x2b8c
	.quad	.LBB960
	.quad	.LBE960-.LBB960
	.byte	0x1
	.byte	0xd1
	.long	0x11ff
	.uleb128 0x33
	.long	0x2bb2
	.uleb128 0x31
	.long	0x2ba7
	.long	.LLST40
	.uleb128 0x33
	.long	0x2b9c
	.byte	0
	.uleb128 0x35
	.long	0x2b8c
	.quad	.LBB962
	.quad	.LBE962-.LBB962
	.byte	0x1
	.byte	0xd2
	.long	0x122e
	.uleb128 0x33
	.long	0x2bb2
	.uleb128 0x31
	.long	0x2ba7
	.long	.LLST41
	.uleb128 0x33
	.long	0x2b9c
	.byte	0
	.uleb128 0x37
	.long	0x2b8c
	.quad	.LBB964
	.quad	.LBE964-.LBB964
	.byte	0x1
	.byte	0xd3
	.uleb128 0x33
	.long	0x2bb2
	.uleb128 0x31
	.long	0x2ba7
	.long	.LLST42
	.uleb128 0x33
	.long	0x2b9c
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x30
	.long	0x283c
	.quad	.LBB1013
	.long	.Ldebug_ranges0+0x490
	.byte	0x1
	.byte	0xa3
	.long	0x2075
	.uleb128 0x31
	.long	0x284c
	.long	.LLST45
	.uleb128 0x24
	.long	.Ldebug_ranges0+0x490
	.uleb128 0x34
	.long	0x2857
	.uleb128 0x30
	.long	0x2ccf
	.quad	.LBB1015
	.long	.Ldebug_ranges0+0x4c0
	.byte	0x1
	.byte	0x48
	.long	0x12af
	.uleb128 0x31
	.long	0x2cec
	.long	.LLST46
	.uleb128 0x31
	.long	0x2ce0
	.long	.LLST47
	.byte	0
	.uleb128 0x30
	.long	0x2869
	.quad	.LBB1020
	.long	.Ldebug_ranges0+0x500
	.byte	0x1
	.byte	0x49
	.long	0x13e7
	.uleb128 0x31
	.long	0x2882
	.long	.LLST48
	.uleb128 0x31
	.long	0x2879
	.long	.LLST49
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1021
	.quad	.LBE1021-.LBB1021
	.byte	0x1
	.byte	0x3f
	.long	0x12fe
	.uleb128 0x33
	.long	0x2cc2
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x35
	.long	0x2c7b
	.quad	.LBB1023
	.quad	.LBE1023-.LBB1023
	.byte	0x1
	.byte	0x3f
	.long	0x1328
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x31
	.long	0x2c8c
	.long	.LLST49
	.byte	0
	.uleb128 0x35
	.long	0x2c51
	.quad	.LBB1025
	.quad	.LBE1025-.LBB1025
	.byte	0x1
	.byte	0x42
	.long	0x134e
	.uleb128 0x33
	.long	0x2c6e
	.uleb128 0x33
	.long	0x2c62
	.byte	0
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1027
	.quad	.LBE1027-.LBB1027
	.byte	0x1
	.byte	0x40
	.long	0x1378
	.uleb128 0x31
	.long	0x2cc2
	.long	.LLST51
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x35
	.long	0x2c7b
	.quad	.LBB1029
	.quad	.LBE1029-.LBB1029
	.byte	0x1
	.byte	0x40
	.long	0x139e
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x33
	.long	0x2c8c
	.byte	0
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1031
	.quad	.LBE1031-.LBB1031
	.byte	0x1
	.byte	0x41
	.long	0x13c8
	.uleb128 0x31
	.long	0x2cc2
	.long	.LLST52
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x32
	.long	0x2c7b
	.quad	.LBB1033
	.long	.Ldebug_ranges0+0x540
	.byte	0x1
	.byte	0x43
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x33
	.long	0x2c8c
	.byte	0
	.byte	0
	.uleb128 0x35
	.long	0x2bbe
	.quad	.LBB1037
	.quad	.LBE1037-.LBB1037
	.byte	0x1
	.byte	0x49
	.long	0x140d
	.uleb128 0x33
	.long	0x2bd9
	.uleb128 0x33
	.long	0x2bce
	.byte	0
	.uleb128 0x30
	.long	0x2869
	.quad	.LBB1041
	.long	.Ldebug_ranges0+0x570
	.byte	0x1
	.byte	0x4a
	.long	0x1545
	.uleb128 0x31
	.long	0x2882
	.long	.LLST53
	.uleb128 0x31
	.long	0x2879
	.long	.LLST54
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1042
	.quad	.LBE1042-.LBB1042
	.byte	0x1
	.byte	0x3f
	.long	0x145c
	.uleb128 0x33
	.long	0x2cc2
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x35
	.long	0x2c7b
	.quad	.LBB1044
	.quad	.LBE1044-.LBB1044
	.byte	0x1
	.byte	0x3f
	.long	0x1486
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x31
	.long	0x2c8c
	.long	.LLST54
	.byte	0
	.uleb128 0x35
	.long	0x2c51
	.quad	.LBB1046
	.quad	.LBE1046-.LBB1046
	.byte	0x1
	.byte	0x42
	.long	0x14ac
	.uleb128 0x33
	.long	0x2c6e
	.uleb128 0x33
	.long	0x2c62
	.byte	0
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1048
	.quad	.LBE1048-.LBB1048
	.byte	0x1
	.byte	0x40
	.long	0x14d6
	.uleb128 0x31
	.long	0x2cc2
	.long	.LLST56
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x35
	.long	0x2c7b
	.quad	.LBB1050
	.quad	.LBE1050-.LBB1050
	.byte	0x1
	.byte	0x40
	.long	0x14fc
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x33
	.long	0x2c8c
	.byte	0
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1052
	.quad	.LBE1052-.LBB1052
	.byte	0x1
	.byte	0x41
	.long	0x1526
	.uleb128 0x31
	.long	0x2cc2
	.long	.LLST57
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x32
	.long	0x2c7b
	.quad	.LBB1054
	.long	.Ldebug_ranges0+0x5b0
	.byte	0x1
	.byte	0x43
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x33
	.long	0x2c8c
	.byte	0
	.byte	0
	.uleb128 0x35
	.long	0x2bbe
	.quad	.LBB1058
	.quad	.LBE1058-.LBB1058
	.byte	0x1
	.byte	0x4a
	.long	0x156b
	.uleb128 0x33
	.long	0x2bd9
	.uleb128 0x33
	.long	0x2bce
	.byte	0
	.uleb128 0x30
	.long	0x2869
	.quad	.LBB1062
	.long	.Ldebug_ranges0+0x5e0
	.byte	0x1
	.byte	0x4b
	.long	0x16a3
	.uleb128 0x31
	.long	0x2882
	.long	.LLST58
	.uleb128 0x31
	.long	0x2879
	.long	.LLST59
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1063
	.quad	.LBE1063-.LBB1063
	.byte	0x1
	.byte	0x3f
	.long	0x15ba
	.uleb128 0x33
	.long	0x2cc2
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x35
	.long	0x2c7b
	.quad	.LBB1065
	.quad	.LBE1065-.LBB1065
	.byte	0x1
	.byte	0x3f
	.long	0x15e4
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x31
	.long	0x2c8c
	.long	.LLST59
	.byte	0
	.uleb128 0x35
	.long	0x2c51
	.quad	.LBB1067
	.quad	.LBE1067-.LBB1067
	.byte	0x1
	.byte	0x42
	.long	0x160a
	.uleb128 0x33
	.long	0x2c6e
	.uleb128 0x33
	.long	0x2c62
	.byte	0
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1069
	.quad	.LBE1069-.LBB1069
	.byte	0x1
	.byte	0x40
	.long	0x1634
	.uleb128 0x31
	.long	0x2cc2
	.long	.LLST61
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x35
	.long	0x2c7b
	.quad	.LBB1071
	.quad	.LBE1071-.LBB1071
	.byte	0x1
	.byte	0x40
	.long	0x165a
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x33
	.long	0x2c8c
	.byte	0
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1073
	.quad	.LBE1073-.LBB1073
	.byte	0x1
	.byte	0x41
	.long	0x1684
	.uleb128 0x31
	.long	0x2cc2
	.long	.LLST62
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x32
	.long	0x2c7b
	.quad	.LBB1075
	.long	.Ldebug_ranges0+0x620
	.byte	0x1
	.byte	0x43
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x33
	.long	0x2c8c
	.byte	0
	.byte	0
	.uleb128 0x35
	.long	0x2bbe
	.quad	.LBB1079
	.quad	.LBE1079-.LBB1079
	.byte	0x1
	.byte	0x4b
	.long	0x16c9
	.uleb128 0x33
	.long	0x2bd9
	.uleb128 0x33
	.long	0x2bce
	.byte	0
	.uleb128 0x30
	.long	0x2869
	.quad	.LBB1083
	.long	.Ldebug_ranges0+0x650
	.byte	0x1
	.byte	0x4c
	.long	0x1801
	.uleb128 0x31
	.long	0x2882
	.long	.LLST63
	.uleb128 0x31
	.long	0x2879
	.long	.LLST64
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1084
	.quad	.LBE1084-.LBB1084
	.byte	0x1
	.byte	0x3f
	.long	0x1718
	.uleb128 0x33
	.long	0x2cc2
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x35
	.long	0x2c7b
	.quad	.LBB1086
	.quad	.LBE1086-.LBB1086
	.byte	0x1
	.byte	0x3f
	.long	0x1742
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x31
	.long	0x2c8c
	.long	.LLST64
	.byte	0
	.uleb128 0x35
	.long	0x2c51
	.quad	.LBB1088
	.quad	.LBE1088-.LBB1088
	.byte	0x1
	.byte	0x42
	.long	0x1768
	.uleb128 0x33
	.long	0x2c6e
	.uleb128 0x33
	.long	0x2c62
	.byte	0
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1090
	.quad	.LBE1090-.LBB1090
	.byte	0x1
	.byte	0x40
	.long	0x1792
	.uleb128 0x31
	.long	0x2cc2
	.long	.LLST66
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x35
	.long	0x2c7b
	.quad	.LBB1092
	.quad	.LBE1092-.LBB1092
	.byte	0x1
	.byte	0x40
	.long	0x17b8
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x33
	.long	0x2c8c
	.byte	0
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1094
	.quad	.LBE1094-.LBB1094
	.byte	0x1
	.byte	0x41
	.long	0x17e2
	.uleb128 0x31
	.long	0x2cc2
	.long	.LLST67
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x32
	.long	0x2c7b
	.quad	.LBB1096
	.long	.Ldebug_ranges0+0x690
	.byte	0x1
	.byte	0x43
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x33
	.long	0x2c8c
	.byte	0
	.byte	0
	.uleb128 0x35
	.long	0x2bbe
	.quad	.LBB1100
	.quad	.LBE1100-.LBB1100
	.byte	0x1
	.byte	0x4c
	.long	0x1827
	.uleb128 0x33
	.long	0x2bd9
	.uleb128 0x33
	.long	0x2bce
	.byte	0
	.uleb128 0x30
	.long	0x2869
	.quad	.LBB1104
	.long	.Ldebug_ranges0+0x6c0
	.byte	0x1
	.byte	0x4d
	.long	0x195f
	.uleb128 0x31
	.long	0x2882
	.long	.LLST68
	.uleb128 0x31
	.long	0x2879
	.long	.LLST69
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1105
	.quad	.LBE1105-.LBB1105
	.byte	0x1
	.byte	0x3f
	.long	0x1876
	.uleb128 0x33
	.long	0x2cc2
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x35
	.long	0x2c7b
	.quad	.LBB1107
	.quad	.LBE1107-.LBB1107
	.byte	0x1
	.byte	0x3f
	.long	0x18a0
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x31
	.long	0x2c8c
	.long	.LLST69
	.byte	0
	.uleb128 0x35
	.long	0x2c51
	.quad	.LBB1109
	.quad	.LBE1109-.LBB1109
	.byte	0x1
	.byte	0x42
	.long	0x18c6
	.uleb128 0x33
	.long	0x2c6e
	.uleb128 0x33
	.long	0x2c62
	.byte	0
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1111
	.quad	.LBE1111-.LBB1111
	.byte	0x1
	.byte	0x40
	.long	0x18f0
	.uleb128 0x31
	.long	0x2cc2
	.long	.LLST71
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x35
	.long	0x2c7b
	.quad	.LBB1113
	.quad	.LBE1113-.LBB1113
	.byte	0x1
	.byte	0x40
	.long	0x1916
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x33
	.long	0x2c8c
	.byte	0
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1115
	.quad	.LBE1115-.LBB1115
	.byte	0x1
	.byte	0x41
	.long	0x1940
	.uleb128 0x31
	.long	0x2cc2
	.long	.LLST72
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x32
	.long	0x2c7b
	.quad	.LBB1117
	.long	.Ldebug_ranges0+0x700
	.byte	0x1
	.byte	0x43
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x33
	.long	0x2c8c
	.byte	0
	.byte	0
	.uleb128 0x35
	.long	0x2bbe
	.quad	.LBB1121
	.quad	.LBE1121-.LBB1121
	.byte	0x1
	.byte	0x4d
	.long	0x1985
	.uleb128 0x33
	.long	0x2bd9
	.uleb128 0x33
	.long	0x2bce
	.byte	0
	.uleb128 0x30
	.long	0x2869
	.quad	.LBB1125
	.long	.Ldebug_ranges0+0x730
	.byte	0x1
	.byte	0x4e
	.long	0x1abd
	.uleb128 0x31
	.long	0x2882
	.long	.LLST73
	.uleb128 0x31
	.long	0x2879
	.long	.LLST74
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1126
	.quad	.LBE1126-.LBB1126
	.byte	0x1
	.byte	0x3f
	.long	0x19d4
	.uleb128 0x33
	.long	0x2cc2
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x35
	.long	0x2c7b
	.quad	.LBB1128
	.quad	.LBE1128-.LBB1128
	.byte	0x1
	.byte	0x3f
	.long	0x19fe
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x31
	.long	0x2c8c
	.long	.LLST74
	.byte	0
	.uleb128 0x35
	.long	0x2c51
	.quad	.LBB1130
	.quad	.LBE1130-.LBB1130
	.byte	0x1
	.byte	0x42
	.long	0x1a24
	.uleb128 0x33
	.long	0x2c6e
	.uleb128 0x33
	.long	0x2c62
	.byte	0
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1132
	.quad	.LBE1132-.LBB1132
	.byte	0x1
	.byte	0x40
	.long	0x1a4e
	.uleb128 0x31
	.long	0x2cc2
	.long	.LLST76
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x35
	.long	0x2c7b
	.quad	.LBB1134
	.quad	.LBE1134-.LBB1134
	.byte	0x1
	.byte	0x40
	.long	0x1a74
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x33
	.long	0x2c8c
	.byte	0
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1136
	.quad	.LBE1136-.LBB1136
	.byte	0x1
	.byte	0x41
	.long	0x1a9e
	.uleb128 0x31
	.long	0x2cc2
	.long	.LLST77
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x32
	.long	0x2c7b
	.quad	.LBB1138
	.long	.Ldebug_ranges0+0x770
	.byte	0x1
	.byte	0x43
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x33
	.long	0x2c8c
	.byte	0
	.byte	0
	.uleb128 0x35
	.long	0x2bbe
	.quad	.LBB1142
	.quad	.LBE1142-.LBB1142
	.byte	0x1
	.byte	0x4e
	.long	0x1ae3
	.uleb128 0x33
	.long	0x2bd9
	.uleb128 0x33
	.long	0x2bce
	.byte	0
	.uleb128 0x30
	.long	0x2869
	.quad	.LBB1146
	.long	.Ldebug_ranges0+0x7a0
	.byte	0x1
	.byte	0x4f
	.long	0x1c1b
	.uleb128 0x31
	.long	0x2882
	.long	.LLST78
	.uleb128 0x31
	.long	0x2879
	.long	.LLST79
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1147
	.quad	.LBE1147-.LBB1147
	.byte	0x1
	.byte	0x3f
	.long	0x1b32
	.uleb128 0x33
	.long	0x2cc2
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x35
	.long	0x2c7b
	.quad	.LBB1149
	.quad	.LBE1149-.LBB1149
	.byte	0x1
	.byte	0x3f
	.long	0x1b5c
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x31
	.long	0x2c8c
	.long	.LLST79
	.byte	0
	.uleb128 0x35
	.long	0x2c51
	.quad	.LBB1151
	.quad	.LBE1151-.LBB1151
	.byte	0x1
	.byte	0x42
	.long	0x1b82
	.uleb128 0x33
	.long	0x2c6e
	.uleb128 0x33
	.long	0x2c62
	.byte	0
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1153
	.quad	.LBE1153-.LBB1153
	.byte	0x1
	.byte	0x40
	.long	0x1bac
	.uleb128 0x31
	.long	0x2cc2
	.long	.LLST81
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x35
	.long	0x2c7b
	.quad	.LBB1155
	.quad	.LBE1155-.LBB1155
	.byte	0x1
	.byte	0x40
	.long	0x1bd2
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x33
	.long	0x2c8c
	.byte	0
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1157
	.quad	.LBE1157-.LBB1157
	.byte	0x1
	.byte	0x41
	.long	0x1bfc
	.uleb128 0x31
	.long	0x2cc2
	.long	.LLST82
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x32
	.long	0x2c7b
	.quad	.LBB1159
	.long	.Ldebug_ranges0+0x7e0
	.byte	0x1
	.byte	0x43
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x33
	.long	0x2c8c
	.byte	0
	.byte	0
	.uleb128 0x35
	.long	0x2bbe
	.quad	.LBB1163
	.quad	.LBE1163-.LBB1163
	.byte	0x1
	.byte	0x4f
	.long	0x1c41
	.uleb128 0x33
	.long	0x2bd9
	.uleb128 0x33
	.long	0x2bce
	.byte	0
	.uleb128 0x30
	.long	0x2869
	.quad	.LBB1167
	.long	.Ldebug_ranges0+0x810
	.byte	0x1
	.byte	0x50
	.long	0x1d7d
	.uleb128 0x31
	.long	0x2882
	.long	.LLST83
	.uleb128 0x31
	.long	0x2879
	.long	.LLST84
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1168
	.quad	.LBE1168-.LBB1168
	.byte	0x1
	.byte	0x3f
	.long	0x1c90
	.uleb128 0x33
	.long	0x2cc2
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x35
	.long	0x2c7b
	.quad	.LBB1170
	.quad	.LBE1170-.LBB1170
	.byte	0x1
	.byte	0x3f
	.long	0x1cba
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x31
	.long	0x2c8c
	.long	.LLST84
	.byte	0
	.uleb128 0x35
	.long	0x2c51
	.quad	.LBB1172
	.quad	.LBE1172-.LBB1172
	.byte	0x1
	.byte	0x42
	.long	0x1ce0
	.uleb128 0x33
	.long	0x2c6e
	.uleb128 0x33
	.long	0x2c62
	.byte	0
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1174
	.quad	.LBE1174-.LBB1174
	.byte	0x1
	.byte	0x40
	.long	0x1d0a
	.uleb128 0x31
	.long	0x2cc2
	.long	.LLST86
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x35
	.long	0x2c7b
	.quad	.LBB1176
	.quad	.LBE1176-.LBB1176
	.byte	0x1
	.byte	0x40
	.long	0x1d30
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x33
	.long	0x2c8c
	.byte	0
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1178
	.quad	.LBE1178-.LBB1178
	.byte	0x1
	.byte	0x41
	.long	0x1d5a
	.uleb128 0x31
	.long	0x2cc2
	.long	.LLST87
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x37
	.long	0x2c7b
	.quad	.LBB1180
	.quad	.LBE1180-.LBB1180
	.byte	0x1
	.byte	0x43
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x33
	.long	0x2c8c
	.byte	0
	.byte	0
	.uleb128 0x35
	.long	0x2bbe
	.quad	.LBB1182
	.quad	.LBE1182-.LBB1182
	.byte	0x1
	.byte	0x50
	.long	0x1da3
	.uleb128 0x33
	.long	0x2bd9
	.uleb128 0x33
	.long	0x2bce
	.byte	0
	.uleb128 0x30
	.long	0x2869
	.quad	.LBB1186
	.long	.Ldebug_ranges0+0x840
	.byte	0x1
	.byte	0x51
	.long	0x1edf
	.uleb128 0x31
	.long	0x2882
	.long	.LLST88
	.uleb128 0x31
	.long	0x2879
	.long	.LLST89
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1187
	.quad	.LBE1187-.LBB1187
	.byte	0x1
	.byte	0x3f
	.long	0x1df2
	.uleb128 0x33
	.long	0x2cc2
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x35
	.long	0x2c7b
	.quad	.LBB1189
	.quad	.LBE1189-.LBB1189
	.byte	0x1
	.byte	0x3f
	.long	0x1e1c
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x31
	.long	0x2c8c
	.long	.LLST89
	.byte	0
	.uleb128 0x35
	.long	0x2c51
	.quad	.LBB1191
	.quad	.LBE1191-.LBB1191
	.byte	0x1
	.byte	0x42
	.long	0x1e42
	.uleb128 0x33
	.long	0x2c6e
	.uleb128 0x33
	.long	0x2c62
	.byte	0
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1193
	.quad	.LBE1193-.LBB1193
	.byte	0x1
	.byte	0x40
	.long	0x1e6c
	.uleb128 0x31
	.long	0x2cc2
	.long	.LLST91
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x35
	.long	0x2c7b
	.quad	.LBB1195
	.quad	.LBE1195-.LBB1195
	.byte	0x1
	.byte	0x40
	.long	0x1e92
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x33
	.long	0x2c8c
	.byte	0
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1197
	.quad	.LBE1197-.LBB1197
	.byte	0x1
	.byte	0x41
	.long	0x1ebc
	.uleb128 0x31
	.long	0x2cc2
	.long	.LLST92
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x37
	.long	0x2c7b
	.quad	.LBB1199
	.quad	.LBE1199-.LBB1199
	.byte	0x1
	.byte	0x43
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x33
	.long	0x2c8c
	.byte	0
	.byte	0
	.uleb128 0x35
	.long	0x2bbe
	.quad	.LBB1201
	.quad	.LBE1201-.LBB1201
	.byte	0x1
	.byte	0x51
	.long	0x1f0d
	.uleb128 0x31
	.long	0x2bd9
	.long	.LLST93
	.uleb128 0x31
	.long	0x2bce
	.long	.LLST94
	.byte	0
	.uleb128 0x30
	.long	0x2869
	.quad	.LBB1204
	.long	.Ldebug_ranges0+0x870
	.byte	0x1
	.byte	0x52
	.long	0x2049
	.uleb128 0x31
	.long	0x2882
	.long	.LLST95
	.uleb128 0x31
	.long	0x2879
	.long	.LLST96
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1205
	.quad	.LBE1205-.LBB1205
	.byte	0x1
	.byte	0x3f
	.long	0x1f5c
	.uleb128 0x33
	.long	0x2cc2
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x35
	.long	0x2c7b
	.quad	.LBB1207
	.quad	.LBE1207-.LBB1207
	.byte	0x1
	.byte	0x3f
	.long	0x1f86
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x31
	.long	0x2c8c
	.long	.LLST96
	.byte	0
	.uleb128 0x35
	.long	0x2c51
	.quad	.LBB1209
	.quad	.LBE1209-.LBB1209
	.byte	0x1
	.byte	0x42
	.long	0x1fac
	.uleb128 0x33
	.long	0x2c6e
	.uleb128 0x33
	.long	0x2c62
	.byte	0
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1211
	.quad	.LBE1211-.LBB1211
	.byte	0x1
	.byte	0x40
	.long	0x1fd6
	.uleb128 0x31
	.long	0x2cc2
	.long	.LLST98
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x35
	.long	0x2c7b
	.quad	.LBB1213
	.quad	.LBE1213-.LBB1213
	.byte	0x1
	.byte	0x40
	.long	0x1ffc
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x33
	.long	0x2c8c
	.byte	0
	.uleb128 0x35
	.long	0x2ca5
	.quad	.LBB1215
	.quad	.LBE1215-.LBB1215
	.byte	0x1
	.byte	0x41
	.long	0x2026
	.uleb128 0x31
	.long	0x2cc2
	.long	.LLST99
	.uleb128 0x33
	.long	0x2cb6
	.byte	0
	.uleb128 0x37
	.long	0x2c7b
	.quad	.LBB1217
	.quad	.LBE1217-.LBB1217
	.byte	0x1
	.byte	0x43
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x33
	.long	0x2c8c
	.byte	0
	.byte	0
	.uleb128 0x37
	.long	0x2bbe
	.quad	.LBB1219
	.quad	.LBE1219-.LBB1219
	.byte	0x1
	.byte	0x52
	.uleb128 0x31
	.long	0x2bd9
	.long	.LLST100
	.uleb128 0x31
	.long	0x2bce
	.long	.LLST101
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x22
	.quad	.LVL160
	.long	0x2d47
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x76
	.sleb128 -80
	.byte	0x6
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x4
	.byte	0x76
	.sleb128 -288
	.byte	0x6
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x4
	.byte	0x76
	.sleb128 -288
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x38
	.quad	.LBB1232
	.quad	.LBE1232-.LBB1232
	.long	0x2476
	.uleb128 0x2d
	.long	.LASF179
	.byte	0x1
	.byte	0xee
	.long	0xc3
	.long	.LLST102
	.uleb128 0x39
	.quad	.LBB1233
	.quad	.LBE1233-.LBB1233
	.uleb128 0x2d
	.long	.LASF180
	.byte	0x1
	.byte	0xef
	.long	0x208
	.long	.LLST103
	.uleb128 0x2e
	.long	.LASF181
	.byte	0x1
	.byte	0xf0
	.long	0x1d5
	.uleb128 0x2e
	.long	.LASF182
	.byte	0x1
	.byte	0xf3
	.long	0x597
	.uleb128 0x2d
	.long	.LASF167
	.byte	0x1
	.byte	0xf6
	.long	0x27f3
	.long	.LLST104
	.uleb128 0x2e
	.long	.LASF183
	.byte	0x1
	.byte	0xf7
	.long	0xe5
	.uleb128 0x2d
	.long	.LASF184
	.byte	0x1
	.byte	0xfd
	.long	0x27cd
	.long	.LLST105
	.uleb128 0x30
	.long	0x27ff
	.quad	.LBB1234
	.long	.Ldebug_ranges0+0x8a0
	.byte	0x1
	.byte	0xf3
	.long	0x238a
	.uleb128 0x33
	.long	0x2825
	.uleb128 0x31
	.long	0x281a
	.long	.LLST106
	.uleb128 0x31
	.long	0x280f
	.long	.LLST107
	.uleb128 0x24
	.long	.Ldebug_ranges0+0x8a0
	.uleb128 0x34
	.long	0x2830
	.uleb128 0x35
	.long	0x2c33
	.quad	.LBB1236
	.quad	.LBE1236-.LBB1236
	.byte	0x1
	.byte	0x58
	.long	0x21a1
	.uleb128 0x33
	.long	0x2c44
	.uleb128 0x36
	.long	0x2ccf
	.quad	.LBB1237
	.quad	.LBE1237-.LBB1237
	.byte	0x4
	.value	0x5e8
	.uleb128 0x33
	.long	0x2cec
	.uleb128 0x33
	.long	0x2ce0
	.byte	0
	.byte	0
	.uleb128 0x35
	.long	0x2c7b
	.quad	.LBB1239
	.quad	.LBE1239-.LBB1239
	.byte	0x1
	.byte	0x59
	.long	0x21c7
	.uleb128 0x33
	.long	0x2c98
	.uleb128 0x33
	.long	0x2c8c
	.byte	0
	.uleb128 0x35
	.long	0x2c0c
	.quad	.LBB1241
	.quad	.LBE1241-.LBB1241
	.byte	0x1
	.byte	0x5a
	.long	0x21f1
	.uleb128 0x31
	.long	0x2c27
	.long	.LLST108
	.uleb128 0x33
	.long	0x2c1c
	.byte	0
	.uleb128 0x35
	.long	0x2c0c
	.quad	.LBB1243
	.quad	.LBE1243-.LBB1243
	.byte	0x1
	.byte	0x5b
	.long	0x221b
	.uleb128 0x31
	.long	0x2c27
	.long	.LLST109
	.uleb128 0x33
	.long	0x2c1c
	.byte	0
	.uleb128 0x35
	.long	0x2c0c
	.quad	.LBB1245
	.quad	.LBE1245-.LBB1245
	.byte	0x1
	.byte	0x5c
	.long	0x2245
	.uleb128 0x31
	.long	0x2c27
	.long	.LLST110
	.uleb128 0x33
	.long	0x2c1c
	.byte	0
	.uleb128 0x35
	.long	0x2c0c
	.quad	.LBB1247
	.quad	.LBE1247-.LBB1247
	.byte	0x1
	.byte	0x5d
	.long	0x226f
	.uleb128 0x31
	.long	0x2c27
	.long	.LLST111
	.uleb128 0x33
	.long	0x2c1c
	.byte	0
	.uleb128 0x35
	.long	0x2c0c
	.quad	.LBB1249
	.quad	.LBE1249-.LBB1249
	.byte	0x1
	.byte	0x5e
	.long	0x2299
	.uleb128 0x31
	.long	0x2c27
	.long	.LLST112
	.uleb128 0x33
	.long	0x2c1c
	.byte	0
	.uleb128 0x35
	.long	0x2c0c
	.quad	.LBB1251
	.quad	.LBE1251-.LBB1251
	.byte	0x1
	.byte	0x5f
	.long	0x22c3
	.uleb128 0x31
	.long	0x2c27
	.long	.LLST113
	.uleb128 0x33
	.long	0x2c1c
	.byte	0
	.uleb128 0x35
	.long	0x2c0c
	.quad	.LBB1253
	.quad	.LBE1253-.LBB1253
	.byte	0x1
	.byte	0x60
	.long	0x22ed
	.uleb128 0x31
	.long	0x2c27
	.long	.LLST114
	.uleb128 0x33
	.long	0x2c1c
	.byte	0
	.uleb128 0x35
	.long	0x2c0c
	.quad	.LBB1255
	.quad	.LBE1255-.LBB1255
	.byte	0x1
	.byte	0x61
	.long	0x2317
	.uleb128 0x31
	.long	0x2c27
	.long	.LLST115
	.uleb128 0x33
	.long	0x2c1c
	.byte	0
	.uleb128 0x35
	.long	0x2c0c
	.quad	.LBB1257
	.quad	.LBE1257-.LBB1257
	.byte	0x1
	.byte	0x62
	.long	0x2341
	.uleb128 0x31
	.long	0x2c27
	.long	.LLST116
	.uleb128 0x33
	.long	0x2c1c
	.byte	0
	.uleb128 0x35
	.long	0x2be5
	.quad	.LBB1259
	.quad	.LBE1259-.LBB1259
	.byte	0x1
	.byte	0x63
	.long	0x236b
	.uleb128 0x31
	.long	0x2c00
	.long	.LLST117
	.uleb128 0x33
	.long	0x2bf5
	.byte	0
	.uleb128 0x37
	.long	0x2cf9
	.quad	.LBB1261
	.quad	.LBE1261-.LBB1261
	.byte	0x1
	.byte	0x65
	.uleb128 0x33
	.long	0x2d09
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x35
	.long	0x2927
	.quad	.LBB1264
	.quad	.LBE1264-.LBB1264
	.byte	0x1
	.byte	0xf0
	.long	0x23af
	.uleb128 0x31
	.long	0x2938
	.long	.LLST118
	.byte	0
	.uleb128 0x35
	.long	0x28d9
	.quad	.LBB1267
	.quad	.LBE1267-.LBB1267
	.byte	0x1
	.byte	0xf8
	.long	0x23d5
	.uleb128 0x33
	.long	0x28f4
	.uleb128 0x33
	.long	0x28e9
	.byte	0
	.uleb128 0x35
	.long	0x28d9
	.quad	.LBB1269
	.quad	.LBE1269-.LBB1269
	.byte	0x1
	.byte	0xf9
	.long	0x23fb
	.uleb128 0x33
	.long	0x28f4
	.uleb128 0x33
	.long	0x28e9
	.byte	0
	.uleb128 0x30
	.long	0x2b44
	.quad	.LBB1271
	.long	.Ldebug_ranges0+0x8d0
	.byte	0x1
	.byte	0xf8
	.long	0x2418
	.uleb128 0x33
	.long	0x2b55
	.byte	0
	.uleb128 0x35
	.long	0x28d9
	.quad	.LBB1274
	.quad	.LBE1274-.LBB1274
	.byte	0x1
	.byte	0xfa
	.long	0x243e
	.uleb128 0x33
	.long	0x28f4
	.uleb128 0x33
	.long	0x28e9
	.byte	0
	.uleb128 0x30
	.long	0x2b44
	.quad	.LBB1276
	.long	.Ldebug_ranges0+0x900
	.byte	0x1
	.byte	0xf9
	.long	0x245b
	.uleb128 0x33
	.long	0x2b55
	.byte	0
	.uleb128 0x32
	.long	0x2b44
	.quad	.LBB1279
	.long	.Ldebug_ranges0+0x930
	.byte	0x1
	.byte	0xfa
	.uleb128 0x33
	.long	0x2b55
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x38
	.quad	.LBB1285
	.quad	.LBE1285-.LBB1285
	.long	0x2613
	.uleb128 0x20
	.long	.LASF139
	.byte	0x1
	.value	0x102
	.long	0x597
	.long	.LLST119
	.uleb128 0x39
	.quad	.LBB1286
	.quad	.LBE1286-.LBB1286
	.uleb128 0x20
	.long	.LASF172
	.byte	0x1
	.value	0x103
	.long	0x208
	.long	.LLST120
	.uleb128 0x25
	.long	.LASF173
	.byte	0x1
	.value	0x104
	.long	0x1d5
	.uleb128 0x20
	.long	.LASF185
	.byte	0x1
	.value	0x105
	.long	0xe5
	.long	.LLST121
	.uleb128 0x38
	.quad	.LBB1289
	.quad	.LBE1289-.LBB1289
	.long	0x25ef
	.uleb128 0x20
	.long	.LASF166
	.byte	0x1
	.value	0x107
	.long	0x597
	.long	.LLST123
	.uleb128 0x24
	.long	.Ldebug_ranges0+0x960
	.uleb128 0x20
	.long	.LASF167
	.byte	0x1
	.value	0x108
	.long	0x27f3
	.long	.LLST124
	.uleb128 0x20
	.long	.LASF183
	.byte	0x1
	.value	0x109
	.long	0xe5
	.long	.LLST125
	.uleb128 0x25
	.long	.LASF186
	.byte	0x1
	.value	0x10d
	.long	0xe5
	.uleb128 0x3a
	.long	0x28d9
	.quad	.LBB1291
	.long	.Ldebug_ranges0+0x990
	.byte	0x1
	.value	0x10b
	.long	0x2551
	.uleb128 0x33
	.long	0x28f4
	.uleb128 0x33
	.long	0x28e9
	.byte	0
	.uleb128 0x3a
	.long	0x28d9
	.quad	.LBB1295
	.long	.Ldebug_ranges0+0x9d0
	.byte	0x1
	.value	0x10c
	.long	0x2574
	.uleb128 0x33
	.long	0x28f4
	.uleb128 0x33
	.long	0x28e9
	.byte	0
	.uleb128 0x3a
	.long	0x28d9
	.quad	.LBB1299
	.long	.Ldebug_ranges0+0xa10
	.byte	0x1
	.value	0x10a
	.long	0x2597
	.uleb128 0x33
	.long	0x28f4
	.uleb128 0x33
	.long	0x28e9
	.byte	0
	.uleb128 0x3a
	.long	0x2b44
	.quad	.LBB1303
	.long	.Ldebug_ranges0+0xa50
	.byte	0x1
	.value	0x10b
	.long	0x25b5
	.uleb128 0x33
	.long	0x2b55
	.byte	0
	.uleb128 0x3a
	.long	0x2b44
	.quad	.LBB1310
	.long	.Ldebug_ranges0+0xac0
	.byte	0x1
	.value	0x10c
	.long	0x25d3
	.uleb128 0x33
	.long	0x2b55
	.byte	0
	.uleb128 0x3b
	.long	0x2b44
	.quad	.LBB1317
	.long	.Ldebug_ranges0+0xb30
	.byte	0x1
	.value	0x10a
	.uleb128 0x33
	.long	0x2b55
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x36
	.long	0x2927
	.quad	.LBB1287
	.quad	.LBE1287-.LBB1287
	.byte	0x1
	.value	0x104
	.uleb128 0x31
	.long	0x2938
	.long	.LLST122
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x38
	.quad	.LBB1344
	.quad	.LBE1344-.LBB1344
	.long	0x264f
	.uleb128 0x20
	.long	.LASF166
	.byte	0x1
	.value	0x115
	.long	0x597
	.long	.LLST126
	.uleb128 0x24
	.long	.Ldebug_ranges0+0xb90
	.uleb128 0x20
	.long	.LASF167
	.byte	0x1
	.value	0x117
	.long	0x27f9
	.long	.LLST127
	.byte	0
	.byte	0
	.uleb128 0x35
	.long	0x2d15
	.quad	.LBB873
	.quad	.LBE873-.LBB873
	.byte	0x1
	.byte	0x6e
	.long	0x2674
	.uleb128 0x31
	.long	0x2d25
	.long	.LLST11
	.byte	0
	.uleb128 0x27
	.quad	.LVL9
	.long	0x2d77
	.long	0x2694
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x40
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x4
	.byte	0x76
	.sleb128 -288
	.byte	0x6
	.byte	0
	.uleb128 0x27
	.quad	.LVL12
	.long	0x2d77
	.long	0x26b2
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x40
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x27
	.quad	.LVL16
	.long	0x2d47
	.long	0x26dd
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x76
	.sleb128 -280
	.byte	0x6
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x27
	.quad	.LVL17
	.long	0x2d47
	.long	0x271b
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x76
	.sleb128 -328
	.byte	0x6
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0xb
	.byte	0x76
	.sleb128 -80
	.byte	0x94
	.byte	0x4
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0xff
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x52
	.uleb128 0xb
	.byte	0x76
	.sleb128 -80
	.byte	0x94
	.byte	0x4
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0
	.uleb128 0x27
	.quad	.LVL18
	.long	0x2d47
	.long	0x2748
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x4
	.byte	0x76
	.sleb128 -288
	.byte	0x6
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x4
	.byte	0x76
	.sleb128 -288
	.byte	0x6
	.byte	0
	.uleb128 0x27
	.quad	.LVL154
	.long	0x2d52
	.long	0x2762
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x76
	.sleb128 -280
	.byte	0x6
	.byte	0
	.uleb128 0x27
	.quad	.LVL155
	.long	0x2d52
	.long	0x277a
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x27
	.quad	.LVL162
	.long	0x2d52
	.long	0x2794
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x76
	.sleb128 -280
	.byte	0x6
	.byte	0
	.uleb128 0x27
	.quad	.LVL163
	.long	0x2d52
	.long	0x27ac
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x22
	.quad	.LVL206
	.long	0x2d52
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x8
	.long	0x213
	.uleb128 0xc
	.byte	0x8
	.long	0xe0
	.uleb128 0xc
	.byte	0x8
	.long	0xf0
	.uleb128 0x10
	.long	0x10b
	.long	0x27e3
	.uleb128 0x11
	.long	0x9a
	.byte	0x1
	.byte	0
	.uleb128 0x10
	.long	0x1d5
	.long	0x27f3
	.uleb128 0x11
	.long	0x9a
	.byte	0x2
	.byte	0
	.uleb128 0xc
	.byte	0x8
	.long	0x1d5
	.uleb128 0xc
	.byte	0x8
	.long	0x1e0
	.uleb128 0x3c
	.long	.LASF188
	.byte	0x1
	.byte	0x57
	.long	0x597
	.byte	0x3
	.long	0x283c
	.uleb128 0x3d
	.string	"jid"
	.byte	0x1
	.byte	0x57
	.long	0x208
	.uleb128 0x3e
	.long	.LASF159
	.byte	0x1
	.byte	0x57
	.long	0x5cf
	.uleb128 0x3e
	.long	.LASF151
	.byte	0x1
	.byte	0x57
	.long	0xf5
	.uleb128 0x2e
	.long	.LASF187
	.byte	0x1
	.byte	0x58
	.long	0x162
	.byte	0
	.uleb128 0x3c
	.long	.LASF124
	.byte	0x1
	.byte	0x46
	.long	0x5cf
	.byte	0x3
	.long	0x2863
	.uleb128 0x3e
	.long	.LASF162
	.byte	0x1
	.byte	0x46
	.long	0x2863
	.uleb128 0x2e
	.long	.LASF159
	.byte	0x1
	.byte	0x47
	.long	0x5cf
	.byte	0
	.uleb128 0xc
	.byte	0x8
	.long	0x10b
	.uleb128 0x3c
	.long	.LASF189
	.byte	0x1
	.byte	0x3e
	.long	0x162
	.byte	0x3
	.long	0x288d
	.uleb128 0x3d
	.string	"k"
	.byte	0x1
	.byte	0x3e
	.long	0x162
	.uleb128 0x3d
	.string	"k2"
	.byte	0x1
	.byte	0x3e
	.long	0x162
	.byte	0
	.uleb128 0x3f
	.long	.LASF190
	.byte	0x3
	.byte	0xce
	.long	0x5f
	.byte	0x3
	.long	0x28a9
	.uleb128 0x3d
	.string	"__P"
	.byte	0x3
	.byte	0xce
	.long	0x28a9
	.byte	0
	.uleb128 0xc
	.byte	0x8
	.long	0x144
	.uleb128 0x40
	.long	.LASF191
	.byte	0x7
	.value	0x23e
	.long	0x1d5
	.byte	0x3
	.long	0x28d9
	.uleb128 0x41
	.string	"__A"
	.byte	0x7
	.value	0x23e
	.long	0x1d5
	.uleb128 0x41
	.string	"__B"
	.byte	0x7
	.value	0x23e
	.long	0x1d5
	.byte	0
	.uleb128 0x3f
	.long	.LASF192
	.byte	0x7
	.byte	0xfc
	.long	0x1d5
	.byte	0x3
	.long	0x2900
	.uleb128 0x3d
	.string	"__A"
	.byte	0x7
	.byte	0xfc
	.long	0x1d5
	.uleb128 0x3d
	.string	"__B"
	.byte	0x7
	.byte	0xfc
	.long	0x1d5
	.byte	0
	.uleb128 0x3f
	.long	.LASF193
	.byte	0x7
	.byte	0x7e
	.long	0x1d5
	.byte	0x3
	.long	0x2927
	.uleb128 0x3d
	.string	"__A"
	.byte	0x7
	.byte	0x7e
	.long	0x1d5
	.uleb128 0x3d
	.string	"__B"
	.byte	0x7
	.byte	0x7e
	.long	0x1d5
	.byte	0
	.uleb128 0x40
	.long	.LASF194
	.byte	0x6
	.value	0x53e
	.long	0x1d5
	.byte	0x3
	.long	0x2945
	.uleb128 0x41
	.string	"__A"
	.byte	0x6
	.value	0x53e
	.long	0xce
	.byte	0
	.uleb128 0x40
	.long	.LASF195
	.byte	0x6
	.value	0x535
	.long	0x1d5
	.byte	0x3
	.long	0x2963
	.uleb128 0x41
	.string	"__A"
	.byte	0x6
	.value	0x535
	.long	0xbc
	.byte	0
	.uleb128 0x40
	.long	.LASF196
	.byte	0x6
	.value	0x510
	.long	0x1d5
	.byte	0x3
	.long	0x29a5
	.uleb128 0x41
	.string	"__A"
	.byte	0x6
	.value	0x510
	.long	0xce
	.uleb128 0x41
	.string	"__B"
	.byte	0x6
	.value	0x510
	.long	0xce
	.uleb128 0x41
	.string	"__C"
	.byte	0x6
	.value	0x510
	.long	0xce
	.uleb128 0x41
	.string	"__D"
	.byte	0x6
	.value	0x511
	.long	0xce
	.byte	0
	.uleb128 0x40
	.long	.LASF197
	.byte	0x6
	.value	0x4fe
	.long	0x1d5
	.byte	0x3
	.long	0x2b37
	.uleb128 0x42
	.long	.LASF198
	.byte	0x6
	.value	0x4fe
	.long	0xbc
	.uleb128 0x42
	.long	.LASF199
	.byte	0x6
	.value	0x4fe
	.long	0xbc
	.uleb128 0x42
	.long	.LASF200
	.byte	0x6
	.value	0x4fe
	.long	0xbc
	.uleb128 0x42
	.long	.LASF201
	.byte	0x6
	.value	0x4fe
	.long	0xbc
	.uleb128 0x42
	.long	.LASF202
	.byte	0x6
	.value	0x4ff
	.long	0xbc
	.uleb128 0x42
	.long	.LASF203
	.byte	0x6
	.value	0x4ff
	.long	0xbc
	.uleb128 0x42
	.long	.LASF204
	.byte	0x6
	.value	0x4ff
	.long	0xbc
	.uleb128 0x42
	.long	.LASF205
	.byte	0x6
	.value	0x4ff
	.long	0xbc
	.uleb128 0x42
	.long	.LASF206
	.byte	0x6
	.value	0x500
	.long	0xbc
	.uleb128 0x42
	.long	.LASF207
	.byte	0x6
	.value	0x500
	.long	0xbc
	.uleb128 0x42
	.long	.LASF208
	.byte	0x6
	.value	0x500
	.long	0xbc
	.uleb128 0x42
	.long	.LASF209
	.byte	0x6
	.value	0x500
	.long	0xbc
	.uleb128 0x42
	.long	.LASF210
	.byte	0x6
	.value	0x501
	.long	0xbc
	.uleb128 0x42
	.long	.LASF211
	.byte	0x6
	.value	0x501
	.long	0xbc
	.uleb128 0x42
	.long	.LASF212
	.byte	0x6
	.value	0x501
	.long	0xbc
	.uleb128 0x42
	.long	.LASF213
	.byte	0x6
	.value	0x501
	.long	0xbc
	.uleb128 0x42
	.long	.LASF214
	.byte	0x6
	.value	0x502
	.long	0xbc
	.uleb128 0x42
	.long	.LASF215
	.byte	0x6
	.value	0x502
	.long	0xbc
	.uleb128 0x42
	.long	.LASF216
	.byte	0x6
	.value	0x502
	.long	0xbc
	.uleb128 0x42
	.long	.LASF217
	.byte	0x6
	.value	0x502
	.long	0xbc
	.uleb128 0x42
	.long	.LASF218
	.byte	0x6
	.value	0x503
	.long	0xbc
	.uleb128 0x42
	.long	.LASF219
	.byte	0x6
	.value	0x503
	.long	0xbc
	.uleb128 0x42
	.long	.LASF220
	.byte	0x6
	.value	0x503
	.long	0xbc
	.uleb128 0x42
	.long	.LASF221
	.byte	0x6
	.value	0x503
	.long	0xbc
	.uleb128 0x42
	.long	.LASF222
	.byte	0x6
	.value	0x504
	.long	0xbc
	.uleb128 0x42
	.long	.LASF223
	.byte	0x6
	.value	0x504
	.long	0xbc
	.uleb128 0x42
	.long	.LASF224
	.byte	0x6
	.value	0x504
	.long	0xbc
	.uleb128 0x42
	.long	.LASF225
	.byte	0x6
	.value	0x504
	.long	0xbc
	.uleb128 0x42
	.long	.LASF226
	.byte	0x6
	.value	0x505
	.long	0xbc
	.uleb128 0x42
	.long	.LASF227
	.byte	0x6
	.value	0x505
	.long	0xbc
	.uleb128 0x42
	.long	.LASF228
	.byte	0x6
	.value	0x505
	.long	0xbc
	.uleb128 0x42
	.long	.LASF229
	.byte	0x6
	.value	0x505
	.long	0xbc
	.byte	0
	.uleb128 0x43
	.long	.LASF258
	.byte	0x6
	.value	0x4d3
	.long	0x1d5
	.byte	0x3
	.uleb128 0x40
	.long	.LASF230
	.byte	0x6
	.value	0x4a5
	.long	0x5f
	.byte	0x3
	.long	0x2b62
	.uleb128 0x41
	.string	"__A"
	.byte	0x6
	.value	0x4a5
	.long	0x1f1
	.byte	0
	.uleb128 0x40
	.long	.LASF231
	.byte	0x6
	.value	0x46f
	.long	0x5f
	.byte	0x3
	.long	0x2b8c
	.uleb128 0x41
	.string	"__M"
	.byte	0x6
	.value	0x46f
	.long	0x1f1
	.uleb128 0x41
	.string	"__V"
	.byte	0x6
	.value	0x46f
	.long	0x1f1
	.byte	0
	.uleb128 0x3f
	.long	.LASF232
	.byte	0x6
	.byte	0xdb
	.long	0x1f1
	.byte	0x3
	.long	0x2bbe
	.uleb128 0x3d
	.string	"__X"
	.byte	0x6
	.byte	0xdb
	.long	0x1f1
	.uleb128 0x3d
	.string	"__Y"
	.byte	0x6
	.byte	0xdb
	.long	0x1f1
	.uleb128 0x3d
	.string	"__M"
	.byte	0x6
	.byte	0xdb
	.long	0x1f1
	.byte	0
	.uleb128 0x3f
	.long	.LASF233
	.byte	0x5
	.byte	0x57
	.long	0x162
	.byte	0x3
	.long	0x2be5
	.uleb128 0x3d
	.string	"__X"
	.byte	0x5
	.byte	0x57
	.long	0x162
	.uleb128 0x3d
	.string	"__C"
	.byte	0x5
	.byte	0x57
	.long	0x66
	.byte	0
	.uleb128 0x3f
	.long	.LASF234
	.byte	0x5
	.byte	0x45
	.long	0x162
	.byte	0x3
	.long	0x2c0c
	.uleb128 0x3d
	.string	"__X"
	.byte	0x5
	.byte	0x45
	.long	0x162
	.uleb128 0x3d
	.string	"__Y"
	.byte	0x5
	.byte	0x45
	.long	0x162
	.byte	0
	.uleb128 0x3f
	.long	.LASF235
	.byte	0x5
	.byte	0x3d
	.long	0x162
	.byte	0x3
	.long	0x2c33
	.uleb128 0x3d
	.string	"__X"
	.byte	0x5
	.byte	0x3d
	.long	0x162
	.uleb128 0x3d
	.string	"__Y"
	.byte	0x5
	.byte	0x3d
	.long	0x162
	.byte	0
	.uleb128 0x40
	.long	.LASF236
	.byte	0x4
	.value	0x5e6
	.long	0x162
	.byte	0x3
	.long	0x2c51
	.uleb128 0x41
	.string	"__A"
	.byte	0x4
	.value	0x5e6
	.long	0xce
	.byte	0
	.uleb128 0x40
	.long	.LASF237
	.byte	0x4
	.value	0x58c
	.long	0x162
	.byte	0x3
	.long	0x2c7b
	.uleb128 0x41
	.string	"__A"
	.byte	0x4
	.value	0x58c
	.long	0x162
	.uleb128 0x42
	.long	.LASF238
	.byte	0x4
	.value	0x58c
	.long	0x66
	.byte	0
	.uleb128 0x40
	.long	.LASF239
	.byte	0x4
	.value	0x50b
	.long	0x162
	.byte	0x3
	.long	0x2ca5
	.uleb128 0x41
	.string	"__A"
	.byte	0x4
	.value	0x50b
	.long	0x162
	.uleb128 0x41
	.string	"__B"
	.byte	0x4
	.value	0x50b
	.long	0x162
	.byte	0
	.uleb128 0x40
	.long	.LASF240
	.byte	0x4
	.value	0x4a7
	.long	0x162
	.byte	0x3
	.long	0x2ccf
	.uleb128 0x41
	.string	"__A"
	.byte	0x4
	.value	0x4a7
	.long	0x162
	.uleb128 0x41
	.string	"__N"
	.byte	0x4
	.value	0x4a7
	.long	0x66
	.byte	0
	.uleb128 0x40
	.long	.LASF241
	.byte	0x4
	.value	0x24e
	.long	0x162
	.byte	0x3
	.long	0x2cf9
	.uleb128 0x42
	.long	.LASF242
	.byte	0x4
	.value	0x24e
	.long	0xce
	.uleb128 0x42
	.long	.LASF243
	.byte	0x4
	.value	0x24e
	.long	0xce
	.byte	0
	.uleb128 0x3f
	.long	.LASF244
	.byte	0x4
	.byte	0xe0
	.long	0x5f
	.byte	0x3
	.long	0x2d15
	.uleb128 0x3d
	.string	"__A"
	.byte	0x4
	.byte	0xe0
	.long	0x162
	.byte	0
	.uleb128 0x3f
	.long	.LASF245
	.byte	0x2
	.byte	0x27
	.long	0x5f
	.byte	0x3
	.long	0x2d31
	.uleb128 0x3d
	.string	"__X"
	.byte	0x2
	.byte	0x27
	.long	0x5f
	.byte	0
	.uleb128 0x44
	.long	.LASF246
	.long	.LASF246
	.byte	0xf
	.byte	0x3f
	.uleb128 0x44
	.long	.LASF247
	.long	.LASF247
	.byte	0xe
	.byte	0x3d
	.uleb128 0x44
	.long	.LASF248
	.long	.LASF248
	.byte	0x10
	.byte	0x52
	.uleb128 0x44
	.long	.LASF249
	.long	.LASF249
	.byte	0x9
	.byte	0x61
	.uleb128 0x44
	.long	.LASF250
	.long	.LASF250
	.byte	0x9
	.byte	0x64
	.uleb128 0x45
	.long	.LASF259
	.long	.LASF260
	.byte	0x11
	.byte	0
	.long	.LASF259
	.uleb128 0x44
	.long	.LASF251
	.long	.LASF251
	.byte	0x9
	.byte	0x65
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x2107
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x88
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x88
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x88
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x3c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3e
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x40
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x41
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x42
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x43
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x44
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x45
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST137:
	.quad	.LVL239-.Ltext0
	.quad	.LVL243-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL243-.Ltext0
	.quad	.LVL247-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL247-.Ltext0
	.quad	.LVL248-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL248-.Ltext0
	.quad	.LVL254-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL254-.Ltext0
	.quad	.LVL266-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL266-.Ltext0
	.quad	.LVL267-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL267-.Ltext0
	.quad	.LVL275-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL275-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL296-.Ltext0
	.quad	.LVL297-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL297-.Ltext0
	.quad	.LFE5018-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST138:
	.quad	.LVL239-.Ltext0
	.quad	.LVL244-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL244-.Ltext0
	.quad	.LVL247-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL247-.Ltext0
	.quad	.LVL248-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL248-.Ltext0
	.quad	.LVL249-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL249-.Ltext0
	.quad	.LVL266-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL266-.Ltext0
	.quad	.LVL267-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL267-.Ltext0
	.quad	.LVL292-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL292-.Ltext0
	.quad	.LVL293-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL293-1-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL296-.Ltext0
	.quad	.LFE5018-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST139:
	.quad	.LVL240-.Ltext0
	.quad	.LVL247-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL248-.Ltext0
	.quad	.LVL256-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL267-.Ltext0
	.quad	.LFE5018-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST140:
	.quad	.LVL240-.Ltext0
	.quad	.LVL247-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL248-.Ltext0
	.quad	.LVL256-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL267-.Ltext0
	.quad	.LVL276-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL296-.Ltext0
	.quad	.LFE5018-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST141:
	.quad	.LVL244-.Ltext0
	.quad	.LVL247-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL255-.Ltext0
	.quad	.LVL256-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL268-.Ltext0
	.quad	.LVL271-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL277-.Ltext0
	.quad	.LVL278-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL289-.Ltext0
	.quad	.LVL293-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL296-.Ltext0
	.quad	.LFE5018-.Ltext0
	.value	0x2
	.byte	0x33
	.byte	0x9f
	.quad	0
	.quad	0
.LLST142:
	.quad	.LVL242-.Ltext0
	.quad	.LVL247-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL251-.Ltext0
	.quad	.LVL266-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL267-.Ltext0
	.quad	.LVL278-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL278-.Ltext0
	.quad	.LVL281-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -68
	.quad	.LVL282-.Ltext0
	.quad	.LVL286-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -68
	.quad	.LVL295-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL296-.Ltext0
	.quad	.LFE5018-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST143:
	.quad	.LVL245-.Ltext0
	.quad	.LVL246-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL263-.Ltext0
	.quad	.LVL264-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL269-.Ltext0
	.quad	.LVL270-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL290-.Ltext0
	.quad	.LVL291-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LLST144:
	.quad	.LVL241-.Ltext0
	.quad	.LVL242-.Ltext0
	.value	0x5
	.byte	0x7c
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x9f
	.quad	.LVL248-.Ltext0
	.quad	.LVL252-.Ltext0
	.value	0x5
	.byte	0x7c
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x9f
	.quad	.LVL267-.Ltext0
	.quad	.LVL276-.Ltext0
	.value	0x5
	.byte	0x7c
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x9f
	.quad	.LVL296-.Ltext0
	.quad	.LFE5018-.Ltext0
	.value	0x5
	.byte	0x7c
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x9f
	.quad	0
	.quad	0
.LLST145:
	.quad	.LVL255-.Ltext0
	.quad	.LVL256-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL256-.Ltext0
	.quad	.LVL266-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL273-.Ltext0
	.quad	.LVL274-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL274-1-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL296-.Ltext0
	.quad	.LFE5018-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST146:
	.quad	.LVL255-.Ltext0
	.quad	.LVL256-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 8
	.quad	.LVL277-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL296-.Ltext0
	.quad	.LFE5018-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 8
	.quad	0
	.quad	0
.LLST147:
	.quad	.LVL255-.Ltext0
	.quad	.LVL259-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL259-.Ltext0
	.quad	.LVL260-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL260-.Ltext0
	.quad	.LVL261-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL261-.Ltext0
	.quad	.LVL266-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL277-.Ltext0
	.quad	.LVL280-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL280-.Ltext0
	.quad	.LVL282-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL282-.Ltext0
	.quad	.LVL288-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL288-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL297-.Ltext0
	.quad	.LFE5018-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST148:
	.quad	.LVL257-.Ltext0
	.quad	.LVL261-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL278-.Ltext0
	.quad	.LVL282-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST149:
	.quad	.LVL295-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST132:
	.quad	.LVL221-.Ltext0
	.quad	.LVL224-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL224-.Ltext0
	.quad	.LVL228-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL228-.Ltext0
	.quad	.LVL229-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL229-.Ltext0
	.quad	.LVL235-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL235-.Ltext0
	.quad	.LFE5017-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST133:
	.quad	.LVL221-.Ltext0
	.quad	.LVL224-.Ltext0
	.value	0x6
	.byte	0x54
	.byte	0x93
	.uleb128 0x8
	.byte	0x51
	.byte	0x93
	.uleb128 0x8
	.quad	.LVL224-.Ltext0
	.quad	.LVL226-.Ltext0
	.value	0x6
	.byte	0x5d
	.byte	0x93
	.uleb128 0x8
	.byte	0x5c
	.byte	0x93
	.uleb128 0x8
	.quad	.LVL226-.Ltext0
	.quad	.LVL227-.Ltext0
	.value	0x6
	.byte	0x5d
	.byte	0x93
	.uleb128 0x8
	.byte	0x51
	.byte	0x93
	.uleb128 0x8
	.quad	.LVL227-.Ltext0
	.quad	.LVL230-1-.Ltext0
	.value	0x6
	.byte	0x54
	.byte	0x93
	.uleb128 0x8
	.byte	0x51
	.byte	0x93
	.uleb128 0x8
	.quad	.LVL230-1-.Ltext0
	.quad	.LVL235-.Ltext0
	.value	0x6
	.byte	0x5d
	.byte	0x93
	.uleb128 0x8
	.byte	0x5c
	.byte	0x93
	.uleb128 0x8
	.quad	.LVL235-.Ltext0
	.quad	.LFE5017-.Ltext0
	.value	0x6
	.byte	0x54
	.byte	0x93
	.uleb128 0x8
	.byte	0x51
	.byte	0x93
	.uleb128 0x8
	.quad	0
	.quad	0
.LLST134:
	.quad	.LVL221-.Ltext0
	.quad	.LVL223-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL223-.Ltext0
	.quad	.LVL235-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.quad	.LVL235-.Ltext0
	.quad	.LFE5017-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST135:
	.quad	.LVL222-.Ltext0
	.quad	.LVL225-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL228-.Ltext0
	.quad	.LVL236-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL236-.Ltext0
	.quad	.LVL237-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 0
	.quad	.LVL237-.Ltext0
	.quad	.LVL238-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL238-.Ltext0
	.quad	.LFE5017-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 0
	.quad	0
	.quad	0
.LLST136:
	.quad	.LVL231-.Ltext0
	.quad	.LVL232-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL232-.Ltext0
	.quad	.LVL235-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST128:
	.quad	.LVL208-.Ltext0
	.quad	.LVL209-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL209-.Ltext0
	.quad	.LVL216-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL216-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL220-.Ltext0
	.quad	.LFE5016-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST129:
	.quad	.LVL208-.Ltext0
	.quad	.LVL211-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL211-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL219-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL220-.Ltext0
	.quad	.LFE5016-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LLST130:
	.quad	.LVL210-.Ltext0
	.quad	.LVL218-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST131:
	.quad	.LVL213-.Ltext0
	.quad	.LVL214-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL214-.Ltext0
	.quad	.LVL217-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST0:
	.quad	.LVL0-.Ltext0
	.quad	.LVL8-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL8-.Ltext0
	.quad	.LVL20-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -304
	.quad	.LVL20-.Ltext0
	.quad	.LVL201-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL201-.Ltext0
	.quad	.LVL203-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL203-.Ltext0
	.quad	.LVL207-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -304
	.quad	.LVL207-.Ltext0
	.quad	.LFE5015-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL0-.Ltext0
	.quad	.LVL6-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL6-.Ltext0
	.quad	.LVL20-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -312
	.quad	.LVL20-.Ltext0
	.quad	.LVL201-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL201-.Ltext0
	.quad	.LVL203-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL203-.Ltext0
	.quad	.LVL207-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -312
	.quad	.LVL207-.Ltext0
	.quad	.LFE5015-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL0-.Ltext0
	.quad	.LVL9-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL9-1-.Ltext0
	.quad	.LVL14-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -80
	.quad	.LVL14-.Ltext0
	.quad	.LVL201-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	.LVL201-.Ltext0
	.quad	.LVL203-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL203-.Ltext0
	.quad	.LVL207-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -80
	.quad	.LVL207-.Ltext0
	.quad	.LFE5015-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL0-.Ltext0
	.quad	.LVL9-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL9-1-.Ltext0
	.quad	.LVL15-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -112
	.quad	.LVL15-.Ltext0
	.quad	.LVL201-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.quad	.LVL201-.Ltext0
	.quad	.LVL203-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL203-.Ltext0
	.quad	.LVL207-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -112
	.quad	.LVL207-.Ltext0
	.quad	.LFE5015-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL0-.Ltext0
	.quad	.LVL9-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL9-1-.Ltext0
	.quad	.LVL20-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -328
	.quad	.LVL20-.Ltext0
	.quad	.LVL201-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.quad	.LVL201-.Ltext0
	.quad	.LVL203-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL203-.Ltext0
	.quad	.LVL207-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -328
	.quad	.LVL207-.Ltext0
	.quad	.LFE5015-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL4-.Ltext0
	.quad	.LVL5-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL201-.Ltext0
	.quad	.LVL202-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL202-.Ltext0
	.quad	.LVL203-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL207-.Ltext0
	.quad	.LFE5015-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST6:
	.quad	.LVL10-.Ltext0
	.quad	.LVL12-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL12-1-.Ltext0
	.quad	.LVL20-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL203-.Ltext0
	.quad	.LVL204-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL204-.Ltext0
	.quad	.LVL207-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL11-.Ltext0
	.quad	.LVL19-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL19-.Ltext0
	.quad	.LVL129-.Ltext0
	.value	0xb
	.byte	0x7f
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x31
	.byte	0x24
	.byte	0x9f
	.quad	.LVL157-.Ltext0
	.quad	.LVL201-.Ltext0
	.value	0xb
	.byte	0x7f
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x31
	.byte	0x24
	.byte	0x9f
	.quad	.LVL205-.Ltext0
	.quad	.LVL207-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST8:
	.quad	.LVL13-.Ltext0
	.quad	.LVL16-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL16-1-.Ltext0
	.quad	.LVL20-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -280
	.quad	.LVL205-.Ltext0
	.quad	.LVL206-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL206-1-.Ltext0
	.quad	.LVL207-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -280
	.quad	0
	.quad	0
.LLST9:
	.quad	.LVL78-.Ltext0
	.quad	.LVL130-.Ltext0
	.value	0xd
	.byte	0x76
	.sleb128 -272
	.byte	0x93
	.uleb128 0x10
	.byte	0x76
	.sleb128 -80
	.byte	0x93
	.uleb128 0x10
	.byte	0x93
	.uleb128 0x90
	.quad	.LVL130-.Ltext0
	.quad	.LVL156-.Ltext0
	.value	0x8
	.byte	0x76
	.sleb128 -272
	.byte	0x93
	.uleb128 0x10
	.byte	0x93
	.uleb128 0xa0
	.quad	.LVL157-.Ltext0
	.quad	.LVL159-.Ltext0
	.value	0xd
	.byte	0x76
	.sleb128 -272
	.byte	0x93
	.uleb128 0x10
	.byte	0x76
	.sleb128 -80
	.byte	0x93
	.uleb128 0x10
	.byte	0x93
	.uleb128 0x90
	.quad	.LVL159-.Ltext0
	.quad	.LVL161-.Ltext0
	.value	0x8
	.byte	0x76
	.sleb128 -272
	.byte	0x93
	.uleb128 0x10
	.byte	0x93
	.uleb128 0xa0
	.quad	.LVL164-.Ltext0
	.quad	.LVL165-.Ltext0
	.value	0xd
	.byte	0x76
	.sleb128 -272
	.byte	0x93
	.uleb128 0x10
	.byte	0x76
	.sleb128 -80
	.byte	0x93
	.uleb128 0x10
	.byte	0x93
	.uleb128 0x90
	.quad	0
	.quad	0
.LLST10:
	.quad	.LVL18-.Ltext0
	.quad	.LVL108-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL108-.Ltext0
	.quad	.LVL110-.Ltext0
	.value	0x4
	.byte	0x7b
	.sleb128 0
	.byte	0x20
	.byte	0x9f
	.quad	.LVL110-.Ltext0
	.quad	.LVL156-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL157-.Ltext0
	.quad	.LVL160-1-.Ltext0
	.value	0x4
	.byte	0x7b
	.sleb128 0
	.byte	0x20
	.byte	0x9f
	.quad	.LVL160-.Ltext0
	.quad	.LVL201-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST12:
	.quad	.LVL18-.Ltext0
	.quad	.LVL20-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST13:
	.quad	.LVL24-.Ltext0
	.quad	.LVL156-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL157-.Ltext0
	.quad	.LVL161-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL164-.Ltext0
	.quad	.LVL165-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0
	.quad	0
.LLST14:
	.quad	.LVL78-.Ltext0
	.quad	.LVL102-.Ltext0
	.value	0x1
	.byte	0x5b
	.quad	.LVL164-.Ltext0
	.quad	.LVL165-.Ltext0
	.value	0x1
	.byte	0x5b
	.quad	0
	.quad	0
.LLST43:
	.quad	.LVL20-.Ltext0
	.quad	.LVL21-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -64
	.byte	0x9f
	.quad	.LVL165-.Ltext0
	.quad	.LVL166-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -64
	.byte	0x9f
	.quad	.LVL169-.Ltext0
	.quad	.LVL170-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -64
	.byte	0x9f
	.quad	.LVL173-.Ltext0
	.quad	.LVL174-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -64
	.byte	0x9f
	.quad	.LVL177-.Ltext0
	.quad	.LVL178-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -64
	.byte	0x9f
	.quad	.LVL181-.Ltext0
	.quad	.LVL182-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -64
	.byte	0x9f
	.quad	.LVL185-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -64
	.byte	0x9f
	.quad	.LVL189-.Ltext0
	.quad	.LVL190-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -64
	.byte	0x9f
	.quad	.LVL193-.Ltext0
	.quad	.LVL194-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -64
	.byte	0x9f
	.quad	.LVL197-.Ltext0
	.quad	.LVL198-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -64
	.byte	0x9f
	.quad	0
	.quad	0
.LLST44:
	.quad	.LVL22-.Ltext0
	.quad	.LVL23-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -56
	.byte	0x9f
	.quad	.LVL167-.Ltext0
	.quad	.LVL168-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -56
	.byte	0x9f
	.quad	.LVL171-.Ltext0
	.quad	.LVL172-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -56
	.byte	0x9f
	.quad	.LVL175-.Ltext0
	.quad	.LVL176-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -56
	.byte	0x9f
	.quad	.LVL179-.Ltext0
	.quad	.LVL180-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -56
	.byte	0x9f
	.quad	.LVL183-.Ltext0
	.quad	.LVL184-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -56
	.byte	0x9f
	.quad	.LVL187-.Ltext0
	.quad	.LVL188-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -56
	.byte	0x9f
	.quad	.LVL191-.Ltext0
	.quad	.LVL192-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -56
	.byte	0x9f
	.quad	.LVL195-.Ltext0
	.quad	.LVL196-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -56
	.byte	0x9f
	.quad	.LVL199-.Ltext0
	.quad	.LVL200-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -56
	.byte	0x9f
	.quad	0
	.quad	0
.LLST15:
	.quad	.LVL78-.Ltext0
	.quad	.LVL105-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL105-.Ltext0
	.quad	.LVL107-.Ltext0
	.value	0x3
	.byte	0x75
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL107-.Ltext0
	.quad	.LVL109-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL157-.Ltext0
	.quad	.LVL158-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL164-.Ltext0
	.quad	.LVL165-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST16:
	.quad	.LVL79-.Ltext0
	.quad	.LVL93-.Ltext0
	.value	0x5
	.byte	0x67
	.byte	0x93
	.uleb128 0x20
	.byte	0x93
	.uleb128 0x40
	.quad	.LVL98-.Ltext0
	.quad	.LVL102-.Ltext0
	.value	0x5
	.byte	0x67
	.byte	0x93
	.uleb128 0x20
	.byte	0x93
	.uleb128 0x40
	.quad	.LVL103-.Ltext0
	.quad	.LVL107-.Ltext0
	.value	0x5
	.byte	0x63
	.byte	0x93
	.uleb128 0x20
	.byte	0x93
	.uleb128 0x40
	.quad	0
	.quad	0
.LLST17:
	.quad	.LVL79-.Ltext0
	.quad	.LVL99-.Ltext0
	.value	0x5
	.byte	0x63
	.byte	0x93
	.uleb128 0x20
	.byte	0x93
	.uleb128 0x40
	.quad	.LVL100-.Ltext0
	.quad	.LVL102-.Ltext0
	.value	0x5
	.byte	0x63
	.byte	0x93
	.uleb128 0x20
	.byte	0x93
	.uleb128 0x40
	.quad	0
	.quad	0
.LLST18:
	.quad	.LVL78-.Ltext0
	.quad	.LVL79-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL79-.Ltext0
	.quad	.LVL102-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL164-.Ltext0
	.quad	.LVL165-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST19:
	.quad	.LVL78-.Ltext0
	.quad	.LVL79-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL164-.Ltext0
	.quad	.LVL165-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST20:
	.quad	.LVL79-.Ltext0
	.quad	.LVL96-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 0
	.quad	.LVL96-.Ltext0
	.quad	.LVL101-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 -8
	.quad	0
	.quad	0
.LLST21:
	.quad	.LVL91-.Ltext0
	.quad	.LVL95-.Ltext0
	.value	0x16
	.byte	0x70
	.sleb128 0
	.byte	0x7e
	.sleb128 0
	.byte	0x1a
	.byte	0x75
	.sleb128 0
	.byte	0x27
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x31
	.byte	0x1c
	.byte	0x8
	.byte	0x20
	.byte	0x25
	.byte	0x31
	.byte	0x1a
	.byte	0x9f
	.quad	0
	.quad	0
.LLST22:
	.quad	.LVL94-.Ltext0
	.quad	.LVL102-.Ltext0
	.value	0x8
	.byte	0x71
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x30
	.byte	0x2e
	.byte	0x9f
	.quad	0
	.quad	0
.LLST23:
	.quad	.LVL97-.Ltext0
	.quad	.LVL102-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST24:
	.quad	.LVL80-.Ltext0
	.quad	.LVL102-.Ltext0
	.value	0xd
	.byte	0x76
	.sleb128 -272
	.byte	0x93
	.uleb128 0x10
	.byte	0x76
	.sleb128 -80
	.byte	0x93
	.uleb128 0x10
	.byte	0x93
	.uleb128 0x90
	.quad	0
	.quad	0
.LLST25:
	.quad	.LVL80-.Ltext0
	.quad	.LVL91-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 0
	.quad	0
	.quad	0
.LLST26:
	.quad	.LVL80-.Ltext0
	.quad	.LVL81-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -80
	.quad	0
	.quad	0
.LLST27:
	.quad	.LVL81-.Ltext0
	.quad	.LVL82-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -112
	.quad	0
	.quad	0
.LLST28:
	.quad	.LVL82-.Ltext0
	.quad	.LVL83-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -144
	.quad	0
	.quad	0
.LLST29:
	.quad	.LVL83-.Ltext0
	.quad	.LVL84-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -176
	.quad	0
	.quad	0
.LLST30:
	.quad	.LVL84-.Ltext0
	.quad	.LVL85-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -208
	.quad	0
	.quad	0
.LLST31:
	.quad	.LVL85-.Ltext0
	.quad	.LVL86-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -224
	.quad	0
	.quad	0
.LLST32:
	.quad	.LVL86-.Ltext0
	.quad	.LVL87-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -240
	.quad	0
	.quad	0
.LLST33:
	.quad	.LVL87-.Ltext0
	.quad	.LVL88-.Ltext0
	.value	0x1
	.byte	0x6b
	.quad	0
	.quad	0
.LLST34:
	.quad	.LVL88-.Ltext0
	.quad	.LVL89-.Ltext0
	.value	0x1
	.byte	0x6c
	.quad	0
	.quad	0
.LLST35:
	.quad	.LVL89-.Ltext0
	.quad	.LVL90-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -256
	.quad	0
	.quad	0
.LLST36:
	.quad	.LVL92-.Ltext0
	.quad	.LVL94-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0
	.quad	0
.LLST38:
	.quad	.LVL79-.Ltext0
	.quad	.LVL80-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 0
	.quad	0
	.quad	0
.LLST39:
	.quad	.LVL98-.Ltext0
	.quad	.LVL99-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0
	.quad	0
.LLST40:
	.quad	.LVL102-.Ltext0
	.quad	.LVL103-.Ltext0
	.value	0x30
	.byte	0x9e
	.uleb128 0x8
	.long	0xffffffff
	.long	0xffffffff
	.byte	0x93
	.uleb128 0x8
	.byte	0x9e
	.uleb128 0x8
	.long	0xffffffff
	.long	0xffffffff
	.byte	0x93
	.uleb128 0x8
	.byte	0x9e
	.uleb128 0x8
	.long	0xffffffff
	.long	0xffffffff
	.byte	0x93
	.uleb128 0x8
	.byte	0x9e
	.uleb128 0x8
	.long	0xffffffff
	.long	0xffffffff
	.byte	0x93
	.uleb128 0x8
	.quad	0
	.quad	0
.LLST41:
	.quad	.LVL103-.Ltext0
	.quad	.LVL104-.Ltext0
	.value	0x30
	.byte	0x9e
	.uleb128 0x8
	.long	0xffffffff
	.long	0xffffffff
	.byte	0x93
	.uleb128 0x8
	.byte	0x9e
	.uleb128 0x8
	.long	0xffffffff
	.long	0xffffffff
	.byte	0x93
	.uleb128 0x8
	.byte	0x9e
	.uleb128 0x8
	.long	0xffffffff
	.long	0xffffffff
	.byte	0x93
	.uleb128 0x8
	.byte	0x9e
	.uleb128 0x8
	.long	0xffffffff
	.long	0xffffffff
	.byte	0x93
	.uleb128 0x8
	.quad	0
	.quad	0
.LLST42:
	.quad	.LVL104-.Ltext0
	.quad	.LVL106-.Ltext0
	.value	0x30
	.byte	0x9e
	.uleb128 0x8
	.long	0xffffffff
	.long	0xffffffff
	.byte	0x93
	.uleb128 0x8
	.byte	0x9e
	.uleb128 0x8
	.long	0xffffffff
	.long	0xffffffff
	.byte	0x93
	.uleb128 0x8
	.byte	0x9e
	.uleb128 0x8
	.long	0xffffffff
	.long	0xffffffff
	.byte	0x93
	.uleb128 0x8
	.byte	0x9e
	.uleb128 0x8
	.long	0xffffffff
	.long	0xffffffff
	.byte	0x93
	.uleb128 0x8
	.quad	0
	.quad	0
.LLST45:
	.quad	.LVL24-.Ltext0
	.quad	.LVL156-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -64
	.byte	0x9f
	.quad	.LVL157-.Ltext0
	.quad	.LVL161-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -64
	.byte	0x9f
	.quad	.LVL164-.Ltext0
	.quad	.LVL165-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -64
	.byte	0x9f
	.quad	0
	.quad	0
.LLST46:
	.quad	.LVL24-.Ltext0
	.quad	.LVL25-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -56
	.quad	0
	.quad	0
.LLST47:
	.quad	.LVL24-.Ltext0
	.quad	.LVL25-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -64
	.quad	0
	.quad	0
.LLST48:
	.quad	.LVL25-.Ltext0
	.quad	.LVL29-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0
	.quad	0
.LLST49:
	.quad	.LVL25-.Ltext0
	.quad	.LVL26-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	0
	.quad	0
.LLST51:
	.quad	.LVL26-.Ltext0
	.quad	.LVL27-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST52:
	.quad	.LVL28-.Ltext0
	.quad	.LVL29-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST53:
	.quad	.LVL31-.Ltext0
	.quad	.LVL35-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	0
	.quad	0
.LLST54:
	.quad	.LVL31-.Ltext0
	.quad	.LVL32-.Ltext0
	.value	0x1
	.byte	0x6c
	.quad	0
	.quad	0
.LLST56:
	.quad	.LVL32-.Ltext0
	.quad	.LVL33-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST57:
	.quad	.LVL34-.Ltext0
	.quad	.LVL35-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST58:
	.quad	.LVL36-.Ltext0
	.quad	.LVL40-.Ltext0
	.value	0x1
	.byte	0x6b
	.quad	0
	.quad	0
.LLST59:
	.quad	.LVL36-.Ltext0
	.quad	.LVL37-.Ltext0
	.value	0x1
	.byte	0x6a
	.quad	0
	.quad	0
.LLST61:
	.quad	.LVL37-.Ltext0
	.quad	.LVL38-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST62:
	.quad	.LVL39-.Ltext0
	.quad	.LVL40-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST63:
	.quad	.LVL41-.Ltext0
	.quad	.LVL45-.Ltext0
	.value	0x1
	.byte	0x69
	.quad	0
	.quad	0
.LLST64:
	.quad	.LVL41-.Ltext0
	.quad	.LVL42-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	0
	.quad	0
.LLST66:
	.quad	.LVL42-.Ltext0
	.quad	.LVL43-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST67:
	.quad	.LVL44-.Ltext0
	.quad	.LVL45-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST68:
	.quad	.LVL46-.Ltext0
	.quad	.LVL50-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	0
	.quad	0
.LLST69:
	.quad	.LVL46-.Ltext0
	.quad	.LVL47-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	0
	.quad	0
.LLST71:
	.quad	.LVL47-.Ltext0
	.quad	.LVL48-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST72:
	.quad	.LVL49-.Ltext0
	.quad	.LVL50-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST73:
	.quad	.LVL51-.Ltext0
	.quad	.LVL55-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0
	.quad	0
.LLST74:
	.quad	.LVL51-.Ltext0
	.quad	.LVL52-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	0
	.quad	0
.LLST76:
	.quad	.LVL52-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST77:
	.quad	.LVL54-.Ltext0
	.quad	.LVL55-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST78:
	.quad	.LVL56-.Ltext0
	.quad	.LVL60-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	0
	.quad	0
.LLST79:
	.quad	.LVL56-.Ltext0
	.quad	.LVL57-.Ltext0
	.value	0x1
	.byte	0x67
	.quad	0
	.quad	0
.LLST81:
	.quad	.LVL57-.Ltext0
	.quad	.LVL58-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST82:
	.quad	.LVL59-.Ltext0
	.quad	.LVL60-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST83:
	.quad	.LVL61-.Ltext0
	.quad	.LVL65-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	0
	.quad	0
.LLST84:
	.quad	.LVL61-.Ltext0
	.quad	.LVL62-.Ltext0
	.value	0x1
	.byte	0x6c
	.quad	0
	.quad	0
.LLST86:
	.quad	.LVL62-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST87:
	.quad	.LVL64-.Ltext0
	.quad	.LVL65-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST88:
	.quad	.LVL67-.Ltext0
	.quad	.LVL71-.Ltext0
	.value	0x1
	.byte	0x6a
	.quad	0
	.quad	0
.LLST89:
	.quad	.LVL67-.Ltext0
	.quad	.LVL68-.Ltext0
	.value	0x1
	.byte	0x6b
	.quad	0
	.quad	0
.LLST91:
	.quad	.LVL68-.Ltext0
	.quad	.LVL69-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST92:
	.quad	.LVL70-.Ltext0
	.quad	.LVL71-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST93:
	.quad	.LVL66-.Ltext0
	.quad	.LVL67-.Ltext0
	.value	0x2
	.byte	0x4b
	.byte	0x9f
	.quad	0
	.quad	0
.LLST94:
	.quad	.LVL66-.Ltext0
	.quad	.LVL67-.Ltext0
	.value	0x1
	.byte	0x6b
	.quad	0
	.quad	0
.LLST95:
	.quad	.LVL73-.Ltext0
	.quad	.LVL77-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	0
	.quad	0
.LLST96:
	.quad	.LVL73-.Ltext0
	.quad	.LVL74-.Ltext0
	.value	0x1
	.byte	0x6c
	.quad	0
	.quad	0
.LLST98:
	.quad	.LVL74-.Ltext0
	.quad	.LVL75-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST99:
	.quad	.LVL76-.Ltext0
	.quad	.LVL77-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST100:
	.quad	.LVL72-.Ltext0
	.quad	.LVL73-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x36
	.byte	0x9f
	.quad	0
	.quad	0
.LLST101:
	.quad	.LVL72-.Ltext0
	.quad	.LVL73-.Ltext0
	.value	0x1
	.byte	0x6c
	.quad	0
	.quad	0
.LLST102:
	.quad	.LVL110-.Ltext0
	.quad	.LVL111-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST103:
	.quad	.LVL111-.Ltext0
	.quad	.LVL113-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 0
	.quad	.LVL113-.Ltext0
	.quad	.LVL127-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -8
	.quad	0
	.quad	0
.LLST104:
	.quad	.LVL125-.Ltext0
	.quad	.LVL126-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST105:
	.quad	.LVL126-.Ltext0
	.quad	.LVL128-.Ltext0
	.value	0x1
	.byte	0x5b
	.quad	0
	.quad	0
.LLST106:
	.quad	.LVL112-.Ltext0
	.quad	.LVL128-.Ltext0
	.value	0xb
	.byte	0x76
	.sleb128 -272
	.byte	0x93
	.uleb128 0x10
	.byte	0x6e
	.byte	0x93
	.uleb128 0x10
	.byte	0x93
	.uleb128 0x90
	.quad	0
	.quad	0
.LLST107:
	.quad	.LVL112-.Ltext0
	.quad	.LVL113-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 0
	.quad	.LVL113-.Ltext0
	.quad	.LVL124-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -8
	.quad	0
	.quad	0
.LLST108:
	.quad	.LVL112-.Ltext0
	.quad	.LVL114-.Ltext0
	.value	0x1
	.byte	0x6e
	.quad	0
	.quad	0
.LLST109:
	.quad	.LVL114-.Ltext0
	.quad	.LVL115-.Ltext0
	.value	0x1
	.byte	0x6f
	.quad	0
	.quad	0
.LLST110:
	.quad	.LVL115-.Ltext0
	.quad	.LVL116-.Ltext0
	.value	0x2
	.byte	0x90
	.uleb128 0x20
	.quad	0
	.quad	0
.LLST111:
	.quad	.LVL116-.Ltext0
	.quad	.LVL117-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	0
	.quad	0
.LLST112:
	.quad	.LVL117-.Ltext0
	.quad	.LVL118-.Ltext0
	.value	0x1
	.byte	0x67
	.quad	0
	.quad	0
.LLST113:
	.quad	.LVL118-.Ltext0
	.quad	.LVL119-.Ltext0
	.value	0x1
	.byte	0x68
	.quad	0
	.quad	0
.LLST114:
	.quad	.LVL119-.Ltext0
	.quad	.LVL120-.Ltext0
	.value	0x1
	.byte	0x69
	.quad	0
	.quad	0
.LLST115:
	.quad	.LVL120-.Ltext0
	.quad	.LVL121-.Ltext0
	.value	0x1
	.byte	0x6b
	.quad	0
	.quad	0
.LLST116:
	.quad	.LVL121-.Ltext0
	.quad	.LVL122-.Ltext0
	.value	0x1
	.byte	0x6c
	.quad	0
	.quad	0
.LLST117:
	.quad	.LVL122-.Ltext0
	.quad	.LVL123-.Ltext0
	.value	0x1
	.byte	0x6a
	.quad	0
	.quad	0
.LLST118:
	.quad	.LVL111-.Ltext0
	.quad	.LVL112-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 0
	.quad	0
	.quad	0
.LLST119:
	.quad	.LVL128-.Ltext0
	.quad	.LVL131-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL131-.Ltext0
	.quad	.LVL146-.Ltext0
	.value	0x7
	.byte	0x7b
	.sleb128 0
	.byte	0xf3
	.uleb128 0x1
	.byte	0x58
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST120:
	.quad	.LVL131-.Ltext0
	.quad	.LVL145-.Ltext0
	.value	0x2
	.byte	0x7d
	.sleb128 0
	.quad	.LVL145-.Ltext0
	.quad	.LVL147-.Ltext0
	.value	0x2
	.byte	0x7d
	.sleb128 -8
	.quad	0
	.quad	0
.LLST121:
	.quad	.LVL132-.Ltext0
	.quad	.LVL135-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL142-.Ltext0
	.quad	.LVL143-.Ltext0
	.value	0x6
	.byte	0x70
	.sleb128 0
	.byte	0x7f
	.sleb128 0
	.byte	0x21
	.byte	0x9f
	.quad	0
	.quad	0
.LLST123:
	.quad	.LVL132-.Ltext0
	.quad	.LVL133-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST124:
	.quad	.LVL133-.Ltext0
	.quad	.LVL134-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL134-.Ltext0
	.quad	.LVL136-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL136-.Ltext0
	.quad	.LVL137-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST125:
	.quad	.LVL138-.Ltext0
	.quad	.LVL139-.Ltext0
	.value	0xd
	.byte	0x71
	.sleb128 0
	.byte	0x34
	.byte	0x24
	.byte	0x74
	.sleb128 0
	.byte	0x38
	.byte	0x24
	.byte	0x21
	.byte	0x7a
	.sleb128 0
	.byte	0x21
	.byte	0x9f
	.quad	0
	.quad	0
.LLST122:
	.quad	.LVL131-.Ltext0
	.quad	.LVL132-.Ltext0
	.value	0x2
	.byte	0x7d
	.sleb128 0
	.quad	0
	.quad	0
.LLST126:
	.quad	.LVL148-.Ltext0
	.quad	.LVL149-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST127:
	.quad	.LVL150-.Ltext0
	.quad	.LVL151-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL152-.Ltext0
	.quad	.LVL153-.Ltext0
	.value	0x4
	.byte	0x70
	.sleb128 -96
	.byte	0x9f
	.quad	0
	.quad	0
.LLST11:
	.quad	.LVL1-.Ltext0
	.quad	.LVL2-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL2-.Ltext0
	.quad	.LVL3-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB875-.Ltext0
	.quad	.LBE875-.Ltext0
	.quad	.LBB1231-.Ltext0
	.quad	.LBE1231-.Ltext0
	.quad	.LBB1347-.Ltext0
	.quad	.LBE1347-.Ltext0
	.quad	.LBB1348-.Ltext0
	.quad	.LBE1348-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB876-.Ltext0
	.quad	.LBE876-.Ltext0
	.quad	.LBB1228-.Ltext0
	.quad	.LBE1228-.Ltext0
	.quad	.LBB1229-.Ltext0
	.quad	.LBE1229-.Ltext0
	.quad	.LBB1230-.Ltext0
	.quad	.LBE1230-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB877-.Ltext0
	.quad	.LBE877-.Ltext0
	.quad	.LBB971-.Ltext0
	.quad	.LBE971-.Ltext0
	.quad	.LBB1223-.Ltext0
	.quad	.LBE1223-.Ltext0
	.quad	.LBB1225-.Ltext0
	.quad	.LBE1225-.Ltext0
	.quad	.LBB1226-.Ltext0
	.quad	.LBE1226-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB878-.Ltext0
	.quad	.LBE878-.Ltext0
	.quad	.LBB967-.Ltext0
	.quad	.LBE967-.Ltext0
	.quad	.LBB968-.Ltext0
	.quad	.LBE968-.Ltext0
	.quad	.LBB969-.Ltext0
	.quad	.LBE969-.Ltext0
	.quad	.LBB970-.Ltext0
	.quad	.LBE970-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB879-.Ltext0
	.quad	.LBE879-.Ltext0
	.quad	.LBB956-.Ltext0
	.quad	.LBE956-.Ltext0
	.quad	.LBB957-.Ltext0
	.quad	.LBE957-.Ltext0
	.quad	.LBB958-.Ltext0
	.quad	.LBE958-.Ltext0
	.quad	.LBB959-.Ltext0
	.quad	.LBE959-.Ltext0
	.quad	.LBB966-.Ltext0
	.quad	.LBE966-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB880-.Ltext0
	.quad	.LBE880-.Ltext0
	.quad	.LBB954-.Ltext0
	.quad	.LBE954-.Ltext0
	.quad	.LBB955-.Ltext0
	.quad	.LBE955-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB881-.Ltext0
	.quad	.LBE881-.Ltext0
	.quad	.LBB916-.Ltext0
	.quad	.LBE916-.Ltext0
	.quad	.LBB917-.Ltext0
	.quad	.LBE917-.Ltext0
	.quad	.LBB924-.Ltext0
	.quad	.LBE924-.Ltext0
	.quad	.LBB927-.Ltext0
	.quad	.LBE927-.Ltext0
	.quad	.LBB930-.Ltext0
	.quad	.LBE930-.Ltext0
	.quad	.LBB943-.Ltext0
	.quad	.LBE943-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB918-.Ltext0
	.quad	.LBE918-.Ltext0
	.quad	.LBB939-.Ltext0
	.quad	.LBE939-.Ltext0
	.quad	.LBB942-.Ltext0
	.quad	.LBE942-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB944-.Ltext0
	.quad	.LBE944-.Ltext0
	.quad	.LBB947-.Ltext0
	.quad	.LBE947-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB972-.Ltext0
	.quad	.LBE972-.Ltext0
	.quad	.LBB1227-.Ltext0
	.quad	.LBE1227-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB973-.Ltext0
	.quad	.LBE973-.Ltext0
	.quad	.LBB995-.Ltext0
	.quad	.LBE995-.Ltext0
	.quad	.LBB997-.Ltext0
	.quad	.LBE997-.Ltext0
	.quad	.LBB999-.Ltext0
	.quad	.LBE999-.Ltext0
	.quad	.LBB1001-.Ltext0
	.quad	.LBE1001-.Ltext0
	.quad	.LBB1003-.Ltext0
	.quad	.LBE1003-.Ltext0
	.quad	.LBB1005-.Ltext0
	.quad	.LBE1005-.Ltext0
	.quad	.LBB1007-.Ltext0
	.quad	.LBE1007-.Ltext0
	.quad	.LBB1009-.Ltext0
	.quad	.LBE1009-.Ltext0
	.quad	.LBB1011-.Ltext0
	.quad	.LBE1011-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB984-.Ltext0
	.quad	.LBE984-.Ltext0
	.quad	.LBB996-.Ltext0
	.quad	.LBE996-.Ltext0
	.quad	.LBB998-.Ltext0
	.quad	.LBE998-.Ltext0
	.quad	.LBB1000-.Ltext0
	.quad	.LBE1000-.Ltext0
	.quad	.LBB1002-.Ltext0
	.quad	.LBE1002-.Ltext0
	.quad	.LBB1004-.Ltext0
	.quad	.LBE1004-.Ltext0
	.quad	.LBB1006-.Ltext0
	.quad	.LBE1006-.Ltext0
	.quad	.LBB1008-.Ltext0
	.quad	.LBE1008-.Ltext0
	.quad	.LBB1010-.Ltext0
	.quad	.LBE1010-.Ltext0
	.quad	.LBB1012-.Ltext0
	.quad	.LBE1012-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1013-.Ltext0
	.quad	.LBE1013-.Ltext0
	.quad	.LBB1224-.Ltext0
	.quad	.LBE1224-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1015-.Ltext0
	.quad	.LBE1015-.Ltext0
	.quad	.LBB1019-.Ltext0
	.quad	.LBE1019-.Ltext0
	.quad	.LBB1039-.Ltext0
	.quad	.LBE1039-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1020-.Ltext0
	.quad	.LBE1020-.Ltext0
	.quad	.LBB1040-.Ltext0
	.quad	.LBE1040-.Ltext0
	.quad	.LBB1060-.Ltext0
	.quad	.LBE1060-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1033-.Ltext0
	.quad	.LBE1033-.Ltext0
	.quad	.LBB1036-.Ltext0
	.quad	.LBE1036-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1041-.Ltext0
	.quad	.LBE1041-.Ltext0
	.quad	.LBB1061-.Ltext0
	.quad	.LBE1061-.Ltext0
	.quad	.LBB1081-.Ltext0
	.quad	.LBE1081-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1054-.Ltext0
	.quad	.LBE1054-.Ltext0
	.quad	.LBB1057-.Ltext0
	.quad	.LBE1057-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1062-.Ltext0
	.quad	.LBE1062-.Ltext0
	.quad	.LBB1082-.Ltext0
	.quad	.LBE1082-.Ltext0
	.quad	.LBB1102-.Ltext0
	.quad	.LBE1102-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1075-.Ltext0
	.quad	.LBE1075-.Ltext0
	.quad	.LBB1078-.Ltext0
	.quad	.LBE1078-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1083-.Ltext0
	.quad	.LBE1083-.Ltext0
	.quad	.LBB1103-.Ltext0
	.quad	.LBE1103-.Ltext0
	.quad	.LBB1123-.Ltext0
	.quad	.LBE1123-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1096-.Ltext0
	.quad	.LBE1096-.Ltext0
	.quad	.LBB1099-.Ltext0
	.quad	.LBE1099-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1104-.Ltext0
	.quad	.LBE1104-.Ltext0
	.quad	.LBB1124-.Ltext0
	.quad	.LBE1124-.Ltext0
	.quad	.LBB1144-.Ltext0
	.quad	.LBE1144-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1117-.Ltext0
	.quad	.LBE1117-.Ltext0
	.quad	.LBB1120-.Ltext0
	.quad	.LBE1120-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1125-.Ltext0
	.quad	.LBE1125-.Ltext0
	.quad	.LBB1145-.Ltext0
	.quad	.LBE1145-.Ltext0
	.quad	.LBB1165-.Ltext0
	.quad	.LBE1165-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1138-.Ltext0
	.quad	.LBE1138-.Ltext0
	.quad	.LBB1141-.Ltext0
	.quad	.LBE1141-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1146-.Ltext0
	.quad	.LBE1146-.Ltext0
	.quad	.LBB1166-.Ltext0
	.quad	.LBE1166-.Ltext0
	.quad	.LBB1184-.Ltext0
	.quad	.LBE1184-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1159-.Ltext0
	.quad	.LBE1159-.Ltext0
	.quad	.LBB1162-.Ltext0
	.quad	.LBE1162-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1167-.Ltext0
	.quad	.LBE1167-.Ltext0
	.quad	.LBB1185-.Ltext0
	.quad	.LBE1185-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1186-.Ltext0
	.quad	.LBE1186-.Ltext0
	.quad	.LBB1203-.Ltext0
	.quad	.LBE1203-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1204-.Ltext0
	.quad	.LBE1204-.Ltext0
	.quad	.LBB1221-.Ltext0
	.quad	.LBE1221-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1234-.Ltext0
	.quad	.LBE1234-.Ltext0
	.quad	.LBB1266-.Ltext0
	.quad	.LBE1266-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1271-.Ltext0
	.quad	.LBE1271-.Ltext0
	.quad	.LBB1283-.Ltext0
	.quad	.LBE1283-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1276-.Ltext0
	.quad	.LBE1276-.Ltext0
	.quad	.LBB1282-.Ltext0
	.quad	.LBE1282-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1279-.Ltext0
	.quad	.LBE1279-.Ltext0
	.quad	.LBB1284-.Ltext0
	.quad	.LBE1284-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1290-.Ltext0
	.quad	.LBE1290-.Ltext0
	.quad	.LBB1343-.Ltext0
	.quad	.LBE1343-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1291-.Ltext0
	.quad	.LBE1291-.Ltext0
	.quad	.LBB1326-.Ltext0
	.quad	.LBE1326-.Ltext0
	.quad	.LBB1329-.Ltext0
	.quad	.LBE1329-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1295-.Ltext0
	.quad	.LBE1295-.Ltext0
	.quad	.LBB1328-.Ltext0
	.quad	.LBE1328-.Ltext0
	.quad	.LBB1331-.Ltext0
	.quad	.LBE1331-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1299-.Ltext0
	.quad	.LBE1299-.Ltext0
	.quad	.LBB1327-.Ltext0
	.quad	.LBE1327-.Ltext0
	.quad	.LBB1334-.Ltext0
	.quad	.LBE1334-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1303-.Ltext0
	.quad	.LBE1303-.Ltext0
	.quad	.LBB1323-.Ltext0
	.quad	.LBE1323-.Ltext0
	.quad	.LBB1330-.Ltext0
	.quad	.LBE1330-.Ltext0
	.quad	.LBB1335-.Ltext0
	.quad	.LBE1335-.Ltext0
	.quad	.LBB1337-.Ltext0
	.quad	.LBE1337-.Ltext0
	.quad	.LBB1340-.Ltext0
	.quad	.LBE1340-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1310-.Ltext0
	.quad	.LBE1310-.Ltext0
	.quad	.LBB1324-.Ltext0
	.quad	.LBE1324-.Ltext0
	.quad	.LBB1333-.Ltext0
	.quad	.LBE1333-.Ltext0
	.quad	.LBB1336-.Ltext0
	.quad	.LBE1336-.Ltext0
	.quad	.LBB1339-.Ltext0
	.quad	.LBE1339-.Ltext0
	.quad	.LBB1341-.Ltext0
	.quad	.LBE1341-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1317-.Ltext0
	.quad	.LBE1317-.Ltext0
	.quad	.LBB1325-.Ltext0
	.quad	.LBE1325-.Ltext0
	.quad	.LBB1332-.Ltext0
	.quad	.LBE1332-.Ltext0
	.quad	.LBB1338-.Ltext0
	.quad	.LBE1338-.Ltext0
	.quad	.LBB1342-.Ltext0
	.quad	.LBE1342-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1345-.Ltext0
	.quad	.LBE1345-.Ltext0
	.quad	.LBB1346-.Ltext0
	.quad	.LBE1346-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1349-.Ltext0
	.quad	.LBE1349-.Ltext0
	.quad	.LBB1350-.Ltext0
	.quad	.LBE1350-.Ltext0
	.quad	.LBB1351-.Ltext0
	.quad	.LBE1351-.Ltext0
	.quad	.LBB1366-.Ltext0
	.quad	.LBE1366-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1352-.Ltext0
	.quad	.LBE1352-.Ltext0
	.quad	.LBB1367-.Ltext0
	.quad	.LBE1367-.Ltext0
	.quad	.LBB1368-.Ltext0
	.quad	.LBE1368-.Ltext0
	.quad	.LBB1369-.Ltext0
	.quad	.LBE1369-.Ltext0
	.quad	.LBB1370-.Ltext0
	.quad	.LBE1370-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1353-.Ltext0
	.quad	.LBE1353-.Ltext0
	.quad	.LBB1360-.Ltext0
	.quad	.LBE1360-.Ltext0
	.quad	.LBB1361-.Ltext0
	.quad	.LBE1361-.Ltext0
	.quad	.LBB1362-.Ltext0
	.quad	.LBE1362-.Ltext0
	.quad	.LBB1363-.Ltext0
	.quad	.LBE1363-.Ltext0
	.quad	.LBB1364-.Ltext0
	.quad	.LBE1364-.Ltext0
	.quad	.LBB1365-.Ltext0
	.quad	.LBE1365-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1354-.Ltext0
	.quad	.LBE1354-.Ltext0
	.quad	.LBB1358-.Ltext0
	.quad	.LBE1358-.Ltext0
	.quad	.LBB1359-.Ltext0
	.quad	.LBE1359-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB1355-.Ltext0
	.quad	.LBE1355-.Ltext0
	.quad	.LBB1356-.Ltext0
	.quad	.LBE1356-.Ltext0
	.quad	.LBB1357-.Ltext0
	.quad	.LBE1357-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF79:
	.string	"SGX_ERROR_AE_INVALID_EPIDBLOB"
.LASF97:
	.string	"SGX_ERROR_PCL_GUID_MISMATCH"
.LASF16:
	.string	"size_t"
.LASF77:
	.string	"SGX_ERROR_SERVICE_UNAVAILABLE"
.LASF106:
	.string	"SGX_ERROR_FILE_CLOSE_FAILED"
.LASF162:
	.string	"hash_salt_64"
.LASF50:
	.string	"SGX_ERROR_INVALID_STATE"
.LASF160:
	.string	"hash_table_constructed"
.LASF26:
	.string	"__v4si"
.LASF253:
	.string	"src/sabd-enclave.c"
.LASF232:
	.string	"_mm256_blendv_pd"
.LASF135:
	.string	"replies_res"
.LASF248:
	.string	"memset_s"
.LASF143:
	.string	"sgxsd_enclave_server_terminate"
.LASF68:
	.string	"SGX_ERROR_MODE_INCOMPATIBLE"
.LASF239:
	.string	"_mm_xor_si128"
.LASF102:
	.string	"SGX_ERROR_FILE_CANT_OPEN_RECOVERY_FILE"
.LASF66:
	.string	"SGX_ERROR_DEVICE_BUSY"
.LASF185:
	.string	"ab_jid_result"
.LASF100:
	.string	"SGX_ERROR_FILE_NAME_MISMATCH"
.LASF155:
	.string	"hashed_ab_jids_size"
.LASF171:
	.string	"p_chain_blocks"
.LASF163:
	.string	"hash_salt_rand_res"
.LASF3:
	.string	"__uint8_t"
.LASF166:
	.string	"hash_slot_idx"
.LASF67:
	.string	"SGX_ERROR_INVALID_VERSION"
.LASF254:
	.string	"/home/arslan/sgxsdk2/sgxsdk/SampleCode/pristine/ContactDiscoveryService/enclave"
.LASF69:
	.string	"SGX_ERROR_ENCLAVE_FILE_ACCESS"
.LASF46:
	.string	"SGX_ERROR_UNEXPECTED"
.LASF150:
	.string	"chain_length"
.LASF41:
	.string	"sgxsd_server_terminate_args"
.LASF196:
	.string	"_mm256_set_epi64x"
.LASF82:
	.string	"SGX_ERROR_UPDATE_NEEDED"
.LASF9:
	.string	"long int"
.LASF23:
	.string	"__v2di"
.LASF24:
	.string	"__v2du"
.LASF169:
	.string	"chain_idx"
.LASF159:
	.string	"hash_salt"
.LASF177:
	.string	"jid_not_in_chain"
.LASF89:
	.string	"SGX_ERROR_MC_OVER_QUOTA"
.LASF0:
	.string	"signed char"
.LASF18:
	.string	"uint8_t"
.LASF229:
	.string	"__q00"
.LASF228:
	.string	"__q01"
.LASF227:
	.string	"__q02"
.LASF226:
	.string	"__q03"
.LASF225:
	.string	"__q04"
.LASF224:
	.string	"__q05"
.LASF223:
	.string	"__q06"
.LASF222:
	.string	"__q07"
.LASF221:
	.string	"__q08"
.LASF220:
	.string	"__q09"
.LASF1:
	.string	"unsigned char"
.LASF40:
	.string	"sabd_call_args_t"
.LASF149:
	.string	"ab_jids"
.LASF219:
	.string	"__q10"
.LASF218:
	.string	"__q11"
.LASF217:
	.string	"__q12"
.LASF216:
	.string	"__q13"
.LASF215:
	.string	"__q14"
.LASF214:
	.string	"__q15"
.LASF213:
	.string	"__q16"
.LASF212:
	.string	"__q17"
.LASF211:
	.string	"__q18"
.LASF210:
	.string	"__q19"
.LASF182:
	.string	"in_jid_hash_slot_idx"
.LASF114:
	.string	"sgxsd_msg_tag_t"
.LASF115:
	.string	"_Bool"
.LASF127:
	.string	"from"
.LASF88:
	.string	"SGX_ERROR_MC_USED_UP"
.LASF15:
	.string	"char"
.LASF209:
	.string	"__q20"
.LASF208:
	.string	"__q21"
.LASF207:
	.string	"__q22"
.LASF206:
	.string	"__q23"
.LASF205:
	.string	"__q24"
.LASF204:
	.string	"__q25"
.LASF203:
	.string	"__q26"
.LASF64:
	.string	"SGX_ERROR_MEMORY_MAP_CONFLICT"
.LASF201:
	.string	"__q28"
.LASF200:
	.string	"__q29"
.LASF191:
	.string	"_mm256_or_si256"
.LASF4:
	.string	"__uint16_t"
.LASF260:
	.string	"__builtin_memcpy"
.LASF121:
	.string	"sgxsd_msg_from_t"
.LASF199:
	.string	"__q30"
.LASF198:
	.string	"__q31"
.LASF241:
	.string	"_mm_set_epi64x"
.LASF141:
	.string	"p_prev_msg"
.LASF111:
	.string	"sgxsd_aes_gcm_key_t"
.LASF179:
	.string	"in_jid_idx"
.LASF84:
	.string	"SGX_ERROR_AE_SESSION_INVALID"
.LASF256:
	.string	"sgxsd_server_state"
.LASF42:
	.string	"in_jids"
.LASF101:
	.string	"SGX_ERROR_FILE_NOT_SGX_FILE"
.LASF197:
	.string	"_mm256_set_epi8"
.LASF167:
	.string	"chain_blocks"
.LASF45:
	.string	"SGX_SUCCESS"
.LASF98:
	.string	"SGX_ERROR_FILE_BAD_STATUS"
.LASF255:
	.string	"_status_t"
.LASF62:
	.string	"SGX_ERROR_OUT_OF_EPC"
.LASF237:
	.string	"_mm_shuffle_epi32"
.LASF250:
	.string	"malloc"
.LASF93:
	.string	"SGX_ERROR_PCL_ENCRYPTED"
.LASF48:
	.string	"SGX_ERROR_OUT_OF_MEMORY"
.LASF247:
	.string	"sgxsd_enclave_server_reply"
.LASF240:
	.string	"_mm_slli_si128"
.LASF183:
	.string	"chain_eq_mask"
.LASF145:
	.string	"pp_state"
.LASF91:
	.string	"SGX_ERROR_UNRECOGNIZED_PLATFORM"
.LASF125:
	.string	"sabd_lookup_hash_salt_t"
.LASF104:
	.string	"SGX_ERROR_FILE_RECOVERY_NEEDED"
.LASF43:
	.string	"in_jid_count"
.LASF10:
	.string	"__uint64_t"
.LASF154:
	.string	"hash_table_jid_count"
.LASF178:
	.string	"should_insert_jid"
.LASF11:
	.string	"long unsigned int"
.LASF136:
	.string	"state_size"
.LASF193:
	.string	"_mm256_add_epi64"
.LASF139:
	.string	"ab_jid_idx"
.LASF103:
	.string	"SGX_ERROR_FILE_CANT_WRITE_RECOVERY_FILE"
.LASF95:
	.string	"SGX_ERROR_PCL_MAC_MISMATCH"
.LASF202:
	.string	"__q27"
.LASF251:
	.string	"memalign"
.LASF109:
	.string	"sgxsd_aes_gcm_key"
.LASF124:
	.string	"sabd_lookup_hash_salt"
.LASF147:
	.string	"sgxsd_enclave_server_init"
.LASF151:
	.string	"hash_table_order"
.LASF27:
	.string	"__m128i"
.LASF181:
	.string	"in_jid_block"
.LASF126:
	.string	"sabd_msg"
.LASF83:
	.string	"SGX_ERROR_NETWORK_FAILURE"
.LASF60:
	.string	"SGX_ERROR_INVALID_SIGNATURE"
.LASF6:
	.string	"__uint32_t"
.LASF17:
	.string	"long long int"
.LASF61:
	.string	"SGX_ERROR_NDEBUG_ENCLAVE"
.LASF55:
	.string	"SGX_ERROR_OCALL_NOT_ALLOWED"
.LASF33:
	.string	"__m256d"
.LASF34:
	.string	"jid_t"
.LASF32:
	.string	"__m256i"
.LASF13:
	.string	"double"
.LASF234:
	.string	"_mm_aesenclast_si128"
.LASF105:
	.string	"SGX_ERROR_FILE_FLUSH_FAILED"
.LASF231:
	.string	"_mm256_testz_pd"
.LASF258:
	.string	"_mm256_setzero_si256"
.LASF14:
	.string	"float"
.LASF134:
	.string	"lookup_res"
.LASF39:
	.string	"ab_jid_count"
.LASF53:
	.string	"SGX_ERROR_ENCLAVE_CRASHED"
.LASF257:
	.string	"sabd_state_t"
.LASF7:
	.string	"unsigned int"
.LASF28:
	.string	"__v4df"
.LASF29:
	.string	"__v4di"
.LASF96:
	.string	"SGX_ERROR_PCL_SHA_MISMATCH"
.LASF30:
	.string	"__v4du"
.LASF186:
	.string	"chain_result"
.LASF65:
	.string	"SGX_ERROR_INVALID_METADATA"
.LASF157:
	.string	"in_hashed_ab_jids_result_bits_size"
.LASF230:
	.string	"_mm256_movemask_pd"
.LASF238:
	.string	"__mask"
.LASF80:
	.string	"SGX_ERROR_SERVICE_INVALID_PRIVILEGE"
.LASF165:
	.string	"hash_salt_rand_tries"
.LASF132:
	.string	"validate_args_res"
.LASF192:
	.string	"_mm256_cmpeq_epi64"
.LASF137:
	.string	"in_jids_size"
.LASF99:
	.string	"SGX_ERROR_FILE_NO_KEY_ID"
.LASF252:
	.string	"GNU C11 7.5.0 -m64 -march=skylake -g -ggdb -g -ggdb0 -g -O0 -O0 -O3 -std=c11 -fstack-protector -fvisibility=hidden -fpie -funroll-loops"
.LASF37:
	.string	"sgxsd_server_handle_call_args"
.LASF138:
	.string	"in_ab_jids_result"
.LASF174:
	.string	"ab_jid_hash_slot_idx"
.LASF173:
	.string	"ab_jid_block"
.LASF245:
	.string	"__bsrd"
.LASF94:
	.string	"SGX_ERROR_PCL_NOT_ENCRYPTED"
.LASF78:
	.string	"SGX_ERROR_SERVICE_TIMEOUT"
.LASF142:
	.string	"reply_res"
.LASF73:
	.string	"SGX_ERROR_INVALID_ATTRIBUTE"
.LASF130:
	.string	"p_args"
.LASF117:
	.string	"size"
.LASF57:
	.string	"SGX_ERROR_UNDEFINED_SYMBOL"
.LASF38:
	.string	"max_ab_jids"
.LASF49:
	.string	"SGX_ERROR_ENCLAVE_LOST"
.LASF63:
	.string	"SGX_ERROR_NO_DEVICE"
.LASF146:
	.string	"p_sabd_msg"
.LASF133:
	.string	"validated_in_jid_count"
.LASF161:
	.string	"hash_table_tries"
.LASF168:
	.string	"chain_block_masks"
.LASF12:
	.string	"__size_t"
.LASF25:
	.string	"long long unsigned int"
.LASF175:
	.string	"hash_slot_matches"
.LASF19:
	.string	"uint16_t"
.LASF107:
	.string	"SGX_INTERNAL_ERROR_ENCLAVE_CREATE_INTERRUPTED"
.LASF85:
	.string	"SGX_ERROR_BUSY"
.LASF122:
	.string	"msgs"
.LASF184:
	.string	"chain_result_bits"
.LASF189:
	.string	"expand_step128"
.LASF194:
	.string	"_mm256_set1_epi64x"
.LASF90:
	.string	"SGX_ERROR_KDF_MISMATCH"
.LASF188:
	.string	"sabd_lookup_hash_slot"
.LASF172:
	.string	"ab_jid"
.LASF244:
	.string	"_mm_cvtsi128_si32"
.LASF120:
	.string	"server_key"
.LASF195:
	.string	"_mm256_set1_epi8"
.LASF74:
	.string	"SGX_ERROR_INVALID_CPUSVN"
.LASF158:
	.string	"in_hashed_ab_jids_result_bits"
.LASF180:
	.string	"in_jid"
.LASF236:
	.string	"_mm_cvtsi64_si128"
.LASF51:
	.string	"SGX_ERROR_INVALID_FUNCTION"
.LASF170:
	.string	"dummy_block"
.LASF233:
	.string	"_mm_aeskeygenassist_si128"
.LASF112:
	.string	"p_tag"
.LASF2:
	.string	"short int"
.LASF22:
	.string	"uint64_t"
.LASF87:
	.string	"SGX_ERROR_MC_NO_ACCESS_RIGHT"
.LASF36:
	.string	"sgxsd_server_init_args"
.LASF81:
	.string	"SGX_ERROR_EPID_MEMBER_REVOKED"
.LASF190:
	.string	"_rdrand64_step"
.LASF123:
	.string	"hash_slot_idx_t"
.LASF108:
	.string	"sgx_status_t"
.LASF75:
	.string	"SGX_ERROR_INVALID_ISVSVN"
.LASF118:
	.string	"sgxsd_msg_buf_t"
.LASF153:
	.string	"hash_table_slot_count"
.LASF8:
	.string	"__int64_t"
.LASF58:
	.string	"SGX_ERROR_INVALID_ENCLAVE"
.LASF235:
	.string	"_mm_aesenc_si128"
.LASF259:
	.string	"memcpy"
.LASF119:
	.string	"sgxsd_msg_from"
.LASF246:
	.string	"sgx_is_outside_enclave"
.LASF72:
	.string	"SGX_ERROR_MAC_MISMATCH"
.LASF113:
	.string	"sgxsd_msg_tag"
.LASF156:
	.string	"hashed_ab_jids"
.LASF70:
	.string	"SGX_ERROR_INVALID_MISC"
.LASF20:
	.string	"uint32_t"
.LASF176:
	.string	"chain_eq"
.LASF59:
	.string	"SGX_ERROR_INVALID_ENCLAVE_ID"
.LASF47:
	.string	"SGX_ERROR_INVALID_PARAMETER"
.LASF249:
	.string	"free"
.LASF116:
	.string	"sgxsd_msg_buf"
.LASF243:
	.string	"__q0"
.LASF242:
	.string	"__q1"
.LASF5:
	.string	"short unsigned int"
.LASF152:
	.string	"reply_buf"
.LASF129:
	.string	"sabd_msg_t"
.LASF86:
	.string	"SGX_ERROR_MC_NOT_FOUND"
.LASF52:
	.string	"SGX_ERROR_OUT_OF_TCS"
.LASF71:
	.string	"SGX_ERROR_INVALID_LAUNCH_TOKEN"
.LASF148:
	.string	"sabd_lookup_hash"
.LASF21:
	.string	"int64_t"
.LASF31:
	.string	"__v32qi"
.LASF92:
	.string	"SGX_ERROR_NO_PRIVILEGE"
.LASF54:
	.string	"SGX_ERROR_ECALL_NOT_ALLOWED"
.LASF144:
	.string	"sgxsd_enclave_server_handle_call"
.LASF76:
	.string	"SGX_ERROR_INVALID_KEYNAME"
.LASF187:
	.string	"hash"
.LASF110:
	.string	"data"
.LASF35:
	.string	"sabd_start_args_t"
.LASF128:
	.string	"prev"
.LASF56:
	.string	"SGX_ERROR_STACK_OVERRUN"
.LASF44:
	.string	"sabd_stop_args_t"
.LASF164:
	.string	"any_hash_slots_overflowed"
.LASF140:
	.string	"p_msg"
.LASF131:
	.string	"p_state"
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
