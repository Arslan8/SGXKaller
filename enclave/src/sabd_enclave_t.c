#include "sabd_enclave_t.h"

#include "sgx_trts.h" /* for sgx_ocalloc, sgx_is_outside_enclave */
#include "sgx_lfence.h" /* for sgx_lfence */

#include <errno.h>
#include <string.h> /* for memcpy etc */
#include <stdlib.h> /* for malloc/free etc */

#define CHECK_REF_POINTER(ptr, siz) do {	\
	if (!(ptr) || ! sgx_is_outside_enclave((ptr), (siz)))	\
		return SGX_ERROR_INVALID_PARAMETER;\
} while (0)

#define CHECK_UNIQUE_POINTER(ptr, siz) do {	\
	if ((ptr) && ! sgx_is_outside_enclave((ptr), (siz)))	\
		return SGX_ERROR_INVALID_PARAMETER;\
} while (0)


typedef struct ms_sgxsd_enclave_node_init_t {
	sgx_status_t ms_retval;
	sgxsd_node_init_args_t* ms_p_args;
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
	sgxsd_request_negotiation_request_t* ms_p_request;
	sgxsd_request_negotiation_response_t* ms_p_response;
} ms_sgxsd_enclave_negotiate_request_t;

typedef struct ms_sgxsd_enclave_server_start_t {
	sgx_status_t ms_retval;
	sgxsd_server_init_args_t* ms_p_args;
	sgxsd_server_state_handle_t ms_state_handle;
} ms_sgxsd_enclave_server_start_t;

typedef struct ms_sgxsd_enclave_server_call_t {
	sgx_status_t ms_retval;
	sgxsd_server_handle_call_args_t* ms_p_args;
	sgxsd_msg_header_t* ms_msg_header;
	uint8_t* ms_msg_data;
	size_t ms_msg_size;
	sgxsd_msg_tag_t ms_msg_tag;
	sgxsd_server_state_handle_t ms_state_handle;
} ms_sgxsd_enclave_server_call_t;

typedef struct ms_sgxsd_enclave_server_stop_t {
	sgx_status_t ms_retval;
	sgxsd_server_terminate_args_t* ms_p_args;
	sgxsd_server_state_handle_t ms_state_handle;
} ms_sgxsd_enclave_server_stop_t;

typedef struct ms_sgxsd_ocall_reply_t {
	sgx_status_t ms_retval;
	sgxsd_msg_header_t* ms_reply_header;
	uint8_t* ms_reply_data;
	size_t ms_reply_data_size;
	sgxsd_msg_tag_t ms_msg_tag;
} ms_sgxsd_ocall_reply_t;

typedef struct ms_libsfuzz_ocall_getenv_t {
	char* ms_retval;
	char* ms_name;
} ms_libsfuzz_ocall_getenv_t;

typedef struct ms_libsfuzz_ocall_open_t {
	int ms_retval;
	char* ms_pathname;
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
	char* ms_pathname;
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
	char* ms_name;
	int ms_oflag;
	unsigned long long ms_mode;
} ms_libsfuzz_ocall_shm_open_t;

typedef struct ms_libsfuzz_ocall_shm_unlink_t {
	int ms_retval;
	char* ms_name;
} ms_libsfuzz_ocall_shm_unlink_t;

typedef struct ms_libsfuzz_ocall_syslog_chk_t {
	int ms_priority;
	int ms_flag;
	char* ms_format;
} ms_libsfuzz_ocall_syslog_chk_t;

typedef struct ms_libsfuzz_ocall_snprintf_chk_t {
	int ms_retval;
	char* ms_str;
	size_t ms_maxlen;
	int ms_flag;
	size_t ms_stlen;
	char* ms_format;
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
	void* ms_value;
} ms_libsfuzz_ocall_pthread_setspecific_t;

typedef struct ms_libsfuzz_ocall_pthread_key_create_t {
	int ms_retval;
	pthread_key_t* ms_key;
	int ms_nodestructor;
} ms_libsfuzz_ocall_pthread_key_create_t;

typedef struct ms_libsfuzz_libsfuzz_ocall_readlink_t {
	size_t ms_retval;
	char* ms_pathname;
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
	struct rlimit* ms_rlim;
} ms_libsfuzz_ocall_setrlimit_t;

typedef struct ms_libsfuzz_ocall_dlsym_t {
	void* ms_retval;
	unsigned long long ms_handle;
	char* ms_symbol;
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
	void* ms_buf;
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

static sgx_status_t SGX_CDECL sgx_sgxsd_enclave_node_init(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_sgxsd_enclave_node_init_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_sgxsd_enclave_node_init_t* ms = SGX_CAST(ms_sgxsd_enclave_node_init_t*, pms);
	sgx_status_t status = SGX_SUCCESS;
	sgxsd_node_init_args_t* _tmp_p_args = ms->ms_p_args;
	size_t _len_p_args = sizeof(*_tmp_p_args);
	sgxsd_node_init_args_t* _in_p_args = NULL;

	CHECK_UNIQUE_POINTER(_tmp_p_args, _len_p_args);

	//
	// fence after pointer checks
	//
	sgx_lfence();

	if (_tmp_p_args != NULL && _len_p_args != 0) {
		_in_p_args = (sgxsd_node_init_args_t*)malloc(_len_p_args);
		if (_in_p_args == NULL) {
			status = SGX_ERROR_OUT_OF_MEMORY;
			goto err;
		}

		memcpy((void*)_in_p_args, _tmp_p_args, _len_p_args);
	}

	ms->ms_retval = sgxsd_enclave_node_init((const sgxsd_node_init_args_t*)_in_p_args);
err:
	if (_in_p_args) free((void*)_in_p_args);

	return status;
}

static sgx_status_t SGX_CDECL sgx_sgxsd_enclave_get_next_report(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_sgxsd_enclave_get_next_report_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_sgxsd_enclave_get_next_report_t* ms = SGX_CAST(ms_sgxsd_enclave_get_next_report_t*, pms);
	sgx_status_t status = SGX_SUCCESS;
	sgx_report_t* _tmp_p_report = ms->ms_p_report;
	size_t _len_p_report = sizeof(*_tmp_p_report);
	sgx_report_t* _in_p_report = NULL;

	CHECK_UNIQUE_POINTER(_tmp_p_report, _len_p_report);

	//
	// fence after pointer checks
	//
	sgx_lfence();

	if (_tmp_p_report != NULL && _len_p_report != 0) {
		if ((_in_p_report = (sgx_report_t*)malloc(_len_p_report)) == NULL) {
			status = SGX_ERROR_OUT_OF_MEMORY;
			goto err;
		}

		memset((void*)_in_p_report, 0, _len_p_report);
	}

	ms->ms_retval = sgxsd_enclave_get_next_report(ms->ms_qe_target_info, _in_p_report);
err:
	if (_in_p_report) {
		memcpy(_tmp_p_report, _in_p_report, _len_p_report);
		free(_in_p_report);
	}

	return status;
}

static sgx_status_t SGX_CDECL sgx_sgxsd_enclave_set_current_quote(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_sgxsd_enclave_set_current_quote_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_sgxsd_enclave_set_current_quote_t* ms = SGX_CAST(ms_sgxsd_enclave_set_current_quote_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	ms->ms_retval = sgxsd_enclave_set_current_quote();


	return status;
}

static sgx_status_t SGX_CDECL sgx_sgxsd_enclave_negotiate_request(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_sgxsd_enclave_negotiate_request_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_sgxsd_enclave_negotiate_request_t* ms = SGX_CAST(ms_sgxsd_enclave_negotiate_request_t*, pms);
	sgx_status_t status = SGX_SUCCESS;
	sgxsd_request_negotiation_request_t* _tmp_p_request = ms->ms_p_request;
	size_t _len_p_request = sizeof(*_tmp_p_request);
	sgxsd_request_negotiation_request_t* _in_p_request = NULL;
	sgxsd_request_negotiation_response_t* _tmp_p_response = ms->ms_p_response;
	size_t _len_p_response = sizeof(*_tmp_p_response);
	sgxsd_request_negotiation_response_t* _in_p_response = NULL;

	CHECK_UNIQUE_POINTER(_tmp_p_request, _len_p_request);
	CHECK_UNIQUE_POINTER(_tmp_p_response, _len_p_response);

	//
	// fence after pointer checks
	//
	sgx_lfence();

	if (_tmp_p_request != NULL && _len_p_request != 0) {
		_in_p_request = (sgxsd_request_negotiation_request_t*)malloc(_len_p_request);
		if (_in_p_request == NULL) {
			status = SGX_ERROR_OUT_OF_MEMORY;
			goto err;
		}

		memcpy((void*)_in_p_request, _tmp_p_request, _len_p_request);
	}
	if (_tmp_p_response != NULL && _len_p_response != 0) {
		if ((_in_p_response = (sgxsd_request_negotiation_response_t*)malloc(_len_p_response)) == NULL) {
			status = SGX_ERROR_OUT_OF_MEMORY;
			goto err;
		}

		memset((void*)_in_p_response, 0, _len_p_response);
	}

	ms->ms_retval = sgxsd_enclave_negotiate_request((const sgxsd_request_negotiation_request_t*)_in_p_request, _in_p_response);
err:
	if (_in_p_request) free((void*)_in_p_request);
	if (_in_p_response) {
		memcpy(_tmp_p_response, _in_p_response, _len_p_response);
		free(_in_p_response);
	}

	return status;
}

static sgx_status_t SGX_CDECL sgx_sgxsd_enclave_server_start(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_sgxsd_enclave_server_start_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_sgxsd_enclave_server_start_t* ms = SGX_CAST(ms_sgxsd_enclave_server_start_t*, pms);
	sgx_status_t status = SGX_SUCCESS;
	sgxsd_server_init_args_t* _tmp_p_args = ms->ms_p_args;
	size_t _len_p_args = sizeof(*_tmp_p_args);
	sgxsd_server_init_args_t* _in_p_args = NULL;

	CHECK_UNIQUE_POINTER(_tmp_p_args, _len_p_args);

	//
	// fence after pointer checks
	//
	sgx_lfence();

	if (_tmp_p_args != NULL && _len_p_args != 0) {
		_in_p_args = (sgxsd_server_init_args_t*)malloc(_len_p_args);
		if (_in_p_args == NULL) {
			status = SGX_ERROR_OUT_OF_MEMORY;
			goto err;
		}

		memcpy((void*)_in_p_args, _tmp_p_args, _len_p_args);
	}

	ms->ms_retval = sgxsd_enclave_server_start((const sgxsd_server_init_args_t*)_in_p_args, ms->ms_state_handle);
err:
	if (_in_p_args) free((void*)_in_p_args);

	return status;
}

static sgx_status_t SGX_CDECL sgx_sgxsd_enclave_server_call(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_sgxsd_enclave_server_call_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_sgxsd_enclave_server_call_t* ms = SGX_CAST(ms_sgxsd_enclave_server_call_t*, pms);
	sgx_status_t status = SGX_SUCCESS;
	sgxsd_server_handle_call_args_t* _tmp_p_args = ms->ms_p_args;
	size_t _len_p_args = sizeof(*_tmp_p_args);
	sgxsd_server_handle_call_args_t* _in_p_args = NULL;
	sgxsd_msg_header_t* _tmp_msg_header = ms->ms_msg_header;
	size_t _len_msg_header = sizeof(*_tmp_msg_header);
	sgxsd_msg_header_t* _in_msg_header = NULL;
	uint8_t* _tmp_msg_data = ms->ms_msg_data;
	size_t _tmp_msg_size = ms->ms_msg_size;
	size_t _len_msg_data = _tmp_msg_size;
	uint8_t* _in_msg_data = NULL;

	CHECK_UNIQUE_POINTER(_tmp_p_args, _len_p_args);
	CHECK_UNIQUE_POINTER(_tmp_msg_header, _len_msg_header);
	CHECK_UNIQUE_POINTER(_tmp_msg_data, _len_msg_data);

	//
	// fence after pointer checks
	//
	sgx_lfence();

	if (_tmp_p_args != NULL && _len_p_args != 0) {
		_in_p_args = (sgxsd_server_handle_call_args_t*)malloc(_len_p_args);
		if (_in_p_args == NULL) {
			status = SGX_ERROR_OUT_OF_MEMORY;
			goto err;
		}

		memcpy((void*)_in_p_args, _tmp_p_args, _len_p_args);
	}
	if (_tmp_msg_header != NULL && _len_msg_header != 0) {
		_in_msg_header = (sgxsd_msg_header_t*)malloc(_len_msg_header);
		if (_in_msg_header == NULL) {
			status = SGX_ERROR_OUT_OF_MEMORY;
			goto err;
		}

		memcpy((void*)_in_msg_header, _tmp_msg_header, _len_msg_header);
	}
	if (_tmp_msg_data != NULL && _len_msg_data != 0) {
		_in_msg_data = (uint8_t*)malloc(_len_msg_data);
		if (_in_msg_data == NULL) {
			status = SGX_ERROR_OUT_OF_MEMORY;
			goto err;
		}

		memcpy(_in_msg_data, _tmp_msg_data, _len_msg_data);
	}

	ms->ms_retval = sgxsd_enclave_server_call((const sgxsd_server_handle_call_args_t*)_in_p_args, (const sgxsd_msg_header_t*)_in_msg_header, _in_msg_data, _tmp_msg_size, ms->ms_msg_tag, ms->ms_state_handle);
err:
	if (_in_p_args) free((void*)_in_p_args);
	if (_in_msg_header) free((void*)_in_msg_header);
	if (_in_msg_data) free(_in_msg_data);

	return status;
}

static sgx_status_t SGX_CDECL sgx_sgxsd_enclave_server_stop(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_sgxsd_enclave_server_stop_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_sgxsd_enclave_server_stop_t* ms = SGX_CAST(ms_sgxsd_enclave_server_stop_t*, pms);
	sgx_status_t status = SGX_SUCCESS;
	sgxsd_server_terminate_args_t* _tmp_p_args = ms->ms_p_args;
	size_t _len_p_args = sizeof(*_tmp_p_args);
	sgxsd_server_terminate_args_t* _in_p_args = NULL;

	CHECK_UNIQUE_POINTER(_tmp_p_args, _len_p_args);

	//
	// fence after pointer checks
	//
	sgx_lfence();

	if (_tmp_p_args != NULL && _len_p_args != 0) {
		_in_p_args = (sgxsd_server_terminate_args_t*)malloc(_len_p_args);
		if (_in_p_args == NULL) {
			status = SGX_ERROR_OUT_OF_MEMORY;
			goto err;
		}

		memcpy((void*)_in_p_args, _tmp_p_args, _len_p_args);
	}

	ms->ms_retval = sgxsd_enclave_server_stop((const sgxsd_server_terminate_args_t*)_in_p_args, ms->ms_state_handle);
err:
	if (_in_p_args) free((void*)_in_p_args);

	return status;
}

SGX_EXTERNC const struct {
	size_t nr_ecall;
	struct {void* ecall_addr; uint8_t is_priv;} ecall_table[7];
} g_ecall_table = {
	7,
	{
		{(void*)(uintptr_t)sgx_sgxsd_enclave_node_init, 0},
		{(void*)(uintptr_t)sgx_sgxsd_enclave_get_next_report, 0},
		{(void*)(uintptr_t)sgx_sgxsd_enclave_set_current_quote, 0},
		{(void*)(uintptr_t)sgx_sgxsd_enclave_negotiate_request, 0},
		{(void*)(uintptr_t)sgx_sgxsd_enclave_server_start, 0},
		{(void*)(uintptr_t)sgx_sgxsd_enclave_server_call, 0},
		{(void*)(uintptr_t)sgx_sgxsd_enclave_server_stop, 0},
	}
};

SGX_EXTERNC const struct {
	size_t nr_ocall;
	uint8_t entry_table[38][7];
} g_dyn_entry_table = {
	38,
	{
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, },
	}
};


sgx_status_t SGX_CDECL sgxsd_ocall_reply(sgx_status_t* retval, const sgxsd_msg_header_t* reply_header, const uint8_t* reply_data, size_t reply_data_size, sgxsd_msg_tag_t msg_tag)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_reply_header = sizeof(*reply_header);
	size_t _len_reply_data = reply_data_size;

	ms_sgxsd_ocall_reply_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_sgxsd_ocall_reply_t);
	void *__tmp = NULL;

	ocalloc_size += (reply_header != NULL && sgx_is_within_enclave(reply_header, _len_reply_header)) ? _len_reply_header : 0;
	ocalloc_size += (reply_data != NULL && sgx_is_within_enclave(reply_data, _len_reply_data)) ? _len_reply_data : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_sgxsd_ocall_reply_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_sgxsd_ocall_reply_t));

	if (reply_header != NULL && sgx_is_within_enclave(reply_header, _len_reply_header)) {
		ms->ms_reply_header = (sgxsd_msg_header_t*)__tmp;
		memcpy(__tmp, reply_header, _len_reply_header);
		__tmp = (void *)((size_t)__tmp + _len_reply_header);
	} else if (reply_header == NULL) {
		ms->ms_reply_header = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	if (reply_data != NULL && sgx_is_within_enclave(reply_data, _len_reply_data)) {
		ms->ms_reply_data = (uint8_t*)__tmp;
		memcpy(__tmp, reply_data, _len_reply_data);
		__tmp = (void *)((size_t)__tmp + _len_reply_data);
	} else if (reply_data == NULL) {
		ms->ms_reply_data = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	ms->ms_reply_data_size = reply_data_size;
	ms->ms_msg_tag = msg_tag;
	status = sgx_ocall(0, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_getenv(char** retval, const char* name)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_name = name ? strlen(name) + 1 : 0;

	ms_libsfuzz_ocall_getenv_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_getenv_t);
	void *__tmp = NULL;

	ocalloc_size += (name != NULL && sgx_is_within_enclave(name, _len_name)) ? _len_name : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_getenv_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_getenv_t));

	if (name != NULL && sgx_is_within_enclave(name, _len_name)) {
		ms->ms_name = (char*)__tmp;
		memcpy(__tmp, name, _len_name);
		__tmp = (void *)((size_t)__tmp + _len_name);
	} else if (name == NULL) {
		ms->ms_name = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	status = sgx_ocall(1, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_open(int* retval, const char* pathname, int flags)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_pathname = pathname ? strlen(pathname) + 1 : 0;

	ms_libsfuzz_ocall_open_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_open_t);
	void *__tmp = NULL;

	ocalloc_size += (pathname != NULL && sgx_is_within_enclave(pathname, _len_pathname)) ? _len_pathname : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_open_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_open_t));

	if (pathname != NULL && sgx_is_within_enclave(pathname, _len_pathname)) {
		ms->ms_pathname = (char*)__tmp;
		memcpy(__tmp, pathname, _len_pathname);
		__tmp = (void *)((size_t)__tmp + _len_pathname);
	} else if (pathname == NULL) {
		ms->ms_pathname = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	ms->ms_flags = flags;
	status = sgx_ocall(2, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_close(int* retval, int fd)
{
	sgx_status_t status = SGX_SUCCESS;

	ms_libsfuzz_ocall_close_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_close_t);
	void *__tmp = NULL;


	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_close_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_close_t));

	ms->ms_fd = fd;
	status = sgx_ocall(3, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_pthread_attr_init(int* retval, pthread_attr_t* attr)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_attr = sizeof(*attr);

	ms_libsfuzz_ocall_pthread_attr_init_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_pthread_attr_init_t);
	void *__tmp = NULL;

	ocalloc_size += (attr != NULL && sgx_is_within_enclave(attr, _len_attr)) ? _len_attr : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_pthread_attr_init_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_pthread_attr_init_t));

	if (attr != NULL && sgx_is_within_enclave(attr, _len_attr)) {
		ms->ms_attr = (pthread_attr_t*)__tmp;
		memcpy(__tmp, attr, _len_attr);
		__tmp = (void *)((size_t)__tmp + _len_attr);
	} else if (attr == NULL) {
		ms->ms_attr = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	status = sgx_ocall(4, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_pthread_attr_destroy(int* retval, pthread_attr_t* attr)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_attr = sizeof(*attr);

	ms_libsfuzz_ocall_pthread_attr_destroy_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_pthread_attr_destroy_t);
	void *__tmp = NULL;

	ocalloc_size += (attr != NULL && sgx_is_within_enclave(attr, _len_attr)) ? _len_attr : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_pthread_attr_destroy_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_pthread_attr_destroy_t));

	if (attr != NULL && sgx_is_within_enclave(attr, _len_attr)) {
		ms->ms_attr = (pthread_attr_t*)__tmp;
		memcpy(__tmp, attr, _len_attr);
		__tmp = (void *)((size_t)__tmp + _len_attr);
	} else if (attr == NULL) {
		ms->ms_attr = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	status = sgx_ocall(5, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_isatty(int* retval, int fd)
{
	sgx_status_t status = SGX_SUCCESS;

	ms_libsfuzz_ocall_isatty_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_isatty_t);
	void *__tmp = NULL;


	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_isatty_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_isatty_t));

	ms->ms_fd = fd;
	status = sgx_ocall(6, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_pipe(int* retval, int pipefd[2])
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_pipefd = 2 * sizeof(*pipefd);

	ms_libsfuzz_ocall_pipe_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_pipe_t);
	void *__tmp = NULL;

	ocalloc_size += (pipefd != NULL && sgx_is_within_enclave(pipefd, _len_pipefd)) ? _len_pipefd : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_pipe_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_pipe_t));

	if (pipefd != NULL && sgx_is_within_enclave(pipefd, _len_pipefd)) {
		ms->ms_pipefd = (int*)__tmp;
		memcpy(__tmp, pipefd, _len_pipefd);
		__tmp = (void *)((size_t)__tmp + _len_pipefd);
	} else if (pipefd == NULL) {
		ms->ms_pipefd = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	status = sgx_ocall(7, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_usleep(int* retval, unsigned long long usec)
{
	sgx_status_t status = SGX_SUCCESS;

	ms_libsfuzz_ocall_usleep_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_usleep_t);
	void *__tmp = NULL;


	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_usleep_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_usleep_t));

	ms->ms_usec = usec;
	status = sgx_ocall(8, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_sleep(int* retval, unsigned int seconds)
{
	sgx_status_t status = SGX_SUCCESS;

	ms_libsfuzz_ocall_sleep_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_sleep_t);
	void *__tmp = NULL;


	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_sleep_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_sleep_t));

	ms->ms_seconds = seconds;
	status = sgx_ocall(9, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_execv(int* retval, const char* pathname, int argv_num, char* argv1, char* argv2, char* argv3)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_pathname = pathname ? strlen(pathname) + 1 : 0;
	size_t _len_argv1 = argv1 ? strlen(argv1) + 1 : 0;
	size_t _len_argv2 = argv2 ? strlen(argv2) + 1 : 0;
	size_t _len_argv3 = argv3 ? strlen(argv3) + 1 : 0;

	ms_libsfuzz_ocall_execv_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_execv_t);
	void *__tmp = NULL;

	ocalloc_size += (pathname != NULL && sgx_is_within_enclave(pathname, _len_pathname)) ? _len_pathname : 0;
	ocalloc_size += (argv1 != NULL && sgx_is_within_enclave(argv1, _len_argv1)) ? _len_argv1 : 0;
	ocalloc_size += (argv2 != NULL && sgx_is_within_enclave(argv2, _len_argv2)) ? _len_argv2 : 0;
	ocalloc_size += (argv3 != NULL && sgx_is_within_enclave(argv3, _len_argv3)) ? _len_argv3 : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_execv_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_execv_t));

	if (pathname != NULL && sgx_is_within_enclave(pathname, _len_pathname)) {
		ms->ms_pathname = (char*)__tmp;
		memcpy(__tmp, pathname, _len_pathname);
		__tmp = (void *)((size_t)__tmp + _len_pathname);
	} else if (pathname == NULL) {
		ms->ms_pathname = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	ms->ms_argv_num = argv_num;
	if (argv1 != NULL && sgx_is_within_enclave(argv1, _len_argv1)) {
		ms->ms_argv1 = (char*)__tmp;
		memcpy(__tmp, argv1, _len_argv1);
		__tmp = (void *)((size_t)__tmp + _len_argv1);
	} else if (argv1 == NULL) {
		ms->ms_argv1 = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	if (argv2 != NULL && sgx_is_within_enclave(argv2, _len_argv2)) {
		ms->ms_argv2 = (char*)__tmp;
		memcpy(__tmp, argv2, _len_argv2);
		__tmp = (void *)((size_t)__tmp + _len_argv2);
	} else if (argv2 == NULL) {
		ms->ms_argv2 = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	if (argv3 != NULL && sgx_is_within_enclave(argv3, _len_argv3)) {
		ms->ms_argv3 = (char*)__tmp;
		memcpy(__tmp, argv3, _len_argv3);
		__tmp = (void *)((size_t)__tmp + _len_argv3);
	} else if (argv3 == NULL) {
		ms->ms_argv3 = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	status = sgx_ocall(10, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_pthread_attr_setstacksize(int* retval, pthread_attr_t* attr, size_t stacksize)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_attr = sizeof(*attr);

	ms_libsfuzz_ocall_pthread_attr_setstacksize_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_pthread_attr_setstacksize_t);
	void *__tmp = NULL;

	void *__tmp_attr = NULL;
	ocalloc_size += (attr != NULL && sgx_is_within_enclave(attr, _len_attr)) ? _len_attr : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_pthread_attr_setstacksize_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_pthread_attr_setstacksize_t));

	if (attr != NULL && sgx_is_within_enclave(attr, _len_attr)) {
		ms->ms_attr = (pthread_attr_t*)__tmp;
		__tmp_attr = __tmp;
		memcpy(__tmp_attr, attr, _len_attr);
		__tmp = (void *)((size_t)__tmp + _len_attr);
	} else if (attr == NULL) {
		ms->ms_attr = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	ms->ms_stacksize = stacksize;
	status = sgx_ocall(11, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
		if (attr) memcpy((void*)attr, __tmp_attr, _len_attr);
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_pthread_attr_getstacksize(int* retval, pthread_attr_t* attr, size_t* stacksize)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_attr = sizeof(*attr);
	size_t _len_stacksize = sizeof(*stacksize);

	ms_libsfuzz_ocall_pthread_attr_getstacksize_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_pthread_attr_getstacksize_t);
	void *__tmp = NULL;

	void *__tmp_attr = NULL;
	void *__tmp_stacksize = NULL;
	ocalloc_size += (attr != NULL && sgx_is_within_enclave(attr, _len_attr)) ? _len_attr : 0;
	ocalloc_size += (stacksize != NULL && sgx_is_within_enclave(stacksize, _len_stacksize)) ? _len_stacksize : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_pthread_attr_getstacksize_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_pthread_attr_getstacksize_t));

	if (attr != NULL && sgx_is_within_enclave(attr, _len_attr)) {
		ms->ms_attr = (pthread_attr_t*)__tmp;
		__tmp_attr = __tmp;
		memcpy(__tmp_attr, attr, _len_attr);
		__tmp = (void *)((size_t)__tmp + _len_attr);
	} else if (attr == NULL) {
		ms->ms_attr = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	if (stacksize != NULL && sgx_is_within_enclave(stacksize, _len_stacksize)) {
		ms->ms_stacksize = (size_t*)__tmp;
		__tmp_stacksize = __tmp;
		memcpy(__tmp_stacksize, stacksize, _len_stacksize);
		__tmp = (void *)((size_t)__tmp + _len_stacksize);
	} else if (stacksize == NULL) {
		ms->ms_stacksize = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	status = sgx_ocall(12, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
		if (attr) memcpy((void*)attr, __tmp_attr, _len_attr);
		if (stacksize) memcpy((void*)stacksize, __tmp_stacksize, _len_stacksize);
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_getuid(unsigned long long* retval)
{
	sgx_status_t status = SGX_SUCCESS;

	ms_libsfuzz_ocall_getuid_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_getuid_t);
	void *__tmp = NULL;


	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_getuid_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_getuid_t));

	status = sgx_ocall(13, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_sysconf(long int* retval, int name)
{
	sgx_status_t status = SGX_SUCCESS;

	ms_libsfuzz_ocall_sysconf_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_sysconf_t);
	void *__tmp = NULL;


	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_sysconf_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_sysconf_t));

	ms->ms_name = name;
	status = sgx_ocall(14, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_shm_open(int* retval, const char* name, int oflag, unsigned long long mode)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_name = name ? strlen(name) + 1 : 0;

	ms_libsfuzz_ocall_shm_open_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_shm_open_t);
	void *__tmp = NULL;

	ocalloc_size += (name != NULL && sgx_is_within_enclave(name, _len_name)) ? _len_name : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_shm_open_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_shm_open_t));

	if (name != NULL && sgx_is_within_enclave(name, _len_name)) {
		ms->ms_name = (char*)__tmp;
		memcpy(__tmp, name, _len_name);
		__tmp = (void *)((size_t)__tmp + _len_name);
	} else if (name == NULL) {
		ms->ms_name = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	ms->ms_oflag = oflag;
	ms->ms_mode = mode;
	status = sgx_ocall(15, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_shm_unlink(int* retval, const char* name)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_name = name ? strlen(name) + 1 : 0;

	ms_libsfuzz_ocall_shm_unlink_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_shm_unlink_t);
	void *__tmp = NULL;

	ocalloc_size += (name != NULL && sgx_is_within_enclave(name, _len_name)) ? _len_name : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_shm_unlink_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_shm_unlink_t));

	if (name != NULL && sgx_is_within_enclave(name, _len_name)) {
		ms->ms_name = (char*)__tmp;
		memcpy(__tmp, name, _len_name);
		__tmp = (void *)((size_t)__tmp + _len_name);
	} else if (name == NULL) {
		ms->ms_name = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	status = sgx_ocall(16, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_syslog_chk(int priority, int flag, const char* format)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_format = format ? strlen(format) + 1 : 0;

	ms_libsfuzz_ocall_syslog_chk_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_syslog_chk_t);
	void *__tmp = NULL;

	ocalloc_size += (format != NULL && sgx_is_within_enclave(format, _len_format)) ? _len_format : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_syslog_chk_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_syslog_chk_t));

	ms->ms_priority = priority;
	ms->ms_flag = flag;
	if (format != NULL && sgx_is_within_enclave(format, _len_format)) {
		ms->ms_format = (char*)__tmp;
		memcpy(__tmp, format, _len_format);
		__tmp = (void *)((size_t)__tmp + _len_format);
	} else if (format == NULL) {
		ms->ms_format = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	status = sgx_ocall(17, ms);

	if (status == SGX_SUCCESS) {
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_snprintf_chk(int* retval, char* str, size_t maxlen, int flag, size_t stlen, const char* format)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_str = str ? strlen(str) + 1 : 0;
	size_t _len_format = format ? strlen(format) + 1 : 0;

	ms_libsfuzz_ocall_snprintf_chk_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_snprintf_chk_t);
	void *__tmp = NULL;

	ocalloc_size += (str != NULL && sgx_is_within_enclave(str, _len_str)) ? _len_str : 0;
	ocalloc_size += (format != NULL && sgx_is_within_enclave(format, _len_format)) ? _len_format : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_snprintf_chk_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_snprintf_chk_t));

	if (str != NULL && sgx_is_within_enclave(str, _len_str)) {
		ms->ms_str = (char*)__tmp;
		memcpy(__tmp, str, _len_str);
		__tmp = (void *)((size_t)__tmp + _len_str);
	} else if (str == NULL) {
		ms->ms_str = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	ms->ms_maxlen = maxlen;
	ms->ms_flag = flag;
	ms->ms_stlen = stlen;
	if (format != NULL && sgx_is_within_enclave(format, _len_format)) {
		ms->ms_format = (char*)__tmp;
		memcpy(__tmp, format, _len_format);
		__tmp = (void *)((size_t)__tmp + _len_format);
	} else if (format == NULL) {
		ms->ms_format = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	status = sgx_ocall(18, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_getrusage(int* retval, int who, struct rusage* usage)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_usage = srusage;

	ms_libsfuzz_ocall_getrusage_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_getrusage_t);
	void *__tmp = NULL;

	ocalloc_size += (usage != NULL && sgx_is_within_enclave(usage, _len_usage)) ? _len_usage : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_getrusage_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_getrusage_t));

	ms->ms_who = who;
	if (usage != NULL && sgx_is_within_enclave(usage, _len_usage)) {
		ms->ms_usage = (struct rusage*)__tmp;
		memcpy(__tmp, usage, _len_usage);
		__tmp = (void *)((size_t)__tmp + _len_usage);
	} else if (usage == NULL) {
		ms->ms_usage = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	status = sgx_ocall(19, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_sched_yield(int* retval)
{
	sgx_status_t status = SGX_SUCCESS;

	ms_libsfuzz_ocall_sched_yield_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_sched_yield_t);
	void *__tmp = NULL;


	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_sched_yield_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_sched_yield_t));

	status = sgx_ocall(20, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_pthread_getattr_np(int* retval, pthread_t thread, pthread_attr_t* attr)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_attr = sizeof(*attr);

	ms_libsfuzz_ocall_pthread_getattr_np_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_pthread_getattr_np_t);
	void *__tmp = NULL;

	ocalloc_size += (attr != NULL && sgx_is_within_enclave(attr, _len_attr)) ? _len_attr : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_pthread_getattr_np_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_pthread_getattr_np_t));

	ms->ms_thread = thread;
	if (attr != NULL && sgx_is_within_enclave(attr, _len_attr)) {
		ms->ms_attr = (pthread_attr_t*)__tmp;
		memcpy(__tmp, attr, _len_attr);
		__tmp = (void *)((size_t)__tmp + _len_attr);
	} else if (attr == NULL) {
		ms->ms_attr = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	status = sgx_ocall(21, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_pthread_getspecific(void** retval, pthread_key_t key)
{
	sgx_status_t status = SGX_SUCCESS;

	ms_libsfuzz_ocall_pthread_getspecific_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_pthread_getspecific_t);
	void *__tmp = NULL;


	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_pthread_getspecific_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_pthread_getspecific_t));

	ms->ms_key = key;
	status = sgx_ocall(22, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_pthread_setspecific(int* retval, pthread_key_t key, const void* value)
{
	sgx_status_t status = SGX_SUCCESS;

	ms_libsfuzz_ocall_pthread_setspecific_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_pthread_setspecific_t);
	void *__tmp = NULL;


	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_pthread_setspecific_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_pthread_setspecific_t));

	ms->ms_key = key;
	ms->ms_value = SGX_CAST(void*, value);
	status = sgx_ocall(23, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_pthread_key_create(int* retval, pthread_key_t* key, int nodestructor)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_key = sizeof(*key);

	ms_libsfuzz_ocall_pthread_key_create_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_pthread_key_create_t);
	void *__tmp = NULL;

	void *__tmp_key = NULL;
	ocalloc_size += (key != NULL && sgx_is_within_enclave(key, _len_key)) ? _len_key : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_pthread_key_create_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_pthread_key_create_t));

	if (key != NULL && sgx_is_within_enclave(key, _len_key)) {
		ms->ms_key = (pthread_key_t*)__tmp;
		__tmp_key = __tmp;
		memcpy(__tmp_key, key, _len_key);
		__tmp = (void *)((size_t)__tmp + _len_key);
	} else if (key == NULL) {
		ms->ms_key = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	ms->ms_nodestructor = nodestructor;
	status = sgx_ocall(24, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
		if (key) memcpy((void*)key, __tmp_key, _len_key);
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_libsfuzz_ocall_readlink(size_t* retval, const char* pathname, char* buf, size_t bufsiz)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_pathname = pathname ? strlen(pathname) + 1 : 0;
	size_t _len_buf = bufsiz;

	ms_libsfuzz_libsfuzz_ocall_readlink_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_libsfuzz_ocall_readlink_t);
	void *__tmp = NULL;

	void *__tmp_buf = NULL;
	ocalloc_size += (pathname != NULL && sgx_is_within_enclave(pathname, _len_pathname)) ? _len_pathname : 0;
	ocalloc_size += (buf != NULL && sgx_is_within_enclave(buf, _len_buf)) ? _len_buf : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_libsfuzz_ocall_readlink_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_libsfuzz_ocall_readlink_t));

	if (pathname != NULL && sgx_is_within_enclave(pathname, _len_pathname)) {
		ms->ms_pathname = (char*)__tmp;
		memcpy(__tmp, pathname, _len_pathname);
		__tmp = (void *)((size_t)__tmp + _len_pathname);
	} else if (pathname == NULL) {
		ms->ms_pathname = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	if (buf != NULL && sgx_is_within_enclave(buf, _len_buf)) {
		ms->ms_buf = (char*)__tmp;
		__tmp_buf = __tmp;
		memcpy(__tmp_buf, buf, _len_buf);
		__tmp = (void *)((size_t)__tmp + _len_buf);
	} else if (buf == NULL) {
		ms->ms_buf = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	ms->ms_bufsiz = bufsiz;
	status = sgx_ocall(25, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
		if (buf) memcpy((void*)buf, __tmp_buf, _len_buf);
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_pthread_self(pthread_t* retval)
{
	sgx_status_t status = SGX_SUCCESS;

	ms_libsfuzz_ocall_pthread_self_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_pthread_self_t);
	void *__tmp = NULL;


	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_pthread_self_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_pthread_self_t));

	status = sgx_ocall(26, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_fxstat(int* retval, int vers, int fd, struct stat* buf)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_buf = sstat;

	ms_libsfuzz_ocall_fxstat_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_fxstat_t);
	void *__tmp = NULL;

	ocalloc_size += (buf != NULL && sgx_is_within_enclave(buf, _len_buf)) ? _len_buf : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_fxstat_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_fxstat_t));

	ms->ms_vers = vers;
	ms->ms_fd = fd;
	if (buf != NULL && sgx_is_within_enclave(buf, _len_buf)) {
		ms->ms_buf = (struct stat*)__tmp;
		memcpy(__tmp, buf, _len_buf);
		__tmp = (void *)((size_t)__tmp + _len_buf);
	} else if (buf == NULL) {
		ms->ms_buf = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	status = sgx_ocall(27, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_sigaltstack(int* retval, unsigned long long ss, unsigned long long old_ss)
{
	sgx_status_t status = SGX_SUCCESS;

	ms_libsfuzz_ocall_sigaltstack_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_sigaltstack_t);
	void *__tmp = NULL;


	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_sigaltstack_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_sigaltstack_t));

	ms->ms_ss = ss;
	ms->ms_old_ss = old_ss;
	status = sgx_ocall(28, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_getrlimit(int* retval, int resource, struct rlimit* rlim)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_rlim = 16;

	ms_libsfuzz_ocall_getrlimit_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_getrlimit_t);
	void *__tmp = NULL;

	void *__tmp_rlim = NULL;
	ocalloc_size += (rlim != NULL && sgx_is_within_enclave(rlim, _len_rlim)) ? _len_rlim : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_getrlimit_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_getrlimit_t));

	ms->ms_resource = resource;
	if (rlim != NULL && sgx_is_within_enclave(rlim, _len_rlim)) {
		ms->ms_rlim = (struct rlimit*)__tmp;
		__tmp_rlim = __tmp;
		memcpy(__tmp_rlim, rlim, _len_rlim);
		__tmp = (void *)((size_t)__tmp + _len_rlim);
	} else if (rlim == NULL) {
		ms->ms_rlim = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	status = sgx_ocall(29, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
		if (rlim) memcpy((void*)rlim, __tmp_rlim, _len_rlim);
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_setrlimit(int* retval, int resource, const struct rlimit* rlim)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_rlim = 16;

	ms_libsfuzz_ocall_setrlimit_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_setrlimit_t);
	void *__tmp = NULL;

	ocalloc_size += (rlim != NULL && sgx_is_within_enclave(rlim, _len_rlim)) ? _len_rlim : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_setrlimit_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_setrlimit_t));

	ms->ms_resource = resource;
	if (rlim != NULL && sgx_is_within_enclave(rlim, _len_rlim)) {
		ms->ms_rlim = (struct rlimit*)__tmp;
		memcpy(__tmp, rlim, _len_rlim);
		__tmp = (void *)((size_t)__tmp + _len_rlim);
	} else if (rlim == NULL) {
		ms->ms_rlim = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	status = sgx_ocall(30, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_dlsym(void** retval, unsigned long long handle, const char* symbol)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_symbol = symbol ? strlen(symbol) + 1 : 0;

	ms_libsfuzz_ocall_dlsym_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_dlsym_t);
	void *__tmp = NULL;

	ocalloc_size += (symbol != NULL && sgx_is_within_enclave(symbol, _len_symbol)) ? _len_symbol : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_dlsym_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_dlsym_t));

	ms->ms_handle = handle;
	if (symbol != NULL && sgx_is_within_enclave(symbol, _len_symbol)) {
		ms->ms_symbol = (char*)__tmp;
		memcpy(__tmp, symbol, _len_symbol);
		__tmp = (void *)((size_t)__tmp + _len_symbol);
	} else if (symbol == NULL) {
		ms->ms_symbol = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	status = sgx_ocall(31, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_waitpid(int* retval, int pid, int* stat_loc, int options)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_stat_loc = sizeof(*stat_loc);

	ms_libsfuzz_ocall_waitpid_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_waitpid_t);
	void *__tmp = NULL;

	void *__tmp_stat_loc = NULL;
	ocalloc_size += (stat_loc != NULL && sgx_is_within_enclave(stat_loc, _len_stat_loc)) ? _len_stat_loc : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_waitpid_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_waitpid_t));

	ms->ms_pid = pid;
	if (stat_loc != NULL && sgx_is_within_enclave(stat_loc, _len_stat_loc)) {
		ms->ms_stat_loc = (int*)__tmp;
		__tmp_stat_loc = __tmp;
		memcpy(__tmp_stat_loc, stat_loc, _len_stat_loc);
		__tmp = (void *)((size_t)__tmp + _len_stat_loc);
	} else if (stat_loc == NULL) {
		ms->ms_stat_loc = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	ms->ms_options = options;
	status = sgx_ocall(32, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
		if (stat_loc) memcpy((void*)stat_loc, __tmp_stat_loc, _len_stat_loc);
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_write(size_t* retval, int fd, const void* buf, size_t count)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_buf = count;

	ms_libsfuzz_ocall_write_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_write_t);
	void *__tmp = NULL;

	ocalloc_size += (buf != NULL && sgx_is_within_enclave(buf, _len_buf)) ? _len_buf : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_write_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_write_t));

	ms->ms_fd = fd;
	if (buf != NULL && sgx_is_within_enclave(buf, _len_buf)) {
		ms->ms_buf = (void*)__tmp;
		memcpy(__tmp, buf, _len_buf);
		__tmp = (void *)((size_t)__tmp + _len_buf);
	} else if (buf == NULL) {
		ms->ms_buf = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	ms->ms_count = count;
	status = sgx_ocall(33, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_read(size_t* retval, int fd, void* buf, size_t count)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_buf = count;

	ms_libsfuzz_ocall_read_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_read_t);
	void *__tmp = NULL;

	void *__tmp_buf = NULL;
	ocalloc_size += (buf != NULL && sgx_is_within_enclave(buf, _len_buf)) ? _len_buf : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_read_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_read_t));

	ms->ms_fd = fd;
	if (buf != NULL && sgx_is_within_enclave(buf, _len_buf)) {
		ms->ms_buf = (void*)__tmp;
		__tmp_buf = __tmp;
		memcpy(__tmp_buf, buf, _len_buf);
		__tmp = (void *)((size_t)__tmp + _len_buf);
	} else if (buf == NULL) {
		ms->ms_buf = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	ms->ms_count = count;
	status = sgx_ocall(34, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
		if (buf) memcpy((void*)buf, __tmp_buf, _len_buf);
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_exit(int stat)
{
	sgx_status_t status = SGX_SUCCESS;

	ms_libsfuzz_ocall_exit_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_exit_t);
	void *__tmp = NULL;


	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_exit_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_exit_t));

	ms->ms_stat = stat;
	status = sgx_ocall(35, ms);

	if (status == SGX_SUCCESS) {
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_calloc(void** retval, size_t items, size_t size)
{
	sgx_status_t status = SGX_SUCCESS;

	ms_libsfuzz_ocall_calloc_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_libsfuzz_ocall_calloc_t);
	void *__tmp = NULL;


	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_libsfuzz_ocall_calloc_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_libsfuzz_ocall_calloc_t));

	ms->ms_items = items;
	ms->ms_size = size;
	status = sgx_ocall(36, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL libsfuzz_ocall_abort()
{
	sgx_status_t status = SGX_SUCCESS;
	status = sgx_ocall(37, NULL);

	return status;
}
