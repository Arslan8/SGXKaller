#ifndef SABD_ENCLAVE_U_H__
#define SABD_ENCLAVE_U_H__

#include <stdint.h>
#include <wchar.h>
#include <stddef.h>
#include <string.h>
#include "sgx_edger8r.h" /* for sgx_satus_t etc. */

#include "sabd.h"
#include "stdbool.h"
#include "sgx_quote.h"
#include "sgx_report.h"
#include "sgxsd.h"

#include <stdlib.h> /* for size_t */

#define SGX_CAST(type, item) ((type)(item))

#ifdef __cplusplus
extern "C" {
#endif

sgx_status_t SGX_UBRIDGE(SGX_NOCONVENTION, sgxsd_ocall_reply, (const sgxsd_msg_header_t* reply_header, const uint8_t* reply_data, size_t reply_data_size, sgxsd_msg_tag_t msg_tag));
char* SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_getenv, (const char* name));
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_open, (const char* pathname, int flags));
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_close, (int fd));
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_pthread_attr_init, (pthread_attr_t* attr));
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_pthread_attr_destroy, (pthread_attr_t* attr));
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_isatty, (int fd));
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_pipe, (int pipefd[2]));
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_usleep, (unsigned long long usec));
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_sleep, (unsigned int seconds));
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_execv, (const char* pathname, int argv_num, char* argv1, char* argv2, char* argv3));
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_pthread_attr_setstacksize, (pthread_attr_t* attr, size_t stacksize));
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_pthread_attr_getstacksize, (pthread_attr_t* attr, size_t* stacksize));
unsigned long long SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_getuid, ());
long int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_sysconf, (int name));
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_shm_open, (const char* name, int oflag, unsigned long long mode));
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_shm_unlink, (const char* name));
void SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_syslog_chk, (int priority, int flag, const char* format));
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_snprintf_chk, (char* str, size_t maxlen, int flag, size_t stlen, const char* format));
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_getrusage, (int who, struct rusage* usage));
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_sched_yield, ());
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_pthread_getattr_np, (pthread_t thread, pthread_attr_t* attr));
void* SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_pthread_getspecific, (pthread_key_t key));
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_pthread_setspecific, (pthread_key_t key, const void* value));
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_pthread_key_create, (pthread_key_t* key, int nodestructor));
size_t SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_libsfuzz_ocall_readlink, (const char* pathname, char* buf, size_t bufsiz));
pthread_t SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_pthread_self, ());
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_fxstat, (int vers, int fd, struct stat* buf));
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_sigaltstack, (unsigned long long ss, unsigned long long old_ss));
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_getrlimit, (int resource, struct rlimit* rlim));
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_setrlimit, (int resource, const struct rlimit* rlim));
void* SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_dlsym, (unsigned long long handle, const char* symbol));
int SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_waitpid, (int pid, int* stat_loc, int options));
size_t SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_write, (int fd, const void* buf, size_t count));
size_t SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_read, (int fd, void* buf, size_t count));
void SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_exit, (int stat));
void* SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_calloc, (size_t items, size_t size));
void SGX_UBRIDGE(SGX_NOCONVENTION, libsfuzz_ocall_abort, ());

sgx_status_t sgxsd_enclave_node_init(sgx_enclave_id_t eid, sgx_status_t* retval, const sgxsd_node_init_args_t* p_args);
sgx_status_t sgxsd_enclave_get_next_report(sgx_enclave_id_t eid, sgx_status_t* retval, sgx_target_info_t qe_target_info, sgx_report_t* p_report);
sgx_status_t sgxsd_enclave_set_current_quote(sgx_enclave_id_t eid, sgx_status_t* retval);
sgx_status_t sgxsd_enclave_negotiate_request(sgx_enclave_id_t eid, sgx_status_t* retval, const sgxsd_request_negotiation_request_t* p_request, sgxsd_request_negotiation_response_t* p_response);
sgx_status_t sgxsd_enclave_server_start(sgx_enclave_id_t eid, sgx_status_t* retval, const sgxsd_server_init_args_t* p_args, sgxsd_server_state_handle_t state_handle);
sgx_status_t sgxsd_enclave_server_call(sgx_enclave_id_t eid, sgx_status_t* retval, const sgxsd_server_handle_call_args_t* p_args, const sgxsd_msg_header_t* msg_header, uint8_t* msg_data, size_t msg_size, sgxsd_msg_tag_t msg_tag, sgxsd_server_state_handle_t state_handle);
sgx_status_t sgxsd_enclave_server_stop(sgx_enclave_id_t eid, sgx_status_t* retval, const sgxsd_server_terminate_args_t* p_args, sgxsd_server_state_handle_t state_handle);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif
