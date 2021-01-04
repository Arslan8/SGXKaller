typedef struct sgxsd_aes_gcm_iv {
  uint8_t data[12];
} sgxsd_aes_gcm_iv_t;
typedef struct sgxsd_curve25519_public_key {
  uint8_t x[32];
} sgxsd_curve25519_public_key_t;
typedef struct sgxsd_aes_gcm_mac {
  uint8_t data[16];
} sgxsd_aes_gcm_mac_t;
typedef struct sgxsd_request_negotiation_response {
  sgxsd_curve25519_public_key_t server_static_pubkey;
  sgxsd_curve25519_public_key_t server_ephemeral_pubkey;
  struct {
    uint8_t data[36];
    sgxsd_aes_gcm_iv_t iv;
    sgxsd_aes_gcm_mac_t mac;
  } encrypted_pending_request_id;
} sgxsd_request_negotiation_response_t;
typedef struct sgxsd_node_init_args {
  uint8_t pending_requests_table_order;
} sgxsd_node_init_args_t;
typedef struct sgxsd_curve25519_public_key {
  uint8_t x[32];
} sgxsd_curve25519_public_key_t;
typedef struct sgxsd_request_negotiation_request {
  sgxsd_curve25519_public_key_t client_pubkey;
} sgxsd_request_negotiation_request_t;
sgx_status_t sgxsd_enclave_node_init(sgx_enclave_id_t eid, sgx_status_t* retval, const sgxsd_node_init_args_t* p_args);
sgx_status_t sgxsd_enclave_get_next_report(sgx_enclave_id_t eid, sgx_status_t* retval, sgx_target_info_t qe_target_info, sgx_report_t* p_report);
sgx_status_t sgxsd_enclave_set_current_quote(sgx_enclave_id_t eid, sgx_status_t* retval);
sgx_status_t sgxsd_enclave_negotiate_request(sgx_enclave_id_t eid, sgx_status_t* retval, const sgxsd_request_negotiation_request_t* p_request, sgxsd_request_negotiation_response_t* p_response);
sgx_status_t sgxsd_enclave_server_start(sgx_enclave_id_t eid, sgx_status_t* retval, const sgxsd_server_init_args_t* p_args, sgxsd_server_state_handle_t state_handle);
sgx_status_t sgxsd_enclave_server_call(sgx_enclave_id_t eid, sgx_status_t* retval, const sgxsd_server_handle_call_args_t* p_args, const sgxsd_msg_header_t* msg_header, uint8_t* msg_data, size_t msg_size, sgxsd_msg_tag_t msg_tag, sgxsd_server_state_handle_t state_handle);
sgx_status_t sgxsd_enclave_server_stop(sgx_enclave_id_t eid, sgx_status_t* retval, const sgxsd_server_terminate_args_t* p_args, sgxsd_server_state_handle_t state_handle);
