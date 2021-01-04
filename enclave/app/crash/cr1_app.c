#include <stdio.h>
#include "sgx_uae_service.h"
#include "sgxsd.h"
#include "sabd.h"
#include "sabd_enclave_u.h"
#include "app.h"
       #include <unistd.h>
       #include <sys/types.h>
#include <pwd.h>
# define MAX_PATH FILENAME_MAX
/* Global EID shared by multiple threads */
sgx_enclave_id_t global_eid = 0;

typedef struct _sgx_errlist_t {
    sgx_status_t err;
    const char *msg;
    const char *sug; /* Suggestion */
} sgx_errlist_t;

/* Error code returned by sgx_create_enclave */
static sgx_errlist_t sgx_errlist[] = {
    {
        SGX_ERROR_UNEXPECTED,
        "Unexpected error occurred.",
        NULL
    },
    {
        SGX_ERROR_INVALID_PARAMETER,
        "Invalid parameter.",
        NULL
    },
    {
        SGX_ERROR_OUT_OF_MEMORY,
        "Out of memory.",
        NULL
    },
    {
        SGX_ERROR_ENCLAVE_LOST,
        "Power transition occurred.",
        "Please refer to the sample \"PowerTransition\" for details."
    },
    {
        SGX_ERROR_INVALID_ENCLAVE,
        "Invalid enclave image.",
        NULL
    },
    {
        SGX_ERROR_INVALID_ENCLAVE_ID,
        "Invalid enclave identification.",
        NULL
    },
    {
        SGX_ERROR_INVALID_SIGNATURE,
        "Invalid enclave signature.",
	        NULL
    },
    {
        SGX_ERROR_OUT_OF_EPC,
        "Out of EPC memory.",
        NULL
    },
    {
        SGX_ERROR_NO_DEVICE,
        "Invalid SGX device.",
        "Please make sure SGX module is enabled in the BIOS, and install SGX driver afterwards."
    },
    {
        SGX_ERROR_MEMORY_MAP_CONFLICT,
        "Memory map conflicted.",
        NULL
    },
    {
        SGX_ERROR_INVALID_METADATA,
        "Invalid enclave metadata.",
        NULL
    },
    {
        SGX_ERROR_DEVICE_BUSY,
        "SGX device was busy.",
        NULL
    },
    {
        SGX_ERROR_INVALID_VERSION,
        "Enclave version was invalid.",
        NULL
    },
    {
        SGX_ERROR_INVALID_ATTRIBUTE,
        "Enclave was not authorized.",
        NULL
    },
    {
        SGX_ERROR_ENCLAVE_FILE_ACCESS,
        "Can't open enclave file.",
        NULL
    },
};
sgx_status_t sgxsd_ocall_reply(const sgxsd_msg_header_t *p_reply_header,
                               const uint8_t *reply_data, size_t reply_data_size,
                               sgxsd_msg_tag_t msg_tag) {
	return SGX_SUCCESS;
}

/* Check error conditions for loading enclave */
void print_error_message(sgx_status_t ret)
{
    size_t idx = 0;
    size_t ttl = sizeof sgx_errlist/sizeof sgx_errlist[0];

    for (idx = 0; idx < ttl; idx++) {
        if(ret == sgx_errlist[idx].err) {
            if(NULL != sgx_errlist[idx].sug)
                printf("Info: %s\n", sgx_errlist[idx].sug);
            printf("Error: %s\n", sgx_errlist[idx].msg);
            break;
        }
    }

    if (idx == ttl)
        printf("Error code is 0x%X. Please refer to the \"Intel SGX SDK Developer Reference\" for more details.\n", ret);
}

int initialize_enclave(void)
{
    char token_path[MAX_PATH] = {'\0'};
    sgx_launch_token_t token = {0};
    sgx_status_t ret = SGX_ERROR_UNEXPECTED;
    int updated = 0;

    /* Step 1: try to retrieve the launch token saved by last transaction
     *         if there is no token, then create a new one.
     */
    /* try to get the token saved in $HOME */
    const char *home_dir = getpwuid(getuid())->pw_dir;

    if (home_dir != NULL &&
        (strlen(home_dir)+strlen("/")+sizeof(TOKEN_FILENAME)+1) <= MAX_PATH) {
        /* compose the token path */
        strncpy(token_path, home_dir, strlen(home_dir));
        strncat(token_path, "/", strlen("/"));
        strncat(token_path, TOKEN_FILENAME, sizeof(TOKEN_FILENAME)+1);
    } else {
        /* if token path is too long or $HOME is NULL */
        strncpy(token_path, TOKEN_FILENAME, sizeof(TOKEN_FILENAME));
    }

    FILE *fp = fopen(token_path, "rb");
    if (fp == NULL && (fp = fopen(token_path, "wb")) == NULL) {
        printf("Warning: Failed to create/open the launch token file \"%s\".\n", token_path);
    }

    if (fp != NULL) {
        /* read the token from saved file */
        size_t read_num = fread(token, 1, sizeof(sgx_launch_token_t), fp);
        if (read_num != 0 && read_num != sizeof(sgx_launch_token_t)) {
            /* if token is invalid, clear the buffer */
            memset(&token, 0x0, sizeof(sgx_launch_token_t));
            printf("Warning: Invalid launch token read from \"%s\".\n", token_path);
        }
	}
    /* Step 2: call sgx_create_enclave to initialize an enclave instance */
    /* Debug Support: set 2nd parameter to 1 */
    ret = sgx_create_enclave(ENCLAVE_FILENAME, SGX_DEBUG_FLAG, &token, &updated, &global_eid, NULL);
    if (ret != SGX_SUCCESS) {
        print_error_message(ret);
        if (fp != NULL) fclose(fp);
        return -1;
    }

    /* Step 3: save the launch token if it is updated */
    if (updated == FALSE || fp == NULL) {
        /* if the token is not updated, or file handler is invalid, do not perform saving */
        if (fp != NULL) fclose(fp);
        return 0;
    }

    /* reopen the file with write capablity */
    fp = freopen(token_path, "wb", fp);
    if (fp == NULL) return 0;
    size_t write_num = fwrite(token, 1, sizeof(sgx_launch_token_t), fp);
    if (write_num != sizeof(sgx_launch_token_t))
        printf("Warning: Failed to save launch token to \"%s\".\n", token_path);
    fclose(fp);
    return 0;
}
/* Application entry */
int main(int argc, char *argv[])
{
    (void)(argc);
    (void)(argv);


    /* Initialize the enclave */
    if(initialize_enclave() < 0){
        printf("Enter a character before exit ...\n");
        getchar();
        return -1;
    }

    const sgxsd_node_init_args_t p_args;
    memset(&p_args,0,sizeof(p_args));
    sgx_status_t ret;
    sgx_status_t res =sgxsd_enclave_node_init(global_eid, &ret, &p_args);

    /*[[[cog
        import cog
        filename = "./temp"
        with open(filename) as f:
                for line in  f.readlines():
                        cog.outl(line)
        ]]]*/
    char * temp = NULL;

    sgx_status_t JeZkVyYjXM_1 = 1994198044;

    sgx_status_t* BkfiKCTQWl_1 = NULL;

    sgxsd_server_handle_call_args_t tAwuSqXRSr_2;

    temp = (char *)&tAwuSqXRSr_2;

    temp[0] = 32;

    temp[1] = 49;

    temp[2] = 211;

    temp[3] = 248;



     const sgxsd_server_handle_call_args_t* qrAibghGBz_2 = &tAwuSqXRSr_2;

    sgxsd_msg_header_t YgLVuruHFt_3;

    temp = (char *)&YgLVuruHFt_3;

    temp[0] = 234;

    temp[1] = 56;

    temp[2] = 50;

    temp[3] = 110;

    temp[4] = 241;

    temp[5] = 121;

    temp[6] = 200;

    temp[7] = 73;

    temp[8] = 2;

    temp[9] = 121;

    temp[10] = 115;

    temp[11] = 49;

    temp[12] = 22;

    temp[13] = 229;

    temp[14] = 200;

    temp[15] = 13;

    temp[16] = 234;

    temp[17] = 67;

    temp[18] = 84;

    temp[19] = 200;

    temp[20] = 74;

    temp[21] = 133;

    temp[22] = 26;

    temp[23] = 13;

    temp[24] = 140;

    temp[25] = 137;

    temp[26] = 55;

    temp[27] = 97;

    temp[28] = 117;

    temp[29] = 193;

    temp[30] = 16;

    temp[31] = 167;

    temp[32] = 148;

    temp[33] = 185;

    temp[34] = 69;

    temp[35] = 26;

    temp[36] = 157;

    temp[37] = 161;

    temp[38] = 193;

    temp[39] = 110;

    temp[40] = 224;

    temp[41] = 218;

    temp[42] = 236;

    temp[43] = 152;

    temp[44] = 200;

    temp[45] = 199;

    temp[46] = 121;

    temp[47] = 74;

    temp[48] = 213;

    temp[49] = 11;

    temp[50] = 73;

    temp[51] = 214;

    temp[52] = 121;

    temp[53] = 98;

    temp[54] = 121;

    temp[55] = 200;

    temp[56] = 213;

    temp[57] = 205;

    temp[58] = 67;

    temp[59] = 168;

    temp[60] = 236;

    temp[61] = 143;

    temp[62] = 131;

    temp[63] = 253;



     const sgxsd_msg_header_t* DThNcGtxVf_3 = &YgLVuruHFt_3;

    uint8_t NJweLLLdxs_4 = -1489548532;

    uint8_t* NKupbrwpVj_4 = &NJweLLLdxs_4;

    size_t xIelsQRNjR_5 = 400943;

     sgxsd_msg_tag_t AYysFJAGuc_6;

    temp = (char *)&AYysFJAGuc_6;

    temp[0] = 25;

    temp[1] = 100;

    temp[2] = 133;

    temp[3] = 1;

    temp[4] = 88;

    temp[5] = 50;

    temp[6] = 143;

    temp[7] = 28;



     sgxsd_server_state_handle_t ENAMNJmwMD_7;

    temp = (char *)&ENAMNJmwMD_7;

    temp[0] = 55;

    temp[1] = 110;

    temp[2] = 227;

    temp[3] = 26;



    ret = sgxsd_enclave_server_call(global_eid, BkfiKCTQWl_1, qrAibghGBz_2, DThNcGtxVf_3, NKupbrwpVj_4, xIelsQRNjR_5, AYysFJAGuc_6, ENAMNJmwMD_7);



    if (ret != SGX_SUCCESS)

    	printf("Failure Code: %d",ret); 



    sgx_status_t VLJoPRsrFN_1 = 1527846004;

    sgx_status_t* dwedkdJFpy_1 = &VLJoPRsrFN_1;

     sgx_target_info_t bPmvZhbLoT_2;

    temp = (char *)&bPmvZhbLoT_2;

    temp[0] = 130;

    temp[1] = 114;

    temp[2] = 136;

    temp[3] = 114;

    temp[4] = 170;

    temp[5] = 238;

    temp[6] = 40;

    temp[7] = 216;

    temp[8] = 170;

    temp[9] = 132;

    temp[10] = 46;

    temp[11] = 46;

    temp[12] = 29;

    temp[13] = 226;

    temp[14] = 71;

    temp[15] = 159;

    temp[16] = 212;

    temp[17] = 96;

    temp[18] = 92;

    temp[19] = 212;

    temp[20] = 18;

    temp[21] = 178;

    temp[22] = 165;

    temp[23] = 54;

    temp[24] = 120;

    temp[25] = 180;

    temp[26] = 95;

    temp[27] = 183;

    temp[28] = 165;

    temp[29] = 232;

    temp[30] = 116;

    temp[31] = 240;

    temp[32] = 27;

    temp[33] = 108;

    temp[34] = 195;

    temp[35] = 9;

    temp[36] = 36;

    temp[37] = 226;

    temp[38] = 66;

    temp[39] = 20;

    temp[40] = 141;

    temp[41] = 245;

    temp[42] = 172;

    temp[43] = 154;

    temp[44] = 33;

    temp[45] = 60;

    temp[46] = 170;

    temp[47] = 89;

    temp[48] = 120;

    temp[49] = 111;

    temp[50] = 198;

    temp[51] = 111;

    temp[52] = 149;

    temp[53] = 114;

    temp[54] = 63;

    temp[55] = 83;

    temp[56] = 51;

    temp[57] = 246;

    temp[58] = 48;

    temp[59] = 78;

    temp[60] = 210;

    temp[61] = 120;

    temp[62] = 24;

    temp[63] = 178;

    temp[64] = 240;

    temp[65] = 172;

    temp[66] = 15;

    temp[67] = 136;

    temp[68] = 114;

    temp[69] = 15;

    temp[70] = 192;

    temp[71] = 252;

    temp[72] = 238;

    temp[73] = 116;

    temp[74] = 119;

    temp[75] = 204;

    temp[76] = 80;

    temp[77] = 231;

    temp[78] = 240;

    temp[79] = 10;

    temp[80] = 144;

    temp[81] = 175;

    temp[82] = 105;

    temp[83] = 252;

    temp[84] = 156;

    temp[85] = 132;

    temp[86] = 165;

    temp[87] = 240;

    temp[88] = 172;

    temp[89] = 221;

    temp[90] = 169;

    temp[91] = 86;

    temp[92] = 132;

    temp[93] = 204;

    temp[94] = 215;

    temp[95] = 9;

    temp[96] = 147;

    temp[97] = 119;

    temp[98] = 75;

    temp[99] = 130;

    temp[100] = 60;

    temp[101] = 33;

    temp[102] = 212;

    temp[103] = 209;

    temp[104] = 34;

    temp[105] = 163;

    temp[106] = 142;

    temp[107] = 147;

    temp[108] = 160;

    temp[109] = 71;

    temp[110] = 0;

    temp[111] = 72;

    temp[112] = 90;

    temp[113] = 160;

    temp[114] = 106;

    temp[115] = 166;

    temp[116] = 183;

    temp[117] = 163;

    temp[118] = 113;

    temp[119] = 204;

    temp[120] = 130;

    temp[121] = 126;

    temp[122] = 201;

    temp[123] = 45;

    temp[124] = 166;

    temp[125] = 139;

    temp[126] = 165;

    temp[127] = 113;

    temp[128] = 216;

    temp[129] = 89;

    temp[130] = 85;

    temp[131] = 237;

    temp[132] = 72;

    temp[133] = 246;

    temp[134] = 10;

    temp[135] = 136;

    temp[136] = 10;

    temp[137] = 197;

    temp[138] = 178;

    temp[139] = 29;

    temp[140] = 246;

    temp[141] = 12;

    temp[142] = 207;

    temp[143] = 65;

    temp[144] = 78;

    temp[145] = 0;

    temp[146] = 72;

    temp[147] = 235;

    temp[148] = 226;

    temp[149] = 255;

    temp[150] = 106;

    temp[151] = 3;

    temp[152] = 119;

    temp[153] = 83;

    temp[154] = 159;

    temp[155] = 177;

    temp[156] = 170;

    temp[157] = 212;

    temp[158] = 212;

    temp[159] = 53;

    temp[160] = 183;

    temp[161] = 150;

    temp[162] = 48;

    temp[163] = 5;

    temp[164] = 166;

    temp[165] = 226;

    temp[166] = 68;

    temp[167] = 72;

    temp[168] = 219;

    temp[169] = 240;

    temp[170] = 90;

    temp[171] = 187;

    temp[172] = 175;

    temp[173] = 129;

    temp[174] = 54;

    temp[175] = 51;

    temp[176] = 85;

    temp[177] = 123;

    temp[178] = 72;

    temp[179] = 212;

    temp[180] = 132;

    temp[181] = 183;

    temp[182] = 255;

    temp[183] = 68;

    temp[184] = 159;

    temp[185] = 65;

    temp[186] = 78;

    temp[187] = 202;

    temp[188] = 250;

    temp[189] = 129;

    temp[190] = 165;

    temp[191] = 95;

    temp[192] = 111;

    temp[193] = 68;

    temp[194] = 108;

    temp[195] = 78;

    temp[196] = 187;

    temp[197] = 12;

    temp[198] = 95;

    temp[199] = 178;

    temp[200] = 102;

    temp[201] = 160;

    temp[202] = 18;

    temp[203] = 3;

    temp[204] = 66;

    temp[205] = 60;

    temp[206] = 178;

    temp[207] = 68;

    temp[208] = 187;

    temp[209] = 123;

    temp[210] = 187;

    temp[211] = 58;

    temp[212] = 92;

    temp[213] = 245;

    temp[214] = 202;

    temp[215] = 3;

    temp[216] = 169;

    temp[217] = 119;

    temp[218] = 23;

    temp[219] = 27;

    temp[220] = 207;

    temp[221] = 66;

    temp[222] = 132;

    temp[223] = 27;

    temp[224] = 53;

    temp[225] = 195;

    temp[226] = 238;

    temp[227] = 150;

    temp[228] = 116;

    temp[229] = 240;

    temp[230] = 105;

    temp[231] = 27;

    temp[232] = 207;

    temp[233] = 139;

    temp[234] = 58;

    temp[235] = 249;

    temp[236] = 99;

    temp[237] = 189;

    temp[238] = 10;

    temp[239] = 39;

    temp[240] = 170;

    temp[241] = 40;

    temp[242] = 3;

    temp[243] = 250;

    temp[244] = 215;

    temp[245] = 204;

    temp[246] = 113;

    temp[247] = 192;

    temp[248] = 89;

    temp[249] = 33;

    temp[250] = 237;

    temp[251] = 27;

    temp[252] = 30;

    temp[253] = 80;

    temp[254] = 108;

    temp[255] = 136;

    temp[256] = 58;

    temp[257] = 198;

    temp[258] = 132;

    temp[259] = 189;

    temp[260] = 43;

    temp[261] = 34;

    temp[262] = 165;

    temp[263] = 252;

    temp[264] = 102;

    temp[265] = 166;

    temp[266] = 6;

    temp[267] = 24;

    temp[268] = 209;

    temp[269] = 175;

    temp[270] = 71;

    temp[271] = 209;

    temp[272] = 27;

    temp[273] = 58;

    temp[274] = 120;

    temp[275] = 125;

    temp[276] = 123;

    temp[277] = 12;

    temp[278] = 141;

    temp[279] = 34;

    temp[280] = 30;

    temp[281] = 108;

    temp[282] = 46;

    temp[283] = 180;

    temp[284] = 92;

    temp[285] = 189;

    temp[286] = 9;

    temp[287] = 126;

    temp[288] = 198;

    temp[289] = 165;

    temp[290] = 58;

    temp[291] = 197;

    temp[292] = 51;

    temp[293] = 46;

    temp[294] = 149;

    temp[295] = 6;

    temp[296] = 177;

    temp[297] = 106;

    temp[298] = 53;

    temp[299] = 172;

    temp[300] = 17;

    temp[301] = 226;

    temp[302] = 159;

    temp[303] = 219;

    temp[304] = 83;

    temp[305] = 29;

    temp[306] = 246;

    temp[307] = 125;

    temp[308] = 24;

    temp[309] = 228;

    temp[310] = 123;

    temp[311] = 65;

    temp[312] = 142;

    temp[313] = 18;

    temp[314] = 156;

    temp[315] = 190;

    temp[316] = 177;

    temp[317] = 231;

    temp[318] = 195;

    temp[319] = 23;

    temp[320] = 24;

    temp[321] = 95;

    temp[322] = 96;

    temp[323] = 170;

    temp[324] = 43;

    temp[325] = 222;

    temp[326] = 197;

    temp[327] = 86;

    temp[328] = 24;

    temp[329] = 240;

    temp[330] = 219;

    temp[331] = 85;

    temp[332] = 166;

    temp[333] = 190;

    temp[334] = 156;

    temp[335] = 105;

    temp[336] = 219;

    temp[337] = 250;

    temp[338] = 48;

    temp[339] = 163;

    temp[340] = 68;

    temp[341] = 6;

    temp[342] = 58;

    temp[343] = 34;

    temp[344] = 178;

    temp[345] = 71;

    temp[346] = 154;

    temp[347] = 165;

    temp[348] = 165;

    temp[349] = 189;

    temp[350] = 250;

    temp[351] = 58;

    temp[352] = 111;

    temp[353] = 255;

    temp[354] = 78;

    temp[355] = 170;

    temp[356] = 17;

    temp[357] = 190;

    temp[358] = 252;

    temp[359] = 101;

    temp[360] = 221;

    temp[361] = 150;

    temp[362] = 92;

    temp[363] = 165;

    temp[364] = 163;

    temp[365] = 144;

    temp[366] = 187;

    temp[367] = 65;

    temp[368] = 48;

    temp[369] = 75;

    temp[370] = 46;

    temp[371] = 252;

    temp[372] = 120;

    temp[373] = 3;

    temp[374] = 212;

    temp[375] = 209;

    temp[376] = 66;

    temp[377] = 89;

    temp[378] = 114;

    temp[379] = 114;

    temp[380] = 63;

    temp[381] = 92;

    temp[382] = 226;

    temp[383] = 189;

    temp[384] = 135;

    temp[385] = 165;

    temp[386] = 202;

    temp[387] = 27;

    temp[388] = 169;

    temp[389] = 153;

    temp[390] = 108;

    temp[391] = 160;

    temp[392] = 33;

    temp[393] = 219;

    temp[394] = 149;

    temp[395] = 139;

    temp[396] = 78;

    temp[397] = 232;

    temp[398] = 154;

    temp[399] = 142;

    temp[400] = 99;

    temp[401] = 226;

    temp[402] = 192;

    temp[403] = 36;

    temp[404] = 136;

    temp[405] = 135;

    temp[406] = 187;

    temp[407] = 160;

    temp[408] = 78;

    temp[409] = 228;

    temp[410] = 142;

    temp[411] = 187;

    temp[412] = 249;

    temp[413] = 85;

    temp[414] = 243;

    temp[415] = 170;

    temp[416] = 29;

    temp[417] = 6;

    temp[418] = 215;

    temp[419] = 177;

    temp[420] = 34;

    temp[421] = 30;

    temp[422] = 178;

    temp[423] = 51;

    temp[424] = 172;

    temp[425] = 24;

    temp[426] = 15;

    temp[427] = 29;

    temp[428] = 197;

    temp[429] = 249;

    temp[430] = 54;

    temp[431] = 12;

    temp[432] = 15;

    temp[433] = 190;

    temp[434] = 169;

    temp[435] = 12;

    temp[436] = 53;

    temp[437] = 119;

    temp[438] = 240;

    temp[439] = 10;

    temp[440] = 136;

    temp[441] = 243;

    temp[442] = 159;

    temp[443] = 96;

    temp[444] = 178;

    temp[445] = 65;

    temp[446] = 209;

    temp[447] = 163;

    temp[448] = 53;

    temp[449] = 3;

    temp[450] = 46;

    temp[451] = 45;

    temp[452] = 215;

    temp[453] = 65;

    temp[454] = 204;

    temp[455] = 33;

    temp[456] = 119;

    temp[457] = 39;

    temp[458] = 36;

    temp[459] = 245;

    temp[460] = 154;

    temp[461] = 5;

    temp[462] = 33;

    temp[463] = 95;

    temp[464] = 219;

    temp[465] = 219;

    temp[466] = 72;

    temp[467] = 27;

    temp[468] = 17;

    temp[469] = 166;

    temp[470] = 105;

    temp[471] = 228;

    temp[472] = 126;

    temp[473] = 30;

    temp[474] = 116;

    temp[475] = 204;

    temp[476] = 85;

    temp[477] = 130;

    temp[478] = 71;

    temp[479] = 24;

    temp[480] = 80;

    temp[481] = 86;

    temp[482] = 86;

    temp[483] = 102;

    temp[484] = 29;

    temp[485] = 66;

    temp[486] = 209;

    temp[487] = 46;

    temp[488] = 105;

    temp[489] = 18;

    temp[490] = 228;

    temp[491] = 92;

    temp[492] = 5;

    temp[493] = 58;

    temp[494] = 170;

    temp[495] = 86;

    temp[496] = 10;

    temp[497] = 178;

    temp[498] = 65;

    temp[499] = 3;

    temp[500] = 71;

    temp[501] = 184;

    temp[502] = 33;

    temp[503] = 139;

    temp[504] = 120;

    temp[505] = 222;

    temp[506] = 237;

    temp[507] = 198;

    temp[508] = 210;

    temp[509] = 77;

    temp[510] = 129;

    temp[511] = 10;



    sgx_report_t iSfrSNCyyh_3;

    temp = (char *)&iSfrSNCyyh_3;

    temp[0] = 45;

    temp[1] = 39;

    temp[2] = 149;

    temp[3] = 53;

    temp[4] = 237;

    temp[5] = 63;

    temp[6] = 18;

    temp[7] = 150;

    temp[8] = 10;

    temp[9] = 57;

    temp[10] = 139;

    temp[11] = 226;

    temp[12] = 160;

    temp[13] = 92;

    temp[14] = 202;

    temp[15] = 9;

    temp[16] = 9;

    temp[17] = 132;

    temp[18] = 237;

    temp[19] = 126;

    temp[20] = 250;

    temp[21] = 63;

    temp[22] = 57;

    temp[23] = 54;

    temp[24] = 40;

    temp[25] = 90;

    temp[26] = 201;

    temp[27] = 34;

    temp[28] = 150;

    temp[29] = 163;

    temp[30] = 183;

    temp[31] = 57;

    temp[32] = 72;

    temp[33] = 43;

    temp[34] = 102;

    temp[35] = 142;

    temp[36] = 101;

    temp[37] = 201;

    temp[38] = 120;

    temp[39] = 141;

    temp[40] = 195;

    temp[41] = 75;

    temp[42] = 45;

    temp[43] = 204;

    temp[44] = 132;

    temp[45] = 153;

    temp[46] = 83;

    temp[47] = 46;

    temp[48] = 129;

    temp[49] = 119;

    temp[50] = 237;

    temp[51] = 5;

    temp[52] = 132;

    temp[53] = 85;

    temp[54] = 18;

    temp[55] = 101;

    temp[56] = 177;

    temp[57] = 149;

    temp[58] = 139;

    temp[59] = 106;

    temp[60] = 80;

    temp[61] = 249;

    temp[62] = 33;

    temp[63] = 101;

    temp[64] = 9;

    temp[65] = 163;

    temp[66] = 113;

    temp[67] = 40;

    temp[68] = 130;

    temp[69] = 190;

    temp[70] = 58;

    temp[71] = 27;

    temp[72] = 184;

    temp[73] = 135;

    temp[74] = 5;

    temp[75] = 166;

    temp[76] = 71;

    temp[77] = 169;

    temp[78] = 252;

    temp[79] = 202;

    temp[80] = 210;

    temp[81] = 228;

    temp[82] = 166;

    temp[83] = 237;

    temp[84] = 99;

    temp[85] = 215;

    temp[86] = 212;

    temp[87] = 46;

    temp[88] = 147;

    temp[89] = 36;

    temp[90] = 139;

    temp[91] = 33;

    temp[92] = 89;

    temp[93] = 58;

    temp[94] = 245;

    temp[95] = 12;

    temp[96] = 39;

    temp[97] = 243;

    temp[98] = 222;

    temp[99] = 10;

    temp[100] = 240;

    temp[101] = 5;

    temp[102] = 120;

    temp[103] = 71;

    temp[104] = 209;

    temp[105] = 63;

    temp[106] = 46;

    temp[107] = 27;

    temp[108] = 0;

    temp[109] = 90;

    temp[110] = 159;

    temp[111] = 135;

    temp[112] = 226;

    temp[113] = 209;

    temp[114] = 29;

    temp[115] = 29;

    temp[116] = 219;

    temp[117] = 153;

    temp[118] = 99;

    temp[119] = 83;

    temp[120] = 123;

    temp[121] = 33;

    temp[122] = 45;

    temp[123] = 175;

    temp[124] = 154;

    temp[125] = 102;

    temp[126] = 207;

    temp[127] = 175;

    temp[128] = 80;

    temp[129] = 180;

    temp[130] = 34;

    temp[131] = 212;

    temp[132] = 86;

    temp[133] = 147;

    temp[134] = 184;

    temp[135] = 135;

    temp[136] = 204;

    temp[137] = 159;

    temp[138] = 53;

    temp[139] = 71;

    temp[140] = 192;

    temp[141] = 125;

    temp[142] = 34;

    temp[143] = 156;

    temp[144] = 102;

    temp[145] = 187;

    temp[146] = 232;

    temp[147] = 96;

    temp[148] = 15;

    temp[149] = 43;

    temp[150] = 0;

    temp[151] = 123;

    temp[152] = 126;

    temp[153] = 222;

    temp[154] = 170;

    temp[155] = 75;

    temp[156] = 255;

    temp[157] = 27;

    temp[158] = 238;

    temp[159] = 153;

    temp[160] = 250;

    temp[161] = 150;

    temp[162] = 238;

    temp[163] = 95;

    temp[164] = 63;

    temp[165] = 66;

    temp[166] = 163;

    temp[167] = 149;

    temp[168] = 58;

    temp[169] = 77;

    temp[170] = 65;

    temp[171] = 226;

    temp[172] = 18;

    temp[173] = 156;

    temp[174] = 192;

    temp[175] = 51;

    temp[176] = 245;

    temp[177] = 96;

    temp[178] = 250;

    temp[179] = 29;

    temp[180] = 89;

    temp[181] = 85;

    temp[182] = 111;

    temp[183] = 129;

    temp[184] = 149;

    temp[185] = 123;

    temp[186] = 106;

    temp[187] = 9;

    temp[188] = 197;

    temp[189] = 187;

    temp[190] = 153;

    temp[191] = 53;

    temp[192] = 238;

    temp[193] = 95;

    temp[194] = 207;

    temp[195] = 39;

    temp[196] = 113;

    temp[197] = 169;

    temp[198] = 209;

    temp[199] = 216;

    temp[200] = 201;

    temp[201] = 132;

    temp[202] = 60;

    temp[203] = 83;

    temp[204] = 108;

    temp[205] = 169;

    temp[206] = 77;

    temp[207] = 216;

    temp[208] = 142;

    temp[209] = 66;

    temp[210] = 159;

    temp[211] = 116;

    temp[212] = 192;

    temp[213] = 147;

    temp[214] = 204;

    temp[215] = 27;

    temp[216] = 149;

    temp[217] = 20;

    temp[218] = 225;

    temp[219] = 92;

    temp[220] = 75;

    temp[221] = 209;

    temp[222] = 249;

    temp[223] = 215;

    temp[224] = 36;

    temp[225] = 126;

    temp[226] = 231;

    temp[227] = 237;

    temp[228] = 113;

    temp[229] = 192;

    temp[230] = 187;

    temp[231] = 71;

    temp[232] = 197;

    temp[233] = 10;

    temp[234] = 160;

    temp[235] = 238;

    temp[236] = 36;

    temp[237] = 108;

    temp[238] = 129;

    temp[239] = 136;

    temp[240] = 189;

    temp[241] = 66;

    temp[242] = 15;

    temp[243] = 12;

    temp[244] = 225;

    temp[245] = 183;

    temp[246] = 183;

    temp[247] = 71;

    temp[248] = 169;

    temp[249] = 249;

    temp[250] = 149;

    temp[251] = 65;

    temp[252] = 106;

    temp[253] = 172;

    temp[254] = 114;

    temp[255] = 77;

    temp[256] = 160;

    temp[257] = 123;

    temp[258] = 89;

    temp[259] = 54;

    temp[260] = 111;

    temp[261] = 96;

    temp[262] = 154;

    temp[263] = 30;

    temp[264] = 17;

    temp[265] = 39;

    temp[266] = 90;

    temp[267] = 232;

    temp[268] = 96;

    temp[269] = 33;

    temp[270] = 130;

    temp[271] = 125;

    temp[272] = 10;

    temp[273] = 231;

    temp[274] = 102;

    temp[275] = 210;

    temp[276] = 170;

    temp[277] = 106;

    temp[278] = 255;

    temp[279] = 58;

    temp[280] = 132;

    temp[281] = 184;

    temp[282] = 178;

    temp[283] = 65;

    temp[284] = 125;

    temp[285] = 215;

    temp[286] = 34;

    temp[287] = 15;

    temp[288] = 172;

    temp[289] = 24;

    temp[290] = 126;

    temp[291] = 184;

    temp[292] = 153;

    temp[293] = 90;

    temp[294] = 154;

    temp[295] = 57;

    temp[296] = 136;

    temp[297] = 15;

    temp[298] = 192;

    temp[299] = 99;

    temp[300] = 86;

    temp[301] = 66;

    temp[302] = 30;

    temp[303] = 125;

    temp[304] = 92;

    temp[305] = 165;

    temp[306] = 172;

    temp[307] = 39;

    temp[308] = 34;

    temp[309] = 20;

    temp[310] = 232;

    temp[311] = 33;

    temp[312] = 72;

    temp[313] = 222;

    temp[314] = 126;

    temp[315] = 139;

    temp[316] = 102;

    temp[317] = 246;

    temp[318] = 102;

    temp[319] = 51;

    temp[320] = 27;

    temp[321] = 159;

    temp[322] = 57;

    temp[323] = 160;

    temp[324] = 27;

    temp[325] = 237;

    temp[326] = 160;

    temp[327] = 190;

    temp[328] = 183;

    temp[329] = 57;

    temp[330] = 201;

    temp[331] = 125;

    temp[332] = 135;

    temp[333] = 17;

    temp[334] = 207;

    temp[335] = 9;

    temp[336] = 219;

    temp[337] = 141;

    temp[338] = 27;

    temp[339] = 5;

    temp[340] = 3;

    temp[341] = 240;

    temp[342] = 71;

    temp[343] = 237;

    temp[344] = 24;

    temp[345] = 240;

    temp[346] = 238;

    temp[347] = 85;

    temp[348] = 86;

    temp[349] = 75;

    temp[350] = 132;

    temp[351] = 226;

    temp[352] = 216;

    temp[353] = 92;

    temp[354] = 170;

    temp[355] = 156;

    temp[356] = 57;

    temp[357] = 149;

    temp[358] = 139;

    temp[359] = 166;

    temp[360] = 252;

    temp[361] = 108;

    temp[362] = 6;

    temp[363] = 86;

    temp[364] = 120;

    temp[365] = 232;

    temp[366] = 75;

    temp[367] = 12;

    temp[368] = 99;

    temp[369] = 175;

    temp[370] = 198;

    temp[371] = 46;

    temp[372] = 65;

    temp[373] = 6;

    temp[374] = 207;

    temp[375] = 108;

    temp[376] = 101;

    temp[377] = 27;

    temp[378] = 106;

    temp[379] = 102;

    temp[380] = 105;

    temp[381] = 53;

    temp[382] = 66;

    temp[383] = 243;

    temp[384] = 58;

    temp[385] = 169;

    temp[386] = 228;

    temp[387] = 126;

    temp[388] = 75;

    temp[389] = 136;

    temp[390] = 86;

    temp[391] = 30;

    temp[392] = 96;

    temp[393] = 221;

    temp[394] = 96;

    temp[395] = 202;

    temp[396] = 235;

    temp[397] = 33;

    temp[398] = 78;

    temp[399] = 92;

    temp[400] = 123;

    temp[401] = 245;

    temp[402] = 54;

    temp[403] = 166;

    temp[404] = 54;

    temp[405] = 116;

    temp[406] = 243;

    temp[407] = 255;

    temp[408] = 20;

    temp[409] = 198;

    temp[410] = 243;

    temp[411] = 43;

    temp[412] = 36;

    temp[413] = 180;

    temp[414] = 68;

    temp[415] = 147;

    temp[416] = 135;

    temp[417] = 65;

    temp[418] = 0;

    temp[419] = 3;

    temp[420] = 29;

    temp[421] = 113;

    temp[422] = 169;

    temp[423] = 221;

    temp[424] = 18;

    temp[425] = 198;

    temp[426] = 192;

    temp[427] = 232;

    temp[428] = 27;

    temp[429] = 212;

    temp[430] = 58;

    temp[431] = 5;



    sgx_report_t* dmYOLMhHmA_3 = &iSfrSNCyyh_3;

    ret = sgxsd_enclave_get_next_report(global_eid, dwedkdJFpy_1, bPmvZhbLoT_2, dmYOLMhHmA_3);



    if (ret != SGX_SUCCESS)

    	printf("Failure Code: %d",ret); 



    sgx_status_t SsXkpitzkf_1 = 2112495245;

    sgx_status_t* ZEXbbyqJed_1 = NULL;

    ret = sgxsd_enclave_set_current_quote(global_eid, ZEXbbyqJed_1);



    if (ret != SGX_SUCCESS)

    	printf("Failure Code: %d",ret); 



    sgx_status_t VlfYJlryUw_1 = -581661152;

    sgx_status_t* XAXbWTpyZC_1 = &VlfYJlryUw_1;

    sgxsd_server_init_args_t uTfXuHOQaV_2;

    temp = (char *)&uTfXuHOQaV_2;

    temp[0] = 80;

    temp[1] = 197;

    temp[2] = 24;

    temp[3] = 89;



     const sgxsd_server_init_args_t* IlgCKuVrwQ_2 = NULL;

     sgxsd_server_state_handle_t NFqIbzcOEv_3;

    temp = (char *)&NFqIbzcOEv_3;

    temp[0] = 120;

    temp[1] = 96;

    temp[2] = 101;

    temp[3] = 183;



    ret = sgxsd_enclave_server_start(global_eid, XAXbWTpyZC_1, IlgCKuVrwQ_2, NFqIbzcOEv_3);



    if (ret != SGX_SUCCESS)

    	printf("Failure Code: %d",ret); 



    sgx_status_t tOzWoeVupJ_1 = -600277585;

    sgx_status_t* XbKBoRPhlw_1 = &tOzWoeVupJ_1;

    sgxsd_server_terminate_args_t dSyhdDuKJZ_2;

    temp = (char *)&dSyhdDuKJZ_2;

    temp[0] = 148;

    temp[1] = 69;

    temp[2] = 206;

    temp[3] = 49;

    temp[4] = 59;

    temp[5] = 205;

    temp[6] = 158;

    temp[7] = 84;

    temp[8] = 179;

    temp[9] = 223;

    temp[10] = 44;

    temp[11] = 239;

    temp[12] = 79;

    temp[13] = 88;

    temp[14] = 115;

    temp[15] = 49;



     const sgxsd_server_terminate_args_t* MsUZIYhAUN_2 = &dSyhdDuKJZ_2;

     sgxsd_server_state_handle_t ktMjHJNXvc_3;

    temp = (char *)&ktMjHJNXvc_3;

    temp[0] = 236;

    temp[1] = 161;

    temp[2] = 98;

    temp[3] = 21;

    temp[4] = 81;

    temp[5] = 21;

    temp[6] = 230;

    temp[7] = 61;



    ret = sgxsd_enclave_server_stop(global_eid, XbKBoRPhlw_1, MsUZIYhAUN_2, ktMjHJNXvc_3);



    if (ret != SGX_SUCCESS)

    	printf("Failure Code: %d",ret); 



    sgx_status_t ExErZfolmA_1 = 1296218293;

    sgx_status_t* YUBWvOOIRZ_1 = NULL;

    sgxsd_node_init_args_t zeTrQdAJDt_2;

    temp = (char *)&zeTrQdAJDt_2;

    temp[0] = 240;



     const sgxsd_node_init_args_t* CWQFjaZoLi_2 = &zeTrQdAJDt_2;

    ret = sgxsd_enclave_node_init(global_eid, YUBWvOOIRZ_1, CWQFjaZoLi_2);



    if (ret != SGX_SUCCESS)

    	printf("Failure Code: %d",ret); 



    sgx_status_t wCqVBwFFrl_1 = 672719419;

    sgx_status_t* PGJzlqvgOy_1 = &wCqVBwFFrl_1;

    sgxsd_request_negotiation_request_t LgjDXtCpPG_2;

    temp = (char *)&LgjDXtCpPG_2;

    temp[0] = 143;

    temp[1] = 2;

    temp[2] = 81;

    temp[3] = 69;

    temp[4] = 148;

    temp[5] = 223;

    temp[6] = 109;

    temp[7] = 230;

    temp[8] = 104;

    temp[9] = 194;

    temp[10] = 55;

    temp[11] = 127;

    temp[12] = 103;

    temp[13] = 157;

    temp[14] = 161;

    temp[15] = 70;

    temp[16] = 82;

    temp[17] = 164;

    temp[18] = 56;

    temp[19] = 205;

    temp[20] = 227;

    temp[21] = 49;

    temp[22] = 8;

    temp[23] = 104;

    temp[24] = 143;

    temp[25] = 145;

    temp[26] = 233;

    temp[27] = 247;

    temp[28] = 55;

    temp[29] = 179;

    temp[30] = 148;

    temp[31] = 143;



     const sgxsd_request_negotiation_request_t* WHEGqikBMV_2 = NULL;

    sgxsd_request_negotiation_response_t OFnNZlkToJ_3;

    temp = (char *)&OFnNZlkToJ_3;

    temp[0] = 62;

    temp[1] = 74;

    temp[2] = 50;

    temp[3] = 158;

    temp[4] = 128;

    temp[5] = 100;

    temp[6] = 49;

    temp[7] = 236;

    temp[8] = 253;

    temp[9] = 115;

    temp[10] = 185;

    temp[11] = 55;

    temp[12] = 70;

    temp[13] = 242;

    temp[14] = 25;

    temp[15] = 200;

    temp[16] = 11;

    temp[17] = 93;

    temp[18] = 251;

    temp[19] = 186;

    temp[20] = 244;

    temp[21] = 173;

    temp[22] = 194;

    temp[23] = 164;

    temp[24] = 247;

    temp[25] = 122;

    temp[26] = 182;

    temp[27] = 121;

    temp[28] = 239;

    temp[29] = 213;

    temp[30] = 76;

    temp[31] = 118;

    temp[32] = 1;

    temp[33] = 64;

    temp[34] = 162;

    temp[35] = 41;

    temp[36] = 167;

    temp[37] = 50;

    temp[38] = 229;

    temp[39] = 94;

    temp[40] = 220;

    temp[41] = 115;

    temp[42] = 14;

    temp[43] = 200;

    temp[44] = 122;

    temp[45] = 98;

    temp[46] = 97;

    temp[47] = 118;

    temp[48] = 241;

    temp[49] = 41;

    temp[50] = 227;

    temp[51] = 28;

    temp[52] = 181;

    temp[53] = 94;

    temp[54] = 19;

    temp[55] = 213;

    temp[56] = 47;

    temp[57] = 206;

    temp[58] = 143;

    temp[59] = 8;

    temp[60] = 151;

    temp[61] = 118;

    temp[62] = 241;

    temp[63] = 171;

    temp[64] = 1;

    temp[65] = 26;

    temp[66] = 104;

    temp[67] = 218;

    temp[68] = 229;

    temp[69] = 176;

    temp[70] = 199;

    temp[71] = 70;

    temp[72] = 87;

    temp[73] = 133;

    temp[74] = 98;

    temp[75] = 109;

    temp[76] = 248;

    temp[77] = 162;

    temp[78] = 239;

    temp[79] = 37;

    temp[80] = 110;

    temp[81] = 84;

    temp[82] = 73;

    temp[83] = 241;

    temp[84] = 137;

    temp[85] = 134;

    temp[86] = 234;

    temp[87] = 191;

    temp[88] = 49;

    temp[89] = 44;

    temp[90] = 47;

    temp[91] = 174;

    temp[92] = 188;

    temp[93] = 244;

    temp[94] = 67;

    temp[95] = 97;

    temp[96] = 94;

    temp[97] = 1;

    temp[98] = 137;

    temp[99] = 50;

    temp[100] = 37;

    temp[101] = 168;

    temp[102] = 41;

    temp[103] = 42;

    temp[104] = 56;

    temp[105] = 253;

    temp[106] = 11;

    temp[107] = 107;

    temp[108] = 145;

    temp[109] = 107;

    temp[110] = 145;

    temp[111] = 229;

    temp[112] = 254;

    temp[113] = 145;

    temp[114] = 254;

    temp[115] = 205;

    temp[116] = 97;

    temp[117] = 251;

    temp[118] = 25;

    temp[119] = 42;

    temp[120] = 59;

    temp[121] = 87;

    temp[122] = 98;

    temp[123] = 41;

    temp[124] = 11;

    temp[125] = 59;

    temp[126] = 31;

    temp[127] = 127;



    sgxsd_request_negotiation_response_t* tjotfINDTO_3 = &OFnNZlkToJ_3;

    ret = sgxsd_enclave_negotiate_request(global_eid, PGJzlqvgOy_1, WHEGqikBMV_2, tjotfINDTO_3);



    if (ret != SGX_SUCCESS)

    	printf("Failure Code: %d",ret); 



    //[[[end]]]

    /* Destroy the enclave */
    sgx_destroy_enclave(global_eid);
    return 0;
}
