#include "sabd_enclave_u.h"
#include <errno.h>

typedef struct ms_sgxsd_enclave_node_init_t {
	sgx_status_t ms_retval;
	const sgxsd_node_init_args_t* ms_p_args;
} ms_sgxsd_enclave_node_init_t;

typedef struct ms_sgxsd_enclave_get_next_report_t {
	sgx_status_t ms_retval;
	sgx_target_info_t ms_qe_target_info;
	sgx_report_t* ms_p_report;
} ms_sgxsd_enclave_get_next_report_t;

typedef struct ms_sgxsd_enclave_set_current_quote_t {
	sgx_status_t ms_retval;
} ms_sgxsd_enclave_set_current_quote_t;

typedef struct ms_sgxsd_enclave_negotiate_request_t {
	sgx_status_t ms_retval;
	const sgxsd_request_negotiation_request_t* ms_p_request;
	sgxsd_request_negotiation_response_t* ms_p_response;
} ms_sgxsd_enclave_negotiate_request_t;

typedef struct ms_sgxsd_enclave_server_start_t {
	sgx_status_t ms_retval;
	const sgxsd_server_init_args_t* ms_p_args;
	sgxsd_server_state_handle_t ms_state_handle;
} ms_sgxsd_enclave_server_start_t;

typedef struct ms_sgxsd_enclave_server_call_t {
	sgx_status_t ms_retval;
	const sgxsd_server_handle_call_args_t* ms_p_args;
	const sgxsd_msg_header_t* ms_msg_header;
	uint8_t* ms_msg_data;
	size_t ms_msg_size;
	sgxsd_msg_tag_t ms_msg_tag;
	sgxsd_server_state_handle_t ms_state_handle;
} ms_sgxsd_enclave_server_call_t;

typedef struct ms_sgxsd_enclave_server_stop_t {
	sgx_status_t ms_retval;
	const sgxsd_server_terminate_args_t* ms_p_args;
	sgxsd_server_state_handle_t ms_state_handle;
} ms_sgxsd_enclave_server_stop_t;

typedef struct ms_sgxsd_ocall_reply_t {
	sgx_status_t ms_retval;
	const sgxsd_msg_header_t* ms_reply_header;
	const uint8_t* ms_reply_data;
	size_t ms_reply_data_size;
	sgxsd_msg_tag_t ms_msg_tag;
} ms_sgxsd_ocall_reply_t;

typedef struct ms_libsfuzz_ocall_getenv_t {
	char* ms_retval;
	const char* ms_name;
} ms_libsfuzz_ocall_getenv_t;

typedef struct ms_libsfuzz_ocall_open_t {
	int ms_retval;
	const char* ms_pathname;
	int ms_flags;
} ms_libsfuzz_ocall_open_t;

typedef struct ms_libsfuzz_ocall_close_t {
	int ms_retval;
	int ms_fd;
} ms_libsfuzz_ocall_close_t;

typedef struct ms_libsfuzz_ocall_pthread_attr_init_t {
	int ms_retval;
	pthread_attr_t* ms_attr;
} ms_libsfuzz_ocall_pthread_attr_init_t;

typedef struct ms_libsfuzz_ocall_pthread_attr_destroy_t {
	int ms_retval;
	pthread_attr_t* ms_attr;
} ms_libsfuzz_ocall_pthread_attr_destroy_t;

typedef struct ms_libsfuzz_ocall_isatty_t {
	int ms_retval;
	int ms_fd;
} ms_libsfuzz_ocall_isatty_t;

typedef struct ms_libsfuzz_ocall_pipe_t {
	int ms_retval;
	int* ms_pipefd;
} ms_libsfuzz_ocall_pipe_t;

typedef struct ms_libsfuzz_ocall_usleep_t {
	int ms_retval;
	unsigned long long ms_usec;
} ms_libsfuzz_ocall_usleep_t;

typedef struct ms_libsfuzz_ocall_sleep_t {
	int ms_retval;
	unsigned int ms_seconds;
} ms_libsfuzz_ocall_sleep_t;

typedef struct ms_libsfuzz_ocall_execv_t {
	int ms_retval;
	const char* ms_pathname;
	int ms_argv_num;
	char* ms_argv1;
	char* ms_argv2;
	char* ms_argv3;
} ms_libsfuzz_ocall_execv_t;

typedef struct ms_libsfuzz_ocall_pthread_attr_setstacksize_t {
	int ms_retval;
	pthread_attr_t* ms_attr;
	size_t ms_stacksize;
} ms_libsfuzz_ocall_pthread_attr_setstacksize_t;

typedef struct ms_libsfuzz_ocall_pthread_attr_getstacksize_t {
	int ms_retval;
	pthread_attr_t* ms_attr;
	size_t* ms_stacksize;
} ms_libsfuzz_ocall_pthread_attr_getstacksize_t;

typedef struct ms_libsfuzz_ocall_getuid_t {
	unsigned long long ms_retval;
} ms_libsfuzz_ocall_getuid_t;

typedef struct ms_libsfuzz_ocall_sysconf_t {
	long int ms_retval;
	int ms_name;
} ms_libsfuzz_ocall_sysconf_t;

typedef struct ms_libsfuzz_ocall_shm_open_t {
	int ms_retval;
	const char* ms_name;
	int ms_oflag;
	unsigned long long ms_mode;
} ms_libsfuzz_ocall_shm_open_t;

typedef struct ms_libsfuzz_ocall_shm_unlink_t {
	int ms_retval;
	const char* ms_name;
} ms_libsfuzz_ocall_shm_unlink_t;

typedef struct ms_libsfuzz_ocall_syslog_chk_t {
	int ms_priority;
	int ms_flag;
	const char* ms_format;
} ms_libsfuzz_ocall_syslog_chk_t;

typedef struct ms_libsfuzz_ocall_snprintf_chk_t {
	int ms_retval;
	char* ms_str;
	size_t ms_maxlen;
	int ms_flag;
	size_t ms_stlen;
	const char* ms_format;
} ms_libsfuzz_ocall_snprintf_chk_t;

typedef struct ms_libsfuzz_ocall_getrusage_t {
	int ms_retval;
	int ms_who;
	struct rusage* ms_usage;
} ms_libsfuzz_ocall_getrusage_t;

typedef struct ms_libsfuzz_ocall_sched_yield_t {
	int ms_retval;
} ms_libsfuzz_ocall_sched_yield_t;

typedef struct ms_libsfuzz_ocall_pthread_getattr_np_t {
	int ms_retval;
	pthread_t ms_thread;
	pthread_attr_t* ms_attr;
} ms_libsfuzz_ocall_pthread_getattr_np_t;

typedef struct ms_libsfuzz_ocall_pthread_getspecific_t {
	void* ms_retval;
	pthread_key_t ms_key;
} ms_libsfuzz_ocall_pthread_getspecific_t;

typedef struct ms_libsfuzz_ocall_pthread_setspecific_t {
	int ms_retval;
	pthread_key_t ms_key;
	const void* ms_value;
} ms_libsfuzz_ocall_pthread_setspecific_t;

typedef struct ms_libsfuzz_ocall_pthread_key_create_t {
	int ms_retval;
	pthread_key_t* ms_key;
	int ms_nodestructor;
} ms_libsfuzz_ocall_pthread_key_create_t;

typedef struct ms_libsfuzz_libsfuzz_ocall_readlink_t {
	size_t ms_retval;
	const char* ms_pathname;
	char* ms_buf;
	size_t ms_bufsiz;
} ms_libsfuzz_libsfuzz_ocall_readlink_t;

typedef struct ms_libsfuzz_ocall_pthread_self_t {
	pthread_t ms_retval;
} ms_libsfuzz_ocall_pthread_self_t;

typedef struct ms_libsfuzz_ocall_fxstat_t {
	int ms_retval;
	int ms_vers;
	int ms_fd;
	struct stat* ms_buf;
} ms_libsfuzz_ocall_fxstat_t;

typedef struct ms_libsfuzz_ocall_sigaltstack_t {
	int ms_retval;
	unsigned long long ms_ss;
	unsigned long long ms_old_ss;
} ms_libsfuzz_ocall_sigaltstack_t;

typedef struct ms_libsfuzz_ocall_getrlimit_t {
	int ms_retval;
	int ms_resource;
	struct rlimit* ms_rlim;
} ms_libsfuzz_ocall_getrlimit_t;

typedef struct ms_libsfuzz_ocall_setrlimit_t {
	int ms_retval;
	int ms_resource;
	const struct rlimit* ms_rlim;
} ms_libsfuzz_ocall_setrlimit_t;

typedef struct ms_libsfuzz_ocall_dlsym_t {
	void* ms_retval;
	unsigned long long ms_handle;
	const char* ms_symbol;
} ms_libsfuzz_ocall_dlsym_t;

typedef struct ms_libsfuzz_ocall_waitpid_t {
	int ms_retval;
	int ms_pid;
	int* ms_stat_loc;
	int ms_options;
} ms_libsfuzz_ocall_waitpid_t;

typedef struct ms_libsfuzz_ocall_write_t {
	size_t ms_retval;
	int ms_fd;
	const void* ms_buf;
	size_t ms_count;
} ms_libsfuzz_ocall_write_t;

typedef struct ms_libsfuzz_ocall_read_t {
	size_t ms_retval;
	int ms_fd;
	void* ms_buf;
	size_t ms_count;
} ms_libsfuzz_ocall_read_t;

typedef struct ms_libsfuzz_ocall_exit_t {
	int ms_stat;
} ms_libsfuzz_ocall_exit_t;

typedef struct ms_libsfuzz_ocall_calloc_t {
	void* ms_retval;
	size_t ms_items;
	size_t ms_size;
} ms_libsfuzz_ocall_calloc_t;

static sgx_status_t SGX_CDECL sabd_enclave_sgxsd_ocall_reply(void* pms)
{
	ms_sgxsd_ocall_reply_t* ms = SGX_CAST(ms_sgxsd_ocall_reply_t*, pms);
	ms->ms_retval = sgxsd_ocall_reply(ms->ms_reply_header, ms->ms_reply_data, ms->ms_reply_data_size, ms->ms_msg_tag);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_getenv(void* pms)
{
	ms_libsfuzz_ocall_getenv_t* ms = SGX_CAST(ms_libsfuzz_ocall_getenv_t*, pms);
	ms->ms_retval = libsfuzz_ocall_getenv(ms->ms_name);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_open(void* pms)
{
	ms_libsfuzz_ocall_open_t* ms = SGX_CAST(ms_libsfuzz_ocall_open_t*, pms);
	ms->ms_retval = libsfuzz_ocall_open(ms->ms_pathname, ms->ms_flags);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_close(void* pms)
{
	ms_libsfuzz_ocall_close_t* ms = SGX_CAST(ms_libsfuzz_ocall_close_t*, pms);
	ms->ms_retval = libsfuzz_ocall_close(ms->ms_fd);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_pthread_attr_init(void* pms)
{
	ms_libsfuzz_ocall_pthread_attr_init_t* ms = SGX_CAST(ms_libsfuzz_ocall_pthread_attr_init_t*, pms);
	ms->ms_retval = libsfuzz_ocall_pthread_attr_init(ms->ms_attr);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_pthread_attr_destroy(void* pms)
{
	ms_libsfuzz_ocall_pthread_attr_destroy_t* ms = SGX_CAST(ms_libsfuzz_ocall_pthread_attr_destroy_t*, pms);
	ms->ms_retval = libsfuzz_ocall_pthread_attr_destroy(ms->ms_attr);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_isatty(void* pms)
{
	ms_libsfuzz_ocall_isatty_t* ms = SGX_CAST(ms_libsfuzz_ocall_isatty_t*, pms);
	ms->ms_retval = libsfuzz_ocall_isatty(ms->ms_fd);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_pipe(void* pms)
{
	ms_libsfuzz_ocall_pipe_t* ms = SGX_CAST(ms_libsfuzz_ocall_pipe_t*, pms);
	ms->ms_retval = libsfuzz_ocall_pipe(ms->ms_pipefd);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_usleep(void* pms)
{
	ms_libsfuzz_ocall_usleep_t* ms = SGX_CAST(ms_libsfuzz_ocall_usleep_t*, pms);
	ms->ms_retval = libsfuzz_ocall_usleep(ms->ms_usec);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_sleep(void* pms)
{
	ms_libsfuzz_ocall_sleep_t* ms = SGX_CAST(ms_libsfuzz_ocall_sleep_t*, pms);
	ms->ms_retval = libsfuzz_ocall_sleep(ms->ms_seconds);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_execv(void* pms)
{
	ms_libsfuzz_ocall_execv_t* ms = SGX_CAST(ms_libsfuzz_ocall_execv_t*, pms);
	ms->ms_retval = libsfuzz_ocall_execv(ms->ms_pathname, ms->ms_argv_num, ms->ms_argv1, ms->ms_argv2, ms->ms_argv3);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_pthread_attr_setstacksize(void* pms)
{
	ms_libsfuzz_ocall_pthread_attr_setstacksize_t* ms = SGX_CAST(ms_libsfuzz_ocall_pthread_attr_setstacksize_t*, pms);
	ms->ms_retval = libsfuzz_ocall_pthread_attr_setstacksize(ms->ms_attr, ms->ms_stacksize);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_pthread_attr_getstacksize(void* pms)
{
	ms_libsfuzz_ocall_pthread_attr_getstacksize_t* ms = SGX_CAST(ms_libsfuzz_ocall_pthread_attr_getstacksize_t*, pms);
	ms->ms_retval = libsfuzz_ocall_pthread_attr_getstacksize(ms->ms_attr, ms->ms_stacksize);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_getuid(void* pms)
{
	ms_libsfuzz_ocall_getuid_t* ms = SGX_CAST(ms_libsfuzz_ocall_getuid_t*, pms);
	ms->ms_retval = libsfuzz_ocall_getuid();

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_sysconf(void* pms)
{
	ms_libsfuzz_ocall_sysconf_t* ms = SGX_CAST(ms_libsfuzz_ocall_sysconf_t*, pms);
	ms->ms_retval = libsfuzz_ocall_sysconf(ms->ms_name);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_shm_open(void* pms)
{
	ms_libsfuzz_ocall_shm_open_t* ms = SGX_CAST(ms_libsfuzz_ocall_shm_open_t*, pms);
	ms->ms_retval = libsfuzz_ocall_shm_open(ms->ms_name, ms->ms_oflag, ms->ms_mode);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_shm_unlink(void* pms)
{
	ms_libsfuzz_ocall_shm_unlink_t* ms = SGX_CAST(ms_libsfuzz_ocall_shm_unlink_t*, pms);
	ms->ms_retval = libsfuzz_ocall_shm_unlink(ms->ms_name);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_syslog_chk(void* pms)
{
	ms_libsfuzz_ocall_syslog_chk_t* ms = SGX_CAST(ms_libsfuzz_ocall_syslog_chk_t*, pms);
	libsfuzz_ocall_syslog_chk(ms->ms_priority, ms->ms_flag, ms->ms_format);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_snprintf_chk(void* pms)
{
	ms_libsfuzz_ocall_snprintf_chk_t* ms = SGX_CAST(ms_libsfuzz_ocall_snprintf_chk_t*, pms);
	ms->ms_retval = libsfuzz_ocall_snprintf_chk(ms->ms_str, ms->ms_maxlen, ms->ms_flag, ms->ms_stlen, ms->ms_format);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_getrusage(void* pms)
{
	ms_libsfuzz_ocall_getrusage_t* ms = SGX_CAST(ms_libsfuzz_ocall_getrusage_t*, pms);
	ms->ms_retval = libsfuzz_ocall_getrusage(ms->ms_who, ms->ms_usage);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_sched_yield(void* pms)
{
	ms_libsfuzz_ocall_sched_yield_t* ms = SGX_CAST(ms_libsfuzz_ocall_sched_yield_t*, pms);
	ms->ms_retval = libsfuzz_ocall_sched_yield();

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_pthread_getattr_np(void* pms)
{
	ms_libsfuzz_ocall_pthread_getattr_np_t* ms = SGX_CAST(ms_libsfuzz_ocall_pthread_getattr_np_t*, pms);
	ms->ms_retval = libsfuzz_ocall_pthread_getattr_np(ms->ms_thread, ms->ms_attr);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_pthread_getspecific(void* pms)
{
	ms_libsfuzz_ocall_pthread_getspecific_t* ms = SGX_CAST(ms_libsfuzz_ocall_pthread_getspecific_t*, pms);
	ms->ms_retval = libsfuzz_ocall_pthread_getspecific(ms->ms_key);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_pthread_setspecific(void* pms)
{
	ms_libsfuzz_ocall_pthread_setspecific_t* ms = SGX_CAST(ms_libsfuzz_ocall_pthread_setspecific_t*, pms);
	ms->ms_retval = libsfuzz_ocall_pthread_setspecific(ms->ms_key, ms->ms_value);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_pthread_key_create(void* pms)
{
	ms_libsfuzz_ocall_pthread_key_create_t* ms = SGX_CAST(ms_libsfuzz_ocall_pthread_key_create_t*, pms);
	ms->ms_retval = libsfuzz_ocall_pthread_key_create(ms->ms_key, ms->ms_nodestructor);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_libsfuzz_ocall_readlink(void* pms)
{
	ms_libsfuzz_libsfuzz_ocall_readlink_t* ms = SGX_CAST(ms_libsfuzz_libsfuzz_ocall_readlink_t*, pms);
	ms->ms_retval = libsfuzz_libsfuzz_ocall_readlink(ms->ms_pathname, ms->ms_buf, ms->ms_bufsiz);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_pthread_self(void* pms)
{
	ms_libsfuzz_ocall_pthread_self_t* ms = SGX_CAST(ms_libsfuzz_ocall_pthread_self_t*, pms);
	ms->ms_retval = libsfuzz_ocall_pthread_self();

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_fxstat(void* pms)
{
	ms_libsfuzz_ocall_fxstat_t* ms = SGX_CAST(ms_libsfuzz_ocall_fxstat_t*, pms);
	ms->ms_retval = libsfuzz_ocall_fxstat(ms->ms_vers, ms->ms_fd, ms->ms_buf);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_sigaltstack(void* pms)
{
	ms_libsfuzz_ocall_sigaltstack_t* ms = SGX_CAST(ms_libsfuzz_ocall_sigaltstack_t*, pms);
	ms->ms_retval = libsfuzz_ocall_sigaltstack(ms->ms_ss, ms->ms_old_ss);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_getrlimit(void* pms)
{
	ms_libsfuzz_ocall_getrlimit_t* ms = SGX_CAST(ms_libsfuzz_ocall_getrlimit_t*, pms);
	ms->ms_retval = libsfuzz_ocall_getrlimit(ms->ms_resource, ms->ms_rlim);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_setrlimit(void* pms)
{
	ms_libsfuzz_ocall_setrlimit_t* ms = SGX_CAST(ms_libsfuzz_ocall_setrlimit_t*, pms);
	ms->ms_retval = libsfuzz_ocall_setrlimit(ms->ms_resource, ms->ms_rlim);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_dlsym(void* pms)
{
	ms_libsfuzz_ocall_dlsym_t* ms = SGX_CAST(ms_libsfuzz_ocall_dlsym_t*, pms);
	ms->ms_retval = libsfuzz_ocall_dlsym(ms->ms_handle, ms->ms_symbol);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_waitpid(void* pms)
{
	ms_libsfuzz_ocall_waitpid_t* ms = SGX_CAST(ms_libsfuzz_ocall_waitpid_t*, pms);
	ms->ms_retval = libsfuzz_ocall_waitpid(ms->ms_pid, ms->ms_stat_loc, ms->ms_options);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_write(void* pms)
{
	ms_libsfuzz_ocall_write_t* ms = SGX_CAST(ms_libsfuzz_ocall_write_t*, pms);
	ms->ms_retval = libsfuzz_ocall_write(ms->ms_fd, ms->ms_buf, ms->ms_count);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_read(void* pms)
{
	ms_libsfuzz_ocall_read_t* ms = SGX_CAST(ms_libsfuzz_ocall_read_t*, pms);
	ms->ms_retval = libsfuzz_ocall_read(ms->ms_fd, ms->ms_buf, ms->ms_count);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_exit(void* pms)
{
	ms_libsfuzz_ocall_exit_t* ms = SGX_CAST(ms_libsfuzz_ocall_exit_t*, pms);
	libsfuzz_ocall_exit(ms->ms_stat);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_calloc(void* pms)
{
	ms_libsfuzz_ocall_calloc_t* ms = SGX_CAST(ms_libsfuzz_ocall_calloc_t*, pms);
	ms->ms_retval = libsfuzz_ocall_calloc(ms->ms_items, ms->ms_size);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL sabd_enclave_libsfuzz_ocall_abort(void* pms)
{
	if (pms != NULL) return SGX_ERROR_INVALID_PARAMETER;
	libsfuzz_ocall_abort();
	return SGX_SUCCESS;
}

static const struct {
	size_t nr_ocall;
	void * table[38];
} ocall_table_sabd_enclave = {
	38,
	{
		(void*)sabd_enclave_sgxsd_ocall_reply,
		(void*)sabd_enclave_libsfuzz_ocall_getenv,
		(void*)sabd_enclave_libsfuzz_ocall_open,
		(void*)sabd_enclave_libsfuzz_ocall_close,
		(void*)sabd_enclave_libsfuzz_ocall_pthread_attr_init,
		(void*)sabd_enclave_libsfuzz_ocall_pthread_attr_destroy,
		(void*)sabd_enclave_libsfuzz_ocall_isatty,
		(void*)sabd_enclave_libsfuzz_ocall_pipe,
		(void*)sabd_enclave_libsfuzz_ocall_usleep,
		(void*)sabd_enclave_libsfuzz_ocall_sleep,
		(void*)sabd_enclave_libsfuzz_ocall_execv,
		(void*)sabd_enclave_libsfuzz_ocall_pthread_attr_setstacksize,
		(void*)sabd_enclave_libsfuzz_ocall_pthread_attr_getstacksize,
		(void*)sabd_enclave_libsfuzz_ocall_getuid,
		(void*)sabd_enclave_libsfuzz_ocall_sysconf,
		(void*)sabd_enclave_libsfuzz_ocall_shm_open,
		(void*)sabd_enclave_libsfuzz_ocall_shm_unlink,
		(void*)sabd_enclave_libsfuzz_ocall_syslog_chk,
		(void*)sabd_enclave_libsfuzz_ocall_snprintf_chk,
		(void*)sabd_enclave_libsfuzz_ocall_getrusage,
		(void*)sabd_enclave_libsfuzz_ocall_sched_yield,
		(void*)sabd_enclave_libsfuzz_ocall_pthread_getattr_np,
		(void*)sabd_enclave_libsfuzz_ocall_pthread_getspecific,
		(void*)sabd_enclave_libsfuzz_ocall_pthread_setspecific,
		(void*)sabd_enclave_libsfuzz_ocall_pthread_key_create,
		(void*)sabd_enclave_libsfuzz_libsfuzz_ocall_readlink,
		(void*)sabd_enclave_libsfuzz_ocall_pthread_self,
		(void*)sabd_enclave_libsfuzz_ocall_fxstat,
		(void*)sabd_enclave_libsfuzz_ocall_sigaltstack,
		(void*)sabd_enclave_libsfuzz_ocall_getrlimit,
		(void*)sabd_enclave_libsfuzz_ocall_setrlimit,
		(void*)sabd_enclave_libsfuzz_ocall_dlsym,
		(void*)sabd_enclave_libsfuzz_ocall_waitpid,
		(void*)sabd_enclave_libsfuzz_ocall_write,
		(void*)sabd_enclave_libsfuzz_ocall_read,
		(void*)sabd_enclave_libsfuzz_ocall_exit,
		(void*)sabd_enclave_libsfuzz_ocall_calloc,
		(void*)sabd_enclave_libsfuzz_ocall_abort,
	}
};
sgx_status_t sgxsd_enclave_node_init(sgx_enclave_id_t eid, sgx_status_t* retval, const sgxsd_node_init_args_t* p_args)
{
	sgx_status_t status;
	ms_sgxsd_enclave_node_init_t ms;
	ms.ms_p_args = p_args;
	status = sgx_ecall(eid, 0, &ocall_table_sabd_enclave, &ms);
	if (status == SGX_SUCCESS && retval) *retval = ms.ms_retval;
	return status;
}

sgx_status_t sgxsd_enclave_get_next_report(sgx_enclave_id_t eid, sgx_status_t* retval, sgx_target_info_t qe_target_info, sgx_report_t* p_report)
{
	sgx_status_t status;
	ms_sgxsd_enclave_get_next_report_t ms;
	ms.ms_qe_target_info = qe_target_info;
	ms.ms_p_report = p_report;
	status = sgx_ecall(eid, 1, &ocall_table_sabd_enclave, &ms);
	if (status == SGX_SUCCESS && retval) *retval = ms.ms_retval;
	return status;
}

sgx_status_t sgxsd_enclave_set_current_quote(sgx_enclave_id_t eid, sgx_status_t* retval)
{
	sgx_status_t status;
	ms_sgxsd_enclave_set_current_quote_t ms;
	status = sgx_ecall(eid, 2, &ocall_table_sabd_enclave, &ms);
	if (status == SGX_SUCCESS && retval) *retval = ms.ms_retval;
	return status;
}

sgx_status_t sgxsd_enclave_negotiate_request(sgx_enclave_id_t eid, sgx_status_t* retval, const sgxsd_request_negotiation_request_t* p_request, sgxsd_request_negotiation_response_t* p_response)
{
	sgx_status_t status;
	ms_sgxsd_enclave_negotiate_request_t ms;
	ms.ms_p_request = p_request;
	ms.ms_p_response = p_response;
	status = sgx_ecall(eid, 3, &ocall_table_sabd_enclave, &ms);
	if (status == SGX_SUCCESS && retval) *retval = ms.ms_retval;
	return status;
}

sgx_status_t sgxsd_enclave_server_start(sgx_enclave_id_t eid, sgx_status_t* retval, const sgxsd_server_init_args_t* p_args, sgxsd_server_state_handle_t state_handle)
{
	sgx_status_t status;
	ms_sgxsd_enclave_server_start_t ms;
	ms.ms_p_args = p_args;
	ms.ms_state_handle = state_handle;
	status = sgx_ecall(eid, 4, &ocall_table_sabd_enclave, &ms);
	if (status == SGX_SUCCESS && retval) *retval = ms.ms_retval;
	return status;
}

sgx_status_t sgxsd_enclave_server_call(sgx_enclave_id_t eid, sgx_status_t* retval, const sgxsd_server_handle_call_args_t* p_args, const sgxsd_msg_header_t* msg_header, uint8_t* msg_data, size_t msg_size, sgxsd_msg_tag_t msg_tag, sgxsd_server_state_handle_t state_handle)
{
	sgx_status_t status;
	ms_sgxsd_enclave_server_call_t ms;
	ms.ms_p_args = p_args;
	ms.ms_msg_header = msg_header;
	ms.ms_msg_data = msg_data;
	ms.ms_msg_size = msg_size;
	ms.ms_msg_tag = msg_tag;
	ms.ms_state_handle = state_handle;
	status = sgx_ecall(eid, 5, &ocall_table_sabd_enclave, &ms);
	if (status == SGX_SUCCESS && retval) *retval = ms.ms_retval;
	return status;
}

sgx_status_t sgxsd_enclave_server_stop(sgx_enclave_id_t eid, sgx_status_t* retval, const sgxsd_server_terminate_args_t* p_args, sgxsd_server_state_handle_t state_handle)
{
	sgx_status_t status;
	ms_sgxsd_enclave_server_stop_t ms;
	ms.ms_p_args = p_args;
	ms.ms_state_handle = state_handle;
	status = sgx_ecall(eid, 6, &ocall_table_sabd_enclave, &ms);
	if (status == SGX_SUCCESS && retval) *retval = ms.ms_retval;
	return status;
}

