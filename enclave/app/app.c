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

    sgx_status_t XNnTRbNhJx_1 = 1818259293;

    sgx_status_t* mVUAwMvatr_1 = &XNnTRbNhJx_1;

     sgx_target_info_t TXizPaVprE_2;

    temp = (char *)&TXizPaVprE_2;

    temp[0] = 72;

    temp[1] = 3;

    temp[2] = 144;

    temp[3] = 132;

    temp[4] = 48;

    temp[5] = 40;

    temp[6] = 12;

    temp[7] = 12;

    temp[8] = 33;

    temp[9] = 12;

    temp[10] = 10;

    temp[11] = 17;

    temp[12] = 5;

    temp[13] = 0;

    temp[14] = 48;

    temp[15] = 130;

    temp[16] = 40;

    temp[17] = 129;

    temp[18] = 20;

    temp[19] = 34;

    temp[20] = 20;

    temp[21] = 144;

    temp[22] = 17;

    temp[23] = 34;

    temp[24] = 129;

    temp[25] = 20;

    temp[26] = 20;

    temp[27] = 66;

    temp[28] = 65;

    temp[29] = 144;

    temp[30] = 17;

    temp[31] = 65;

    temp[32] = 17;

    temp[33] = 9;

    temp[34] = 144;

    temp[35] = 65;

    temp[36] = 5;

    temp[37] = 6;

    temp[38] = 0;

    temp[39] = 34;

    temp[40] = 34;

    temp[41] = 0;

    temp[42] = 18;

    temp[43] = 0;

    temp[44] = 130;

    temp[45] = 20;

    temp[46] = 0;

    temp[47] = 10;

    temp[48] = 17;

    temp[49] = 160;

    temp[50] = 0;

    temp[51] = 66;

    temp[52] = 136;

    temp[53] = 144;

    temp[54] = 18;

    temp[55] = 24;

    temp[56] = 160;

    temp[57] = 17;

    temp[58] = 68;

    temp[59] = 129;

    temp[60] = 0;

    temp[61] = 80;

    temp[62] = 3;

    temp[63] = 132;

    temp[64] = 65;

    temp[65] = 6;

    temp[66] = 132;

    temp[67] = 130;

    temp[68] = 0;

    temp[69] = 144;

    temp[70] = 136;

    temp[71] = 34;

    temp[72] = 9;

    temp[73] = 10;

    temp[74] = 96;

    temp[75] = 132;

    temp[76] = 66;

    temp[77] = 130;

    temp[78] = 20;

    temp[79] = 130;

    temp[80] = 80;

    temp[81] = 6;

    temp[82] = 132;

    temp[83] = 0;

    temp[84] = 34;

    temp[85] = 132;

    temp[86] = 9;

    temp[87] = 17;

    temp[88] = 20;

    temp[89] = 160;

    temp[90] = 36;

    temp[91] = 12;

    temp[92] = 34;

    temp[93] = 0;

    temp[94] = 132;

    temp[95] = 48;

    temp[96] = 36;

    temp[97] = 17;

    temp[98] = 80;

    temp[99] = 17;

    temp[100] = 24;

    temp[101] = 5;

    temp[102] = 48;

    temp[103] = 0;

    temp[104] = 6;

    temp[105] = 6;

    temp[106] = 72;

    temp[107] = 18;

    temp[108] = 20;

    temp[109] = 24;

    temp[110] = 40;

    temp[111] = 0;

    temp[112] = 48;

    temp[113] = 0;

    temp[114] = 12;

    temp[115] = 160;

    temp[116] = 72;

    temp[117] = 18;

    temp[118] = 24;

    temp[119] = 96;

    temp[120] = 5;

    temp[121] = 40;

    temp[122] = 0;

    temp[123] = 66;

    temp[124] = 17;

    temp[125] = 0;

    temp[126] = 160;

    temp[127] = 0;

    temp[128] = 130;

    temp[129] = 136;

    temp[130] = 144;

    temp[131] = 6;

    temp[132] = 20;

    temp[133] = 40;

    temp[134] = 66;

    temp[135] = 96;

    temp[136] = 12;

    temp[137] = 0;

    temp[138] = 192;

    temp[139] = 24;

    temp[140] = 132;

    temp[141] = 0;

    temp[142] = 0;

    temp[143] = 129;

    temp[144] = 0;

    temp[145] = 33;

    temp[146] = 18;

    temp[147] = 12;

    temp[148] = 0;

    temp[149] = 192;

    temp[150] = 129;

    temp[151] = 136;

    temp[152] = 136;

    temp[153] = 132;

    temp[154] = 0;

    temp[155] = 24;

    temp[156] = 0;

    temp[157] = 20;

    temp[158] = 17;

    temp[159] = 36;

    temp[160] = 130;

    temp[161] = 9;

    temp[162] = 192;

    temp[163] = 6;

    temp[164] = 136;

    temp[165] = 160;

    temp[166] = 3;

    temp[167] = 9;

    temp[168] = 192;

    temp[169] = 24;

    temp[170] = 160;

    temp[171] = 20;

    temp[172] = 0;

    temp[173] = 129;

    temp[174] = 68;

    temp[175] = 33;

    temp[176] = 10;

    temp[177] = 5;

    temp[178] = 40;

    temp[179] = 136;

    temp[180] = 12;

    temp[181] = 132;

    temp[182] = 72;

    temp[183] = 80;

    temp[184] = 160;

    temp[185] = 66;

    temp[186] = 136;

    temp[187] = 10;

    temp[188] = 48;

    temp[189] = 160;

    temp[190] = 129;

    temp[191] = 34;

    temp[192] = 144;

    temp[193] = 34;

    temp[194] = 24;

    temp[195] = 68;

    temp[196] = 132;

    temp[197] = 9;

    temp[198] = 192;

    temp[199] = 132;

    temp[200] = 12;

    temp[201] = 12;

    temp[202] = 192;

    temp[203] = 18;

    temp[204] = 3;

    temp[205] = 0;

    temp[206] = 130;

    temp[207] = 130;

    temp[208] = 6;

    temp[209] = 0;

    temp[210] = 136;

    temp[211] = 0;

    temp[212] = 36;

    temp[213] = 160;

    temp[214] = 33;

    temp[215] = 192;

    temp[216] = 132;

    temp[217] = 80;

    temp[218] = 34;

    temp[219] = 0;

    temp[220] = 6;

    temp[221] = 80;

    temp[222] = 65;

    temp[223] = 17;

    temp[224] = 136;

    temp[225] = 0;

    temp[226] = 136;

    temp[227] = 40;

    temp[228] = 6;

    temp[229] = 132;

    temp[230] = 0;

    temp[231] = 96;

    temp[232] = 36;

    temp[233] = 17;

    temp[234] = 0;

    temp[235] = 96;

    temp[236] = 65;

    temp[237] = 130;

    temp[238] = 20;

    temp[239] = 0;

    temp[240] = 132;

    temp[241] = 33;

    temp[242] = 18;

    temp[243] = 20;

    temp[244] = 12;

    temp[245] = 3;

    temp[246] = 192;

    temp[247] = 68;

    temp[248] = 0;

    temp[249] = 80;

    temp[250] = 0;

    temp[251] = 130;

    temp[252] = 129;

    temp[253] = 0;

    temp[254] = 0;

    temp[255] = 6;

    temp[256] = 0;

    temp[257] = 18;

    temp[258] = 10;

    temp[259] = 129;

    temp[260] = 12;

    temp[261] = 132;

    temp[262] = 160;

    temp[263] = 0;

    temp[264] = 136;

    temp[265] = 0;

    temp[266] = 192;

    temp[267] = 66;

    temp[268] = 0;

    temp[269] = 132;

    temp[270] = 144;

    temp[271] = 0;

    temp[272] = 130;

    temp[273] = 72;

    temp[274] = 18;

    temp[275] = 96;

    temp[276] = 68;

    temp[277] = 6;

    temp[278] = 6;

    temp[279] = 5;

    temp[280] = 65;

    temp[281] = 68;

    temp[282] = 3;

    temp[283] = 129;

    temp[284] = 192;

    temp[285] = 96;

    temp[286] = 33;

    temp[287] = 20;

    temp[288] = 160;

    temp[289] = 17;

    temp[290] = 33;

    temp[291] = 132;

    temp[292] = 132;

    temp[293] = 0;

    temp[294] = 136;

    temp[295] = 72;

    temp[296] = 129;

    temp[297] = 192;

    temp[298] = 36;

    temp[299] = 132;

    temp[300] = 160;

    temp[301] = 36;

    temp[302] = 160;

    temp[303] = 72;

    temp[304] = 144;

    temp[305] = 0;

    temp[306] = 132;

    temp[307] = 72;

    temp[308] = 0;

    temp[309] = 3;

    temp[310] = 0;

    temp[311] = 96;

    temp[312] = 10;

    temp[313] = 132;

    temp[314] = 3;

    temp[315] = 36;

    temp[316] = 96;

    temp[317] = 96;

    temp[318] = 34;

    temp[319] = 6;

    temp[320] = 20;

    temp[321] = 80;

    temp[322] = 5;

    temp[323] = 96;

    temp[324] = 48;

    temp[325] = 9;

    temp[326] = 10;

    temp[327] = 40;

    temp[328] = 40;

    temp[329] = 48;

    temp[330] = 80;

    temp[331] = 66;

    temp[332] = 18;

    temp[333] = 130;

    temp[334] = 65;

    temp[335] = 136;

    temp[336] = 24;

    temp[337] = 34;

    temp[338] = 17;

    temp[339] = 0;

    temp[340] = 34;

    temp[341] = 10;

    temp[342] = 10;

    temp[343] = 18;

    temp[344] = 80;

    temp[345] = 6;

    temp[346] = 36;

    temp[347] = 144;

    temp[348] = 65;

    temp[349] = 24;

    temp[350] = 0;

    temp[351] = 6;

    temp[352] = 34;

    temp[353] = 24;

    temp[354] = 0;

    temp[355] = 192;

    temp[356] = 20;

    temp[357] = 96;

    temp[358] = 68;

    temp[359] = 3;

    temp[360] = 9;

    temp[361] = 192;

    temp[362] = 96;

    temp[363] = 65;

    temp[364] = 0;

    temp[365] = 65;

    temp[366] = 129;

    temp[367] = 72;

    temp[368] = 18;

    temp[369] = 0;

    temp[370] = 24;

    temp[371] = 20;

    temp[372] = 17;

    temp[373] = 24;

    temp[374] = 5;

    temp[375] = 192;

    temp[376] = 129;

    temp[377] = 66;

    temp[378] = 136;

    temp[379] = 9;

    temp[380] = 136;

    temp[381] = 80;

    temp[382] = 129;

    temp[383] = 10;

    temp[384] = 66;

    temp[385] = 9;

    temp[386] = 17;

    temp[387] = 40;

    temp[388] = 34;

    temp[389] = 80;

    temp[390] = 192;

    temp[391] = 160;

    temp[392] = 192;

    temp[393] = 130;

    temp[394] = 65;

    temp[395] = 40;

    temp[396] = 20;

    temp[397] = 132;

    temp[398] = 72;

    temp[399] = 0;

    temp[400] = 80;

    temp[401] = 0;

    temp[402] = 10;

    temp[403] = 132;

    temp[404] = 68;

    temp[405] = 96;

    temp[406] = 36;

    temp[407] = 0;

    temp[408] = 3;

    temp[409] = 10;

    temp[410] = 136;

    temp[411] = 0;

    temp[412] = 10;

    temp[413] = 144;

    temp[414] = 20;

    temp[415] = 0;

    temp[416] = 66;

    temp[417] = 33;

    temp[418] = 48;

    temp[419] = 40;

    temp[420] = 20;

    temp[421] = 18;

    temp[422] = 34;

    temp[423] = 96;

    temp[424] = 48;

    temp[425] = 3;

    temp[426] = 48;

    temp[427] = 80;

    temp[428] = 24;

    temp[429] = 0;

    temp[430] = 36;

    temp[431] = 20;

    temp[432] = 192;

    temp[433] = 3;

    temp[434] = 192;

    temp[435] = 68;

    temp[436] = 136;

    temp[437] = 0;

    temp[438] = 48;

    temp[439] = 40;

    temp[440] = 3;

    temp[441] = 24;

    temp[442] = 65;

    temp[443] = 80;

    temp[444] = 33;

    temp[445] = 80;

    temp[446] = 129;

    temp[447] = 0;

    temp[448] = 12;

    temp[449] = 96;

    temp[450] = 20;

    temp[451] = 65;

    temp[452] = 6;

    temp[453] = 17;

    temp[454] = 18;

    temp[455] = 36;

    temp[456] = 132;

    temp[457] = 96;

    temp[458] = 24;

    temp[459] = 48;

    temp[460] = 9;

    temp[461] = 34;

    temp[462] = 160;

    temp[463] = 0;

    temp[464] = 0;

    temp[465] = 0;

    temp[466] = 12;

    temp[467] = 48;

    temp[468] = 80;

    temp[469] = 10;

    temp[470] = 40;

    temp[471] = 72;

    temp[472] = 6;

    temp[473] = 6;

    temp[474] = 129;

    temp[475] = 18;

    temp[476] = 36;

    temp[477] = 0;

    temp[478] = 66;

    temp[479] = 65;

    temp[480] = 0;

    temp[481] = 10;

    temp[482] = 192;

    temp[483] = 0;

    temp[484] = 66;

    temp[485] = 3;

    temp[486] = 192;

    temp[487] = 66;

    temp[488] = 130;

    temp[489] = 66;

    temp[490] = 0;

    temp[491] = 129;

    temp[492] = 20;

    temp[493] = 80;

    temp[494] = 40;

    temp[495] = 3;

    temp[496] = 132;

    temp[497] = 40;

    temp[498] = 33;

    temp[499] = 132;

    temp[500] = 48;

    temp[501] = 40;

    temp[502] = 6;

    temp[503] = 0;

    temp[504] = 6;

    temp[505] = 36;

    temp[506] = 10;

    temp[507] = 18;

    temp[508] = 3;

    temp[509] = 0;

    temp[510] = 48;

    temp[511] = 48;



    sgx_report_t tvjJOdYOwI_3;

    temp = (char *)&tvjJOdYOwI_3;

    temp[0] = 40;

    temp[1] = 0;

    temp[2] = 3;

    temp[3] = 96;

    temp[4] = 129;

    temp[5] = 18;

    temp[6] = 144;

    temp[7] = 17;

    temp[8] = 17;

    temp[9] = 0;

    temp[10] = 130;

    temp[11] = 66;

    temp[12] = 33;

    temp[13] = 40;

    temp[14] = 130;

    temp[15] = 48;

    temp[16] = 130;

    temp[17] = 34;

    temp[18] = 96;

    temp[19] = 0;

    temp[20] = 68;

    temp[21] = 17;

    temp[22] = 66;

    temp[23] = 10;

    temp[24] = 17;

    temp[25] = 33;

    temp[26] = 5;

    temp[27] = 144;

    temp[28] = 36;

    temp[29] = 48;

    temp[30] = 144;

    temp[31] = 18;

    temp[32] = 0;

    temp[33] = 12;

    temp[34] = 34;

    temp[35] = 72;

    temp[36] = 0;

    temp[37] = 36;

    temp[38] = 6;

    temp[39] = 192;

    temp[40] = 129;

    temp[41] = 96;

    temp[42] = 130;

    temp[43] = 9;

    temp[44] = 17;

    temp[45] = 96;

    temp[46] = 160;

    temp[47] = 136;

    temp[48] = 144;

    temp[49] = 136;

    temp[50] = 24;

    temp[51] = 12;

    temp[52] = 65;

    temp[53] = 18;

    temp[54] = 12;

    temp[55] = 192;

    temp[56] = 33;

    temp[57] = 0;

    temp[58] = 0;

    temp[59] = 80;

    temp[60] = 68;

    temp[61] = 17;

    temp[62] = 5;

    temp[63] = 36;

    temp[64] = 136;

    temp[65] = 0;

    temp[66] = 18;

    temp[67] = 17;

    temp[68] = 129;

    temp[69] = 144;

    temp[70] = 3;

    temp[71] = 48;

    temp[72] = 192;

    temp[73] = 6;

    temp[74] = 132;

    temp[75] = 10;

    temp[76] = 144;

    temp[77] = 40;

    temp[78] = 0;

    temp[79] = 129;

    temp[80] = 160;

    temp[81] = 20;

    temp[82] = 96;

    temp[83] = 5;

    temp[84] = 0;

    temp[85] = 10;

    temp[86] = 34;

    temp[87] = 5;

    temp[88] = 17;

    temp[89] = 12;

    temp[90] = 80;

    temp[91] = 68;

    temp[92] = 0;

    temp[93] = 132;

    temp[94] = 33;

    temp[95] = 40;

    temp[96] = 18;

    temp[97] = 36;

    temp[98] = 18;

    temp[99] = 72;

    temp[100] = 0;

    temp[101] = 0;

    temp[102] = 6;

    temp[103] = 18;

    temp[104] = 192;

    temp[105] = 33;

    temp[106] = 132;

    temp[107] = 80;

    temp[108] = 9;

    temp[109] = 24;

    temp[110] = 48;

    temp[111] = 0;

    temp[112] = 0;

    temp[113] = 0;

    temp[114] = 130;

    temp[115] = 136;

    temp[116] = 0;

    temp[117] = 34;

    temp[118] = 9;

    temp[119] = 144;

    temp[120] = 160;

    temp[121] = 192;

    temp[122] = 192;

    temp[123] = 65;

    temp[124] = 34;

    temp[125] = 0;

    temp[126] = 0;

    temp[127] = 12;

    temp[128] = 24;

    temp[129] = 0;

    temp[130] = 80;

    temp[131] = 20;

    temp[132] = 40;

    temp[133] = 9;

    temp[134] = 129;

    temp[135] = 0;

    temp[136] = 96;

    temp[137] = 40;

    temp[138] = 0;

    temp[139] = 5;

    temp[140] = 34;

    temp[141] = 0;

    temp[142] = 33;

    temp[143] = 12;

    temp[144] = 132;

    temp[145] = 144;

    temp[146] = 0;

    temp[147] = 40;

    temp[148] = 130;

    temp[149] = 144;

    temp[150] = 10;

    temp[151] = 18;

    temp[152] = 0;

    temp[153] = 72;

    temp[154] = 0;

    temp[155] = 72;

    temp[156] = 36;

    temp[157] = 5;

    temp[158] = 0;

    temp[159] = 130;

    temp[160] = 0;

    temp[161] = 0;

    temp[162] = 10;

    temp[163] = 0;

    temp[164] = 129;

    temp[165] = 144;

    temp[166] = 160;

    temp[167] = 12;

    temp[168] = 10;

    temp[169] = 33;

    temp[170] = 24;

    temp[171] = 160;

    temp[172] = 10;

    temp[173] = 144;

    temp[174] = 0;

    temp[175] = 132;

    temp[176] = 36;

    temp[177] = 33;

    temp[178] = 72;

    temp[179] = 5;

    temp[180] = 65;

    temp[181] = 5;

    temp[182] = 130;

    temp[183] = 34;

    temp[184] = 34;

    temp[185] = 33;

    temp[186] = 96;

    temp[187] = 34;

    temp[188] = 5;

    temp[189] = 65;

    temp[190] = 0;

    temp[191] = 12;

    temp[192] = 40;

    temp[193] = 17;

    temp[194] = 3;

    temp[195] = 130;

    temp[196] = 0;

    temp[197] = 0;

    temp[198] = 80;

    temp[199] = 72;

    temp[200] = 72;

    temp[201] = 48;

    temp[202] = 132;

    temp[203] = 10;

    temp[204] = 3;

    temp[205] = 6;

    temp[206] = 6;

    temp[207] = 20;

    temp[208] = 0;

    temp[209] = 17;

    temp[210] = 18;

    temp[211] = 48;

    temp[212] = 80;

    temp[213] = 18;

    temp[214] = 48;

    temp[215] = 136;

    temp[216] = 66;

    temp[217] = 3;

    temp[218] = 96;

    temp[219] = 24;

    temp[220] = 0;

    temp[221] = 130;

    temp[222] = 160;

    temp[223] = 65;

    temp[224] = 129;

    temp[225] = 68;

    temp[226] = 68;

    temp[227] = 34;

    temp[228] = 96;

    temp[229] = 0;

    temp[230] = 0;

    temp[231] = 160;

    temp[232] = 132;

    temp[233] = 9;

    temp[234] = 48;

    temp[235] = 20;

    temp[236] = 48;

    temp[237] = 3;

    temp[238] = 0;

    temp[239] = 80;

    temp[240] = 9;

    temp[241] = 12;

    temp[242] = 72;

    temp[243] = 5;

    temp[244] = 48;

    temp[245] = 0;

    temp[246] = 6;

    temp[247] = 96;

    temp[248] = 6;

    temp[249] = 48;

    temp[250] = 96;

    temp[251] = 18;

    temp[252] = 12;

    temp[253] = 20;

    temp[254] = 3;

    temp[255] = 24;

    temp[256] = 10;

    temp[257] = 36;

    temp[258] = 5;

    temp[259] = 3;

    temp[260] = 160;

    temp[261] = 0;

    temp[262] = 65;

    temp[263] = 10;

    temp[264] = 33;

    temp[265] = 65;

    temp[266] = 36;

    temp[267] = 68;

    temp[268] = 24;

    temp[269] = 0;

    temp[270] = 0;

    temp[271] = 6;

    temp[272] = 0;

    temp[273] = 0;

    temp[274] = 5;

    temp[275] = 3;

    temp[276] = 68;

    temp[277] = 80;

    temp[278] = 68;

    temp[279] = 20;

    temp[280] = 12;

    temp[281] = 68;

    temp[282] = 136;

    temp[283] = 12;

    temp[284] = 48;

    temp[285] = 12;

    temp[286] = 132;

    temp[287] = 36;

    temp[288] = 130;

    temp[289] = 144;

    temp[290] = 80;

    temp[291] = 48;

    temp[292] = 130;

    temp[293] = 20;

    temp[294] = 9;

    temp[295] = 36;

    temp[296] = 0;

    temp[297] = 12;

    temp[298] = 18;

    temp[299] = 18;

    temp[300] = 33;

    temp[301] = 130;

    temp[302] = 34;

    temp[303] = 80;

    temp[304] = 18;

    temp[305] = 10;

    temp[306] = 12;

    temp[307] = 12;

    temp[308] = 3;

    temp[309] = 0;

    temp[310] = 24;

    temp[311] = 40;

    temp[312] = 3;

    temp[313] = 33;

    temp[314] = 144;

    temp[315] = 65;

    temp[316] = 18;

    temp[317] = 144;

    temp[318] = 0;

    temp[319] = 3;

    temp[320] = 36;

    temp[321] = 0;

    temp[322] = 3;

    temp[323] = 72;

    temp[324] = 129;

    temp[325] = 12;

    temp[326] = 66;

    temp[327] = 136;

    temp[328] = 6;

    temp[329] = 66;

    temp[330] = 20;

    temp[331] = 33;

    temp[332] = 144;

    temp[333] = 10;

    temp[334] = 80;

    temp[335] = 24;

    temp[336] = 66;

    temp[337] = 0;

    temp[338] = 68;

    temp[339] = 144;

    temp[340] = 10;

    temp[341] = 80;

    temp[342] = 192;

    temp[343] = 36;

    temp[344] = 130;

    temp[345] = 68;

    temp[346] = 132;

    temp[347] = 12;

    temp[348] = 65;

    temp[349] = 96;

    temp[350] = 9;

    temp[351] = 18;

    temp[352] = 17;

    temp[353] = 66;

    temp[354] = 34;

    temp[355] = 144;

    temp[356] = 10;

    temp[357] = 192;

    temp[358] = 3;

    temp[359] = 9;

    temp[360] = 130;

    temp[361] = 18;

    temp[362] = 3;

    temp[363] = 130;

    temp[364] = 160;

    temp[365] = 192;

    temp[366] = 9;

    temp[367] = 48;

    temp[368] = 18;

    temp[369] = 96;

    temp[370] = 0;

    temp[371] = 192;

    temp[372] = 24;

    temp[373] = 0;

    temp[374] = 68;

    temp[375] = 65;

    temp[376] = 5;

    temp[377] = 192;

    temp[378] = 17;

    temp[379] = 18;

    temp[380] = 0;

    temp[381] = 136;

    temp[382] = 132;

    temp[383] = 40;

    temp[384] = 34;

    temp[385] = 10;

    temp[386] = 0;

    temp[387] = 6;

    temp[388] = 0;

    temp[389] = 24;

    temp[390] = 80;

    temp[391] = 0;

    temp[392] = 36;

    temp[393] = 68;

    temp[394] = 68;

    temp[395] = 34;

    temp[396] = 36;

    temp[397] = 5;

    temp[398] = 80;

    temp[399] = 130;

    temp[400] = 0;

    temp[401] = 192;

    temp[402] = 130;

    temp[403] = 40;

    temp[404] = 3;

    temp[405] = 36;

    temp[406] = 12;

    temp[407] = 130;

    temp[408] = 65;

    temp[409] = 24;

    temp[410] = 132;

    temp[411] = 34;

    temp[412] = 66;

    temp[413] = 20;

    temp[414] = 3;

    temp[415] = 9;

    temp[416] = 66;

    temp[417] = 132;

    temp[418] = 0;

    temp[419] = 40;

    temp[420] = 6;

    temp[421] = 20;

    temp[422] = 192;

    temp[423] = 129;

    temp[424] = 0;

    temp[425] = 129;

    temp[426] = 0;

    temp[427] = 0;

    temp[428] = 5;

    temp[429] = 12;

    temp[430] = 18;

    temp[431] = 20;



    sgx_report_t* nmWhexuXVe_3 = &tvjJOdYOwI_3;

    ret = sgxsd_enclave_get_next_report(global_eid, mVUAwMvatr_1, TXizPaVprE_2, nmWhexuXVe_3);



    if (ret != SGX_SUCCESS)

    	printf("Failure Code: %d",ret); 



    sgx_status_t xaKMBvNfDu_1 = 1904685597;

    sgx_status_t* KTSpMVafsd_1 = &xaKMBvNfDu_1;

    sgxsd_server_terminate_args_t xyshxzWMFf_2;

    temp = (char *)&xyshxzWMFf_2;

    temp[0] = 0;

    temp[1] = 0;

    temp[2] = 0;

    temp[3] = 0;

    temp[4] = 0;

    temp[5] = 0;

    temp[6] = 0;

    temp[7] = 0;

    temp[8] = 0;

    temp[9] = 0;

    temp[10] = 0;

    temp[11] = 0;

    temp[12] = 0;

    temp[13] = 0;

    temp[14] = 0;

    temp[15] = 0;



     const sgxsd_server_terminate_args_t* cMhrCjPsMM_2 = &xyshxzWMFf_2;

     sgxsd_server_state_handle_t nBUQtKEAoW_3;

    temp = (char *)&nBUQtKEAoW_3;

    temp[0] = 0;

    temp[1] = 0;

    temp[2] = 0;

    temp[3] = 0;

    temp[4] = 0;

    temp[5] = 0;

    temp[6] = 0;

    temp[7] = 0;



    ret = sgxsd_enclave_server_stop(global_eid, KTSpMVafsd_1, cMhrCjPsMM_2, nBUQtKEAoW_3);



    if (ret != SGX_SUCCESS)

    	printf("Failure Code: %d",ret); 



    //[[[end]]]

    /* Destroy the enclave */
    sgx_destroy_enclave(global_eid);
    return 0;
}
