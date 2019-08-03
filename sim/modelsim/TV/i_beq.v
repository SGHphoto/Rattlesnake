module single_port_ram_sim_high #(parameter ADDR_WIDTH, DATA_WIDTH ) (
    input  wire [ADDR_WIDTH - 1 : 0]         addr,
    input  wire [DATA_WIDTH - 1 : 0]         din,
    input  wire [DATA_WIDTH / 8 - 1 : 0]     write_en,
    input  wire                              clk,
    output reg [DATA_WIDTH - 1 : 0]          dout
);
    reg [DATA_WIDTH - 1 : 0] mem [(1<<ADDR_WIDTH)-1:0];
    genvar i;
    generate
        for (i = 0; i < (DATA_WIDTH / 8); i = i + 1) begin : gen_proc
            always @(posedge clk) begin
                if (write_en[i]) begin
                    mem[(addr)][8 * (i + 1) - 1 : 8 * i] <= din[8 * (i + 1) - 1 : 8 * i];
                end
            end
        end
    endgenerate
 
    always @(posedge clk) begin
        dout <= mem[addr];
    end
 
initial begin
//================================================================
//== Section  .text.init
//================================================================
    mem[0] <= 16'h04c0; // 0x80000000
    mem[1] <= 16'h3420; // 0x80000004
    mem[2] <= 16'h0080; // 0x80000008
    mem[3] <= 16'h03ff; // 0x8000000c
    mem[4] <= 16'h0090; // 0x80000010
    mem[5] <= 16'h03ff; // 0x80000014
    mem[6] <= 16'h00b0; // 0x80000018
    mem[7] <= 16'h03ff; // 0x8000001c
    mem[8] <= 16'h8000; // 0x80000020
    mem[9] <= 16'hfe0f; // 0x80000024
    mem[10] <= 16'h000f; // 0x80000028
    mem[11] <= 16'h000f; // 0x8000002c
    mem[12] <= 16'h3420; // 0x80000030
    mem[13] <= 16'h000f; // 0x80000034
    mem[14] <= 16'h0040; // 0x80000038
    mem[15] <= 16'h5391; // 0x8000003c
    mem[16] <= 16'h0000; // 0x80000040
    mem[17] <= 16'hfc3f; // 0x80000044
    mem[18] <= 16'hff9f; // 0x80000048
    mem[19] <= 16'hf140; // 0x8000004c
    mem[20] <= 16'h0005; // 0x80000050
    mem[21] <= 16'h0000; // 0x80000054
    mem[22] <= 16'h0102; // 0x80000058
    mem[23] <= 16'h3052; // 0x8000005c
    mem[24] <= 16'h1800; // 0x80000060
    mem[25] <= 16'h0000; // 0x80000064
    mem[26] <= 16'h01c2; // 0x80000068
    mem[27] <= 16'h3052; // 0x8000006c
    mem[28] <= 16'hfff0; // 0x80000070
    mem[29] <= 16'h3b02; // 0x80000074
    mem[30] <= 16'h01f0; // 0x80000078
    mem[31] <= 16'h3a02; // 0x8000007c
    mem[32] <= 16'h0000; // 0x80000080
    mem[33] <= 16'h0182; // 0x80000084
    mem[34] <= 16'h3052; // 0x80000088
    mem[35] <= 16'h3020; // 0x8000008c
    mem[36] <= 16'h3030; // 0x80000090
    mem[37] <= 16'h3040; // 0x80000094
    mem[38] <= 16'h0000; // 0x80000098
    mem[39] <= 16'h0000; // 0x8000009c
    mem[40] <= 16'hf682; // 0x800000a0
    mem[41] <= 16'h3052; // 0x800000a4
    mem[42] <= 16'h0010; // 0x800000a8
    mem[43] <= 16'h01f5; // 0x800000ac
    mem[44] <= 16'h0005; // 0x800000b0
    mem[45] <= 16'h0ff0; // 0x800000b4
    mem[46] <= 16'h0010; // 0x800000b8
    mem[47] <= 16'h0000; // 0x800000bc
    mem[48] <= 16'h8000; // 0x800000c0
    mem[49] <= 16'hf402; // 0x800000c4
    mem[50] <= 16'h0002; // 0x800000c8
    mem[51] <= 16'h1052; // 0x800000cc
    mem[52] <= 16'h0000; // 0x800000d0
    mem[53] <= 16'h1092; // 0x800000d4
    mem[54] <= 16'h3022; // 0x800000d8
    mem[55] <= 16'h3020; // 0x800000dc
    mem[56] <= 16'hf462; // 0x800000e0
    mem[57] <= 16'h3000; // 0x800000e4
    mem[58] <= 16'h0000; // 0x800000e8
    mem[59] <= 16'h8005; // 0x800000ec
    mem[60] <= 16'h3005; // 0x800000f0
    mem[61] <= 16'h0000; // 0x800000f4
    mem[62] <= 16'h0142; // 0x800000f8
    mem[63] <= 16'h3412; // 0x800000fc
    mem[64] <= 16'hf140; // 0x80000100
    mem[65] <= 16'h3020; // 0x80000104
    mem[66] <= 16'h0000; // 0x80000108
    mem[67] <= 16'hef80; // 0x8000010c
    mem[68] <= 16'h0000; // 0x80000110
    mem[69] <= 16'hf101; // 0x80000114
    mem[70] <= 16'h0000; // 0x80000118
    mem[71] <= 16'h0000; // 0x8000011c
    mem[72] <= 16'h0010; // 0x80000120
    mem[73] <= 16'hfff0; // 0x80000124
    mem[74] <= 16'h8000; // 0x80000128
    mem[75] <= 16'hfff3; // 0x8000012c
    mem[76] <= 16'h8000; // 0x80000130
    mem[77] <= 16'h0000; // 0x80000134
    mem[78] <= 16'h0041; // 0x80000138
    mem[79] <= 16'h001f; // 0x8000013c
    mem[80] <= 16'h0051; // 0x80000140
    mem[81] <= 16'h002f; // 0x80000144
    mem[82] <= 16'h0061; // 0x80000148
    mem[83] <= 16'h004f; // 0x8000014c
    mem[84] <= 16'h0071; // 0x80000150
    mem[85] <= 16'h008f; // 0x80000154
    mem[86] <= 16'h0081; // 0x80000158
    mem[87] <= 16'h010f; // 0x8000015c
    mem[88] <= 16'h0031; // 0x80000160
    mem[89] <= 16'h0041; // 0x80000164
    mem[90] <= 16'h0051; // 0x80000168
    mem[91] <= 16'h0061; // 0x8000016c
    mem[92] <= 16'h0071; // 0x80000170
    mem[93] <= 16'h0081; // 0x80000174
    mem[94] <= 16'h01f1; // 0x80000178
    mem[95] <= 16'h0000; // 0x8000017c
    mem[96] <= 16'he880; // 0x80000180
    mem[97] <= 16'h0000; // 0x80000184
    mem[98] <= 16'heb81; // 0x80000188
    mem[99] <= 16'h0000; // 0x8000018c
    mem[100] <= 16'h0000; // 0x80000190
    mem[101] <= 16'h0010; // 0x80000194
    mem[102] <= 16'hfff0; // 0x80000198
    mem[103] <= 16'h8000; // 0x8000019c
    mem[104] <= 16'hfff5; // 0x800001a0
    mem[105] <= 16'h8000; // 0x800001a4
    mem[106] <= 16'h0000; // 0x800001a8
    mem[107] <= 16'h0073; // 0x800001ac
    mem[108] <= 16'h001f; // 0x800001b0
    mem[109] <= 16'h0083; // 0x800001b4
    mem[110] <= 16'h002f; // 0x800001b8
    mem[111] <= 16'h0093; // 0x800001bc
    mem[112] <= 16'h004f; // 0x800001c0
    mem[113] <= 16'h00a3; // 0x800001c4
    mem[114] <= 16'h008f; // 0x800001c8
    mem[115] <= 16'h00b3; // 0x800001cc
    mem[116] <= 16'h010f; // 0x800001d0
    mem[117] <= 16'h0061; // 0x800001d4
    mem[118] <= 16'h0071; // 0x800001d8
    mem[119] <= 16'h0081; // 0x800001dc
    mem[120] <= 16'h0091; // 0x800001e0
    mem[121] <= 16'h00a1; // 0x800001e4
    mem[122] <= 16'h00b1; // 0x800001e8
    mem[123] <= 16'h01f1; // 0x800001ec
    mem[124] <= 16'h0000; // 0x800001f0
    mem[125] <= 16'he180; // 0x800001f4
    mem[126] <= 16'h0000; // 0x800001f8
    mem[127] <= 16'he601; // 0x800001fc
    mem[128] <= 16'h0000; // 0x80000200
    mem[129] <= 16'h0000; // 0x80000204
    mem[130] <= 16'h0010; // 0x80000208
    mem[131] <= 16'hfff0; // 0x8000020c
    mem[132] <= 16'h8000; // 0x80000210
    mem[133] <= 16'hfff8; // 0x80000214
    mem[134] <= 16'h8000; // 0x80000218
    mem[135] <= 16'h0000; // 0x8000021c
    mem[136] <= 16'h00d6; // 0x80000220
    mem[137] <= 16'h001f; // 0x80000224
    mem[138] <= 16'h00e6; // 0x80000228
    mem[139] <= 16'h002f; // 0x8000022c
    mem[140] <= 16'h00f6; // 0x80000230
    mem[141] <= 16'h004f; // 0x80000234
    mem[142] <= 16'h0106; // 0x80000238
    mem[143] <= 16'h008f; // 0x8000023c
    mem[144] <= 16'h0116; // 0x80000240
    mem[145] <= 16'h010f; // 0x80000244
    mem[146] <= 16'h00c1; // 0x80000248
    mem[147] <= 16'h00d1; // 0x8000024c
    mem[148] <= 16'h00e1; // 0x80000250
    mem[149] <= 16'h00f1; // 0x80000254
    mem[150] <= 16'h0101; // 0x80000258
    mem[151] <= 16'h0111; // 0x8000025c
    mem[152] <= 16'h01f1; // 0x80000260
    mem[153] <= 16'h0000; // 0x80000264
    mem[154] <= 16'hda80; // 0x80000268
    mem[155] <= 16'h0000; // 0x8000026c
    mem[156] <= 16'he081; // 0x80000270
    mem[157] <= 16'h0000; // 0x80000274
    mem[158] <= 16'h0000; // 0x80000278
    mem[159] <= 16'h0010; // 0x8000027c
    mem[160] <= 16'hfff0; // 0x80000280
    mem[161] <= 16'h8000; // 0x80000284
    mem[162] <= 16'hfffb; // 0x80000288
    mem[163] <= 16'h8000; // 0x8000028c
    mem[164] <= 16'h0000; // 0x80000290
    mem[165] <= 16'h0139; // 0x80000294
    mem[166] <= 16'h001f; // 0x80000298
    mem[167] <= 16'h0149; // 0x8000029c
    mem[168] <= 16'h002f; // 0x800002a0
    mem[169] <= 16'h0159; // 0x800002a4
    mem[170] <= 16'h004f; // 0x800002a8
    mem[171] <= 16'h0169; // 0x800002ac
    mem[172] <= 16'h008f; // 0x800002b0
    mem[173] <= 16'h0179; // 0x800002b4
    mem[174] <= 16'h010f; // 0x800002b8
    mem[175] <= 16'h0121; // 0x800002bc
    mem[176] <= 16'h0131; // 0x800002c0
    mem[177] <= 16'h0141; // 0x800002c4
    mem[178] <= 16'h0151; // 0x800002c8
    mem[179] <= 16'h0161; // 0x800002cc
    mem[180] <= 16'h0171; // 0x800002d0
    mem[181] <= 16'h01f1; // 0x800002d4
    mem[182] <= 16'h0000; // 0x800002d8
    mem[183] <= 16'hd380; // 0x800002dc
    mem[184] <= 16'h0000; // 0x800002e0
    mem[185] <= 16'hdb01; // 0x800002e4
    mem[186] <= 16'h0000; // 0x800002e8
    mem[187] <= 16'h0000; // 0x800002ec
    mem[188] <= 16'h0010; // 0x800002f0
    mem[189] <= 16'hfff0; // 0x800002f4
    mem[190] <= 16'h8000; // 0x800002f8
    mem[191] <= 16'hfffe; // 0x800002fc
    mem[192] <= 16'h8000; // 0x80000300
    mem[193] <= 16'h0000; // 0x80000304
    mem[194] <= 16'h019c; // 0x80000308
    mem[195] <= 16'h001f; // 0x8000030c
    mem[196] <= 16'h01ac; // 0x80000310
    mem[197] <= 16'h002f; // 0x80000314
    mem[198] <= 16'h01bc; // 0x80000318
    mem[199] <= 16'h004f; // 0x8000031c
    mem[200] <= 16'h01cc; // 0x80000320
    mem[201] <= 16'h008f; // 0x80000324
    mem[202] <= 16'h01dc; // 0x80000328
    mem[203] <= 16'h010f; // 0x8000032c
    mem[204] <= 16'h0181; // 0x80000330
    mem[205] <= 16'h0191; // 0x80000334
    mem[206] <= 16'h01a1; // 0x80000338
    mem[207] <= 16'h01b1; // 0x8000033c
    mem[208] <= 16'h01c1; // 0x80000340
    mem[209] <= 16'h01d1; // 0x80000344
    mem[210] <= 16'h01f1; // 0x80000348
    mem[211] <= 16'h0000; // 0x8000034c
    mem[212] <= 16'hd60d; // 0x80000350
    mem[213] <= 16'h0000; // 0x80000354
    mem[214] <= 16'h0010; // 0x80000358
    mem[215] <= 16'hfff0; // 0x8000035c
    mem[216] <= 16'h8000; // 0x80000360
    mem[217] <= 16'hfff2; // 0x80000364
    mem[218] <= 16'h8000; // 0x80000368
    mem[219] <= 16'h0000; // 0x8000036c
    mem[220] <= 16'h0000; // 0x80000370
    mem[221] <= 16'h001f; // 0x80000374
    mem[222] <= 16'h0001; // 0x80000378
    mem[223] <= 16'h002f; // 0x8000037c
    mem[224] <= 16'h0001; // 0x80000380
    mem[225] <= 16'h004f; // 0x80000384
    mem[226] <= 16'h0002; // 0x80000388
    mem[227] <= 16'h008f; // 0x8000038c
    mem[228] <= 16'h0002; // 0x80000390
    mem[229] <= 16'h010f; // 0x80000394
    mem[230] <= 16'h0010; // 0x80000398
    mem[231] <= 16'h020f; // 0x8000039c
    mem[232] <= 16'h0020; // 0x800003a0
    mem[233] <= 16'h040f; // 0x800003a4
    mem[234] <= 16'h0030; // 0x800003a8
    mem[235] <= 16'h080f; // 0x800003ac
    mem[236] <= 16'h0040; // 0x800003b0
    mem[237] <= 16'h100f; // 0x800003b4
    mem[238] <= 16'h0050; // 0x800003b8
    mem[239] <= 16'h200f; // 0x800003bc
    mem[240] <= 16'h01fd; // 0x800003c0
    mem[241] <= 16'h0000; // 0x800003c4
    mem[242] <= 16'hc50a; // 0x800003c8
    mem[243] <= 16'h0000; // 0x800003cc
    mem[244] <= 16'hce4b; // 0x800003d0
    mem[245] <= 16'h000a; // 0x800003d4
    mem[246] <= 16'hfff0; // 0x800003d8
    mem[247] <= 16'hfff0; // 0x800003dc
    mem[248] <= 16'h0fed; // 0x800003e0
    mem[249] <= 16'hba92; // 0x800003e4
    mem[250] <= 16'h020f; // 0x800003e8
    mem[251] <= 16'h0000; // 0x800003ec
    mem[252] <= 16'h0000; // 0x800003f0
    mem[253] <= 16'h0000; // 0x800003f4
    mem[254] <= 16'h8765; // 0x800003f8
    mem[255] <= 16'h3211; // 0x800003fc
    mem[256] <= 16'h020f; // 0x80000400
    mem[257] <= 16'h0000; // 0x80000404
    mem[258] <= 16'h0000; // 0x80000408
    mem[259] <= 16'h0000; // 0x8000040c
    mem[260] <= 16'h9abc; // 0x80000410
    mem[261] <= 16'hef01; // 0x80000414
    mem[262] <= 16'hfe0f; // 0x80000418
    mem[263] <= 16'h0000; // 0x8000041c
    mem[264] <= 16'h0000; // 0x80000420
    mem[265] <= 16'h0000; // 0x80000424
    mem[266] <= 16'h000b; // 0x80000428
    mem[267] <= 16'h002b; // 0x8000042c
    mem[268] <= 16'h003b; // 0x80000430
    mem[269] <= 16'h004b; // 0x80000434
    mem[270] <= 16'h0ff0; // 0x80000438
    mem[271] <= 16'h0010; // 0x8000043c
    mem[272] <= 16'h0000; // 0x80000440
    mem[273] <= 16'hc000; // 0x80000444
    mem[274] <= 16'h0000; // 0x80000448
    mem[275] <= 16'h0000; // 0x8000044c
    mem[276] <= 16'h0000; // 0x80000450
    mem[277] <= 16'h0000; // 0x80000454
    mem[278] <= 16'h0000; // 0x80000458
    mem[279] <= 16'h0000; // 0x8000045c
    mem[280] <= 16'h0000; // 0x80000460
    mem[281] <= 16'h0000; // 0x80000464
    mem[282] <= 16'h0000; // 0x80000468
    mem[283] <= 16'h0000; // 0x8000046c
    mem[284] <= 16'h0000; // 0x80000470
    mem[285] <= 16'h0000; // 0x80000474
    mem[286] <= 16'h0000; // 0x80000478
    mem[287] <= 16'h0000; // 0x8000047c
    mem[288] <= 16'h0000; // 0x80000480
 
 
//================================================================
//== Section  .tohost
//================================================================
    mem[1024] <= 16'h0000; // 0x80001000
    mem[1025] <= 16'h0000; // 0x80001004
    mem[1026] <= 16'h0000; // 0x80001008
    mem[1027] <= 16'h0000; // 0x8000100c
    mem[1028] <= 16'h0000; // 0x80001010
    mem[1029] <= 16'h0000; // 0x80001014
    mem[1030] <= 16'h0000; // 0x80001018
    mem[1031] <= 16'h0000; // 0x8000101c
    mem[1032] <= 16'h0000; // 0x80001020
    mem[1033] <= 16'h0000; // 0x80001024
    mem[1034] <= 16'h0000; // 0x80001028
    mem[1035] <= 16'h0000; // 0x8000102c
    mem[1036] <= 16'h0000; // 0x80001030
    mem[1037] <= 16'h0000; // 0x80001034
    mem[1038] <= 16'h0000; // 0x80001038
    mem[1039] <= 16'h0000; // 0x8000103c
    mem[1040] <= 16'h0000; // 0x80001040
    mem[1041] <= 16'h0000; // 0x80001044
    mem[1042] <= 16'h0000; // 0x80001048
    mem[1043] <= 16'h0000; // 0x8000104c
    mem[1044] <= 16'h0000; // 0x80001050
    mem[1045] <= 16'h0000; // 0x80001054
    mem[1046] <= 16'h0000; // 0x80001058
    mem[1047] <= 16'h0000; // 0x8000105c
    mem[1048] <= 16'h0000; // 0x80001060
    mem[1049] <= 16'h0000; // 0x80001064
    mem[1050] <= 16'h0000; // 0x80001068
    mem[1051] <= 16'h0000; // 0x8000106c
    mem[1052] <= 16'h0000; // 0x80001070
    mem[1053] <= 16'h0000; // 0x80001074
    mem[1054] <= 16'h0000; // 0x80001078
    mem[1055] <= 16'h0000; // 0x8000107c
    mem[1056] <= 16'h0000; // 0x80001080
    mem[1057] <= 16'h0000; // 0x80001084
    mem[1058] <= 16'h0000; // 0x80001088
    mem[1059] <= 16'h0000; // 0x8000108c
    mem[1060] <= 16'h0000; // 0x80001090
    mem[1061] <= 16'h0000; // 0x80001094
    mem[1062] <= 16'h0000; // 0x80001098
    mem[1063] <= 16'h0000; // 0x8000109c
    mem[1064] <= 16'h0000; // 0x800010a0
    mem[1065] <= 16'h0000; // 0x800010a4
    mem[1066] <= 16'h0000; // 0x800010a8
    mem[1067] <= 16'h0000; // 0x800010ac
    mem[1068] <= 16'h0000; // 0x800010b0
    mem[1069] <= 16'h0000; // 0x800010b4
    mem[1070] <= 16'h0000; // 0x800010b8
    mem[1071] <= 16'h0000; // 0x800010bc
    mem[1072] <= 16'h0000; // 0x800010c0
    mem[1073] <= 16'h0000; // 0x800010c4
    mem[1074] <= 16'h0000; // 0x800010c8
    mem[1075] <= 16'h0000; // 0x800010cc
    mem[1076] <= 16'h0000; // 0x800010d0
    mem[1077] <= 16'h0000; // 0x800010d4
    mem[1078] <= 16'h0000; // 0x800010d8
    mem[1079] <= 16'h0000; // 0x800010dc
    mem[1080] <= 16'h0000; // 0x800010e0
    mem[1081] <= 16'h0000; // 0x800010e4
    mem[1082] <= 16'h0000; // 0x800010e8
    mem[1083] <= 16'h0000; // 0x800010ec
    mem[1084] <= 16'h0000; // 0x800010f0
    mem[1085] <= 16'h0000; // 0x800010f4
    mem[1086] <= 16'h0000; // 0x800010f8
    mem[1087] <= 16'h0000; // 0x800010fc
    mem[1088] <= 16'h0000; // 0x80001100
    mem[1089] <= 16'h0000; // 0x80001104
 
 
//================================================================
//== Section  .data
//================================================================
    mem[2048] <= 16'h0000; // 0x80002000
    mem[2049] <= 16'h0000; // 0x80002004
    mem[2050] <= 16'hffff; // 0x80002008
    mem[2051] <= 16'h7fff; // 0x8000200c
    mem[2052] <= 16'h8000; // 0x80002010
    mem[2053] <= 16'h0000; // 0x80002014
    mem[2054] <= 16'h0000; // 0x80002018
    mem[2055] <= 16'h0000; // 0x8000201c
    mem[2056] <= 16'hffff; // 0x80002020
    mem[2057] <= 16'hffff; // 0x80002024
    mem[2058] <= 16'hffff; // 0x80002028
    mem[2059] <= 16'hffff; // 0x8000202c
    mem[2060] <= 16'hffff; // 0x80002030
    mem[2061] <= 16'hffff; // 0x80002034
    mem[2062] <= 16'hffff; // 0x80002038
    mem[2063] <= 16'hffff; // 0x8000203c
    mem[2064] <= 16'hffff; // 0x80002040
    mem[2065] <= 16'hffff; // 0x80002044
    mem[2066] <= 16'hffff; // 0x80002048
    mem[2067] <= 16'hffff; // 0x8000204c
    mem[2068] <= 16'hffff; // 0x80002050
    mem[2069] <= 16'hffff; // 0x80002054
    mem[2070] <= 16'hffff; // 0x80002058
    mem[2071] <= 16'hffff; // 0x8000205c
    mem[2072] <= 16'hffff; // 0x80002060
    mem[2073] <= 16'hffff; // 0x80002064
    mem[2074] <= 16'hffff; // 0x80002068
    mem[2075] <= 16'hffff; // 0x8000206c
    mem[2076] <= 16'hffff; // 0x80002070
    mem[2077] <= 16'hffff; // 0x80002074
    mem[2078] <= 16'hffff; // 0x80002078
    mem[2079] <= 16'hffff; // 0x8000207c
    mem[2080] <= 16'hffff; // 0x80002080
    mem[2081] <= 16'hffff; // 0x80002084
    mem[2082] <= 16'hffff; // 0x80002088
    mem[2083] <= 16'hffff; // 0x8000208c
    mem[2084] <= 16'hffff; // 0x80002090
    mem[2085] <= 16'hffff; // 0x80002094
    mem[2086] <= 16'hffff; // 0x80002098
    mem[2087] <= 16'hffff; // 0x8000209c
    mem[2088] <= 16'hffff; // 0x800020a0
    mem[2089] <= 16'hffff; // 0x800020a4
    mem[2090] <= 16'hffff; // 0x800020a8
    mem[2091] <= 16'hffff; // 0x800020ac
    mem[2092] <= 16'hffff; // 0x800020b0
    mem[2093] <= 16'hffff; // 0x800020b4
    mem[2094] <= 16'hffff; // 0x800020b8
    mem[2095] <= 16'hffff; // 0x800020bc
 
 
end
endmodule
 
 
 
module single_port_ram_sim_low #(parameter ADDR_WIDTH, DATA_WIDTH ) (
    input  wire [ADDR_WIDTH - 1 : 0]         addr,
    input  wire [DATA_WIDTH - 1 : 0]         din,
    input  wire [DATA_WIDTH / 8 - 1 : 0]     write_en,
    input  wire                              clk,
    output reg [DATA_WIDTH - 1 : 0]          dout
);
    reg [DATA_WIDTH - 1 : 0] mem [(1<<ADDR_WIDTH)-1:0];
    genvar i;
    generate
        for (i = 0; i < (DATA_WIDTH / 8); i = i + 1) begin : gen_proc
            always @(posedge clk) begin
                if (write_en[i]) begin
                    mem[(addr)][8 * (i + 1) - 1 : 8 * i] <= din[8 * (i + 1) - 1 : 8 * i];
                end
            end
        end
    endgenerate
 
    always @(posedge clk) begin
        dout <= mem[addr];
    end
 
initial begin
//================================================================
//== Section  .text.init
//================================================================
    mem[0] <= 16'h006f; // 0x80000000
    mem[1] <= 16'h2f73; // 0x80000004
    mem[2] <= 16'h0f93; // 0x80000008
    mem[3] <= 16'h0a63; // 0x8000000c
    mem[4] <= 16'h0f93; // 0x80000010
    mem[5] <= 16'h0663; // 0x80000014
    mem[6] <= 16'h0f93; // 0x80000018
    mem[7] <= 16'h0263; // 0x8000001c
    mem[8] <= 16'h0f17; // 0x80000020
    mem[9] <= 16'h0f13; // 0x80000024
    mem[10] <= 16'h0463; // 0x80000028
    mem[11] <= 16'h0067; // 0x8000002c
    mem[12] <= 16'h2f73; // 0x80000030
    mem[13] <= 16'h5463; // 0x80000034
    mem[14] <= 16'h006f; // 0x80000038
    mem[15] <= 16'he193; // 0x8000003c
    mem[16] <= 16'h1f17; // 0x80000040
    mem[17] <= 16'h2023; // 0x80000044
    mem[18] <= 16'hf06f; // 0x80000048
    mem[19] <= 16'h2573; // 0x8000004c
    mem[20] <= 16'h1063; // 0x80000050
    mem[21] <= 16'h0297; // 0x80000054
    mem[22] <= 16'h8293; // 0x80000058
    mem[23] <= 16'h9073; // 0x8000005c
    mem[24] <= 16'h5073; // 0x80000060
    mem[25] <= 16'h0297; // 0x80000064
    mem[26] <= 16'h8293; // 0x80000068
    mem[27] <= 16'h9073; // 0x8000006c
    mem[28] <= 16'h0293; // 0x80000070
    mem[29] <= 16'h9073; // 0x80000074
    mem[30] <= 16'h0293; // 0x80000078
    mem[31] <= 16'h9073; // 0x8000007c
    mem[32] <= 16'h0297; // 0x80000080
    mem[33] <= 16'h8293; // 0x80000084
    mem[34] <= 16'h9073; // 0x80000088
    mem[35] <= 16'h5073; // 0x8000008c
    mem[36] <= 16'h5073; // 0x80000090
    mem[37] <= 16'h5073; // 0x80000094
    mem[38] <= 16'h0193; // 0x80000098
    mem[39] <= 16'h0297; // 0x8000009c
    mem[40] <= 16'h8293; // 0x800000a0
    mem[41] <= 16'h9073; // 0x800000a4
    mem[42] <= 16'h0513; // 0x800000a8
    mem[43] <= 16'h1513; // 0x800000ac
    mem[44] <= 16'h4863; // 0x800000b0
    mem[45] <= 16'h000f; // 0x800000b4
    mem[46] <= 16'h0193; // 0x800000b8
    mem[47] <= 16'h0073; // 0x800000bc
    mem[48] <= 16'h0297; // 0x800000c0
    mem[49] <= 16'h8293; // 0x800000c4
    mem[50] <= 16'h8e63; // 0x800000c8
    mem[51] <= 16'h9073; // 0x800000cc
    mem[52] <= 16'hb2b7; // 0x800000d0
    mem[53] <= 16'h8293; // 0x800000d4
    mem[54] <= 16'h9073; // 0x800000d8
    mem[55] <= 16'h2373; // 0x800000dc
    mem[56] <= 16'h9ee3; // 0x800000e0
    mem[57] <= 16'h5073; // 0x800000e4
    mem[58] <= 16'h2537; // 0x800000e8
    mem[59] <= 16'h0513; // 0x800000ec
    mem[60] <= 16'h2073; // 0x800000f0
    mem[61] <= 16'h0297; // 0x800000f4
    mem[62] <= 16'h8293; // 0x800000f8
    mem[63] <= 16'h9073; // 0x800000fc
    mem[64] <= 16'h2573; // 0x80000100
    mem[65] <= 16'h0073; // 0x80000104
    mem[66] <= 16'h2097; // 0x80000108
    mem[67] <= 16'h8093; // 0x8000010c
    mem[68] <= 16'h2117; // 0x80000110
    mem[69] <= 16'h0113; // 0x80000114
    mem[70] <= 16'ha183; // 0x80000118
    mem[71] <= 16'h0213; // 0x8000011c
    mem[72] <= 16'h0293; // 0x80000120
    mem[73] <= 16'h0313; // 0x80000124
    mem[74] <= 16'h03b7; // 0x80000128
    mem[75] <= 16'h8393; // 0x8000012c
    mem[76] <= 16'h0437; // 0x80000130
    mem[77] <= 16'h0f93; // 0x80000134
    mem[78] <= 16'h8463; // 0x80000138
    mem[79] <= 16'hef93; // 0x8000013c
    mem[80] <= 16'h8463; // 0x80000140
    mem[81] <= 16'hef93; // 0x80000144
    mem[82] <= 16'h8463; // 0x80000148
    mem[83] <= 16'hef93; // 0x8000014c
    mem[84] <= 16'h8463; // 0x80000150
    mem[85] <= 16'hef93; // 0x80000154
    mem[86] <= 16'h8463; // 0x80000158
    mem[87] <= 16'hef93; // 0x8000015c
    mem[88] <= 16'h2023; // 0x80000160
    mem[89] <= 16'h2223; // 0x80000164
    mem[90] <= 16'h2423; // 0x80000168
    mem[91] <= 16'h2623; // 0x8000016c
    mem[92] <= 16'h2823; // 0x80000170
    mem[93] <= 16'h2a23; // 0x80000174
    mem[94] <= 16'h2c23; // 0x80000178
    mem[95] <= 16'h2097; // 0x8000017c
    mem[96] <= 16'h8093; // 0x80000180
    mem[97] <= 16'h2117; // 0x80000184
    mem[98] <= 16'h0113; // 0x80000188
    mem[99] <= 16'ha303; // 0x8000018c
    mem[100] <= 16'h0393; // 0x80000190
    mem[101] <= 16'h0413; // 0x80000194
    mem[102] <= 16'h0493; // 0x80000198
    mem[103] <= 16'h0537; // 0x8000019c
    mem[104] <= 16'h0513; // 0x800001a0
    mem[105] <= 16'h05b7; // 0x800001a4
    mem[106] <= 16'h0f93; // 0x800001a8
    mem[107] <= 16'h0463; // 0x800001ac
    mem[108] <= 16'hef93; // 0x800001b0
    mem[109] <= 16'h0463; // 0x800001b4
    mem[110] <= 16'hef93; // 0x800001b8
    mem[111] <= 16'h0463; // 0x800001bc
    mem[112] <= 16'hef93; // 0x800001c0
    mem[113] <= 16'h0463; // 0x800001c4
    mem[114] <= 16'hef93; // 0x800001c8
    mem[115] <= 16'h0463; // 0x800001cc
    mem[116] <= 16'hef93; // 0x800001d0
    mem[117] <= 16'h2023; // 0x800001d4
    mem[118] <= 16'h2223; // 0x800001d8
    mem[119] <= 16'h2423; // 0x800001dc
    mem[120] <= 16'h2623; // 0x800001e0
    mem[121] <= 16'h2823; // 0x800001e4
    mem[122] <= 16'h2a23; // 0x800001e8
    mem[123] <= 16'h2c23; // 0x800001ec
    mem[124] <= 16'h2097; // 0x800001f0
    mem[125] <= 16'h8093; // 0x800001f4
    mem[126] <= 16'h2117; // 0x800001f8
    mem[127] <= 16'h0113; // 0x800001fc
    mem[128] <= 16'ha603; // 0x80000200
    mem[129] <= 16'h0693; // 0x80000204
    mem[130] <= 16'h0713; // 0x80000208
    mem[131] <= 16'h0793; // 0x8000020c
    mem[132] <= 16'h0837; // 0x80000210
    mem[133] <= 16'h0813; // 0x80000214
    mem[134] <= 16'h08b7; // 0x80000218
    mem[135] <= 16'h0f93; // 0x8000021c
    mem[136] <= 16'h0463; // 0x80000220
    mem[137] <= 16'hef93; // 0x80000224
    mem[138] <= 16'h0463; // 0x80000228
    mem[139] <= 16'hef93; // 0x8000022c
    mem[140] <= 16'h0463; // 0x80000230
    mem[141] <= 16'hef93; // 0x80000234
    mem[142] <= 16'h0463; // 0x80000238
    mem[143] <= 16'hef93; // 0x8000023c
    mem[144] <= 16'h0463; // 0x80000240
    mem[145] <= 16'hef93; // 0x80000244
    mem[146] <= 16'h2023; // 0x80000248
    mem[147] <= 16'h2223; // 0x8000024c
    mem[148] <= 16'h2423; // 0x80000250
    mem[149] <= 16'h2623; // 0x80000254
    mem[150] <= 16'h2823; // 0x80000258
    mem[151] <= 16'h2a23; // 0x8000025c
    mem[152] <= 16'h2c23; // 0x80000260
    mem[153] <= 16'h2097; // 0x80000264
    mem[154] <= 16'h8093; // 0x80000268
    mem[155] <= 16'h2117; // 0x8000026c
    mem[156] <= 16'h0113; // 0x80000270
    mem[157] <= 16'ha903; // 0x80000274
    mem[158] <= 16'h0993; // 0x80000278
    mem[159] <= 16'h0a13; // 0x8000027c
    mem[160] <= 16'h0a93; // 0x80000280
    mem[161] <= 16'h0b37; // 0x80000284
    mem[162] <= 16'h0b13; // 0x80000288
    mem[163] <= 16'h0bb7; // 0x8000028c
    mem[164] <= 16'h0f93; // 0x80000290
    mem[165] <= 16'h0463; // 0x80000294
    mem[166] <= 16'hef93; // 0x80000298
    mem[167] <= 16'h0463; // 0x8000029c
    mem[168] <= 16'hef93; // 0x800002a0
    mem[169] <= 16'h0463; // 0x800002a4
    mem[170] <= 16'hef93; // 0x800002a8
    mem[171] <= 16'h0463; // 0x800002ac
    mem[172] <= 16'hef93; // 0x800002b0
    mem[173] <= 16'h0463; // 0x800002b4
    mem[174] <= 16'hef93; // 0x800002b8
    mem[175] <= 16'h2023; // 0x800002bc
    mem[176] <= 16'h2223; // 0x800002c0
    mem[177] <= 16'h2423; // 0x800002c4
    mem[178] <= 16'h2623; // 0x800002c8
    mem[179] <= 16'h2823; // 0x800002cc
    mem[180] <= 16'h2a23; // 0x800002d0
    mem[181] <= 16'h2c23; // 0x800002d4
    mem[182] <= 16'h2097; // 0x800002d8
    mem[183] <= 16'h8093; // 0x800002dc
    mem[184] <= 16'h2117; // 0x800002e0
    mem[185] <= 16'h0113; // 0x800002e4
    mem[186] <= 16'hac03; // 0x800002e8
    mem[187] <= 16'h0c93; // 0x800002ec
    mem[188] <= 16'h0d13; // 0x800002f0
    mem[189] <= 16'h0d93; // 0x800002f4
    mem[190] <= 16'h0e37; // 0x800002f8
    mem[191] <= 16'h0e13; // 0x800002fc
    mem[192] <= 16'h0eb7; // 0x80000300
    mem[193] <= 16'h0f93; // 0x80000304
    mem[194] <= 16'h0463; // 0x80000308
    mem[195] <= 16'hef93; // 0x8000030c
    mem[196] <= 16'h0463; // 0x80000310
    mem[197] <= 16'hef93; // 0x80000314
    mem[198] <= 16'h0463; // 0x80000318
    mem[199] <= 16'hef93; // 0x8000031c
    mem[200] <= 16'h0463; // 0x80000320
    mem[201] <= 16'hef93; // 0x80000324
    mem[202] <= 16'h0463; // 0x80000328
    mem[203] <= 16'hef93; // 0x8000032c
    mem[204] <= 16'h2023; // 0x80000330
    mem[205] <= 16'h2223; // 0x80000334
    mem[206] <= 16'h2423; // 0x80000338
    mem[207] <= 16'h2623; // 0x8000033c
    mem[208] <= 16'h2823; // 0x80000340
    mem[209] <= 16'h2a23; // 0x80000344
    mem[210] <= 16'h2c23; // 0x80000348
    mem[211] <= 16'h2d97; // 0x8000034c
    mem[212] <= 16'h8d93; // 0x80000350
    mem[213] <= 16'h0093; // 0x80000354
    mem[214] <= 16'h0113; // 0x80000358
    mem[215] <= 16'h0193; // 0x8000035c
    mem[216] <= 16'h0237; // 0x80000360
    mem[217] <= 16'h0213; // 0x80000364
    mem[218] <= 16'h02b7; // 0x80000368
    mem[219] <= 16'h0f93; // 0x8000036c
    mem[220] <= 16'h8463; // 0x80000370
    mem[221] <= 16'hef93; // 0x80000374
    mem[222] <= 16'h0463; // 0x80000378
    mem[223] <= 16'hef93; // 0x8000037c
    mem[224] <= 16'h8463; // 0x80000380
    mem[225] <= 16'hef93; // 0x80000384
    mem[226] <= 16'h0463; // 0x80000388
    mem[227] <= 16'hef93; // 0x8000038c
    mem[228] <= 16'h8463; // 0x80000390
    mem[229] <= 16'hef93; // 0x80000394
    mem[230] <= 16'h0463; // 0x80000398
    mem[231] <= 16'hef93; // 0x8000039c
    mem[232] <= 16'h0463; // 0x800003a0
    mem[233] <= 16'hef93; // 0x800003a4
    mem[234] <= 16'h0463; // 0x800003a8
    mem[235] <= 16'hef93; // 0x800003ac
    mem[236] <= 16'h0463; // 0x800003b0
    mem[237] <= 16'hef93; // 0x800003b4
    mem[238] <= 16'h0463; // 0x800003b8
    mem[239] <= 16'hef93; // 0x800003bc
    mem[240] <= 16'ha023; // 0x800003c0
    mem[241] <= 16'h2a97; // 0x800003c4
    mem[242] <= 16'h8a93; // 0x800003c8
    mem[243] <= 16'h2b17; // 0x800003cc
    mem[244] <= 16'h0b13; // 0x800003d0
    mem[245] <= 16'haf83; // 0x800003d4
    mem[246] <= 16'h0113; // 0x800003d8
    mem[247] <= 16'h0193; // 0x800003dc
    mem[248] <= 16'hd237; // 0x800003e0
    mem[249] <= 16'h0213; // 0x800003e4
    mem[250] <= 16'h8463; // 0x800003e8
    mem[251] <= 16'h0113; // 0x800003ec
    mem[252] <= 16'h0193; // 0x800003f0
    mem[253] <= 16'h0213; // 0x800003f4
    mem[254] <= 16'h41b7; // 0x800003f8
    mem[255] <= 16'h8193; // 0x800003fc
    mem[256] <= 16'h8463; // 0x80000400
    mem[257] <= 16'h0113; // 0x80000404
    mem[258] <= 16'h0193; // 0x80000408
    mem[259] <= 16'h0213; // 0x8000040c
    mem[260] <= 16'he137; // 0x80000410
    mem[261] <= 16'h0113; // 0x80000414
    mem[262] <= 16'h80e3; // 0x80000418
    mem[263] <= 16'h0113; // 0x8000041c
    mem[264] <= 16'h0193; // 0x80000420
    mem[265] <= 16'h0213; // 0x80000424
    mem[266] <= 16'h2023; // 0x80000428
    mem[267] <= 16'h2223; // 0x8000042c
    mem[268] <= 16'h2423; // 0x80000430
    mem[269] <= 16'h2623; // 0x80000434
    mem[270] <= 16'h000f; // 0x80000438
    mem[271] <= 16'h0193; // 0x8000043c
    mem[272] <= 16'h0073; // 0x80000440
    mem[273] <= 16'h1073; // 0x80000444
    mem[274] <= 16'h0000; // 0x80000448
    mem[275] <= 16'h0000; // 0x8000044c
    mem[276] <= 16'h0000; // 0x80000450
    mem[277] <= 16'h0000; // 0x80000454
    mem[278] <= 16'h0000; // 0x80000458
    mem[279] <= 16'h0000; // 0x8000045c
    mem[280] <= 16'h0000; // 0x80000460
    mem[281] <= 16'h0000; // 0x80000464
    mem[282] <= 16'h0000; // 0x80000468
    mem[283] <= 16'h0000; // 0x8000046c
    mem[284] <= 16'h0000; // 0x80000470
    mem[285] <= 16'h0000; // 0x80000474
    mem[286] <= 16'h0000; // 0x80000478
    mem[287] <= 16'h0000; // 0x8000047c
    mem[288] <= 16'h0000; // 0x80000480
 
 
//================================================================
//== Section  .tohost
//================================================================
    mem[1024] <= 16'h0000; // 0x80001000
    mem[1025] <= 16'h0000; // 0x80001004
    mem[1026] <= 16'h0000; // 0x80001008
    mem[1027] <= 16'h0000; // 0x8000100c
    mem[1028] <= 16'h0000; // 0x80001010
    mem[1029] <= 16'h0000; // 0x80001014
    mem[1030] <= 16'h0000; // 0x80001018
    mem[1031] <= 16'h0000; // 0x8000101c
    mem[1032] <= 16'h0000; // 0x80001020
    mem[1033] <= 16'h0000; // 0x80001024
    mem[1034] <= 16'h0000; // 0x80001028
    mem[1035] <= 16'h0000; // 0x8000102c
    mem[1036] <= 16'h0000; // 0x80001030
    mem[1037] <= 16'h0000; // 0x80001034
    mem[1038] <= 16'h0000; // 0x80001038
    mem[1039] <= 16'h0000; // 0x8000103c
    mem[1040] <= 16'h0000; // 0x80001040
    mem[1041] <= 16'h0000; // 0x80001044
    mem[1042] <= 16'h0000; // 0x80001048
    mem[1043] <= 16'h0000; // 0x8000104c
    mem[1044] <= 16'h0000; // 0x80001050
    mem[1045] <= 16'h0000; // 0x80001054
    mem[1046] <= 16'h0000; // 0x80001058
    mem[1047] <= 16'h0000; // 0x8000105c
    mem[1048] <= 16'h0000; // 0x80001060
    mem[1049] <= 16'h0000; // 0x80001064
    mem[1050] <= 16'h0000; // 0x80001068
    mem[1051] <= 16'h0000; // 0x8000106c
    mem[1052] <= 16'h0000; // 0x80001070
    mem[1053] <= 16'h0000; // 0x80001074
    mem[1054] <= 16'h0000; // 0x80001078
    mem[1055] <= 16'h0000; // 0x8000107c
    mem[1056] <= 16'h0000; // 0x80001080
    mem[1057] <= 16'h0000; // 0x80001084
    mem[1058] <= 16'h0000; // 0x80001088
    mem[1059] <= 16'h0000; // 0x8000108c
    mem[1060] <= 16'h0000; // 0x80001090
    mem[1061] <= 16'h0000; // 0x80001094
    mem[1062] <= 16'h0000; // 0x80001098
    mem[1063] <= 16'h0000; // 0x8000109c
    mem[1064] <= 16'h0000; // 0x800010a0
    mem[1065] <= 16'h0000; // 0x800010a4
    mem[1066] <= 16'h0000; // 0x800010a8
    mem[1067] <= 16'h0000; // 0x800010ac
    mem[1068] <= 16'h0000; // 0x800010b0
    mem[1069] <= 16'h0000; // 0x800010b4
    mem[1070] <= 16'h0000; // 0x800010b8
    mem[1071] <= 16'h0000; // 0x800010bc
    mem[1072] <= 16'h0000; // 0x800010c0
    mem[1073] <= 16'h0000; // 0x800010c4
    mem[1074] <= 16'h0000; // 0x800010c8
    mem[1075] <= 16'h0000; // 0x800010cc
    mem[1076] <= 16'h0000; // 0x800010d0
    mem[1077] <= 16'h0000; // 0x800010d4
    mem[1078] <= 16'h0000; // 0x800010d8
    mem[1079] <= 16'h0000; // 0x800010dc
    mem[1080] <= 16'h0000; // 0x800010e0
    mem[1081] <= 16'h0000; // 0x800010e4
    mem[1082] <= 16'h0000; // 0x800010e8
    mem[1083] <= 16'h0000; // 0x800010ec
    mem[1084] <= 16'h0000; // 0x800010f0
    mem[1085] <= 16'h0000; // 0x800010f4
    mem[1086] <= 16'h0000; // 0x800010f8
    mem[1087] <= 16'h0000; // 0x800010fc
    mem[1088] <= 16'h0000; // 0x80001100
    mem[1089] <= 16'h0000; // 0x80001104
 
 
//================================================================
//== Section  .data
//================================================================
    mem[2048] <= 16'h0000; // 0x80002000
    mem[2049] <= 16'h0001; // 0x80002004
    mem[2050] <= 16'hffff; // 0x80002008
    mem[2051] <= 16'hffff; // 0x8000200c
    mem[2052] <= 16'h0000; // 0x80002010
    mem[2053] <= 16'h0000; // 0x80002014
    mem[2054] <= 16'h0000; // 0x80002018
    mem[2055] <= 16'h0000; // 0x8000201c
    mem[2056] <= 16'hffff; // 0x80002020
    mem[2057] <= 16'hffff; // 0x80002024
    mem[2058] <= 16'hffff; // 0x80002028
    mem[2059] <= 16'hffff; // 0x8000202c
    mem[2060] <= 16'hffff; // 0x80002030
    mem[2061] <= 16'hffff; // 0x80002034
    mem[2062] <= 16'hffff; // 0x80002038
    mem[2063] <= 16'hffff; // 0x8000203c
    mem[2064] <= 16'hffff; // 0x80002040
    mem[2065] <= 16'hffff; // 0x80002044
    mem[2066] <= 16'hffff; // 0x80002048
    mem[2067] <= 16'hffff; // 0x8000204c
    mem[2068] <= 16'hffff; // 0x80002050
    mem[2069] <= 16'hffff; // 0x80002054
    mem[2070] <= 16'hffff; // 0x80002058
    mem[2071] <= 16'hffff; // 0x8000205c
    mem[2072] <= 16'hffff; // 0x80002060
    mem[2073] <= 16'hffff; // 0x80002064
    mem[2074] <= 16'hffff; // 0x80002068
    mem[2075] <= 16'hffff; // 0x8000206c
    mem[2076] <= 16'hffff; // 0x80002070
    mem[2077] <= 16'hffff; // 0x80002074
    mem[2078] <= 16'hffff; // 0x80002078
    mem[2079] <= 16'hffff; // 0x8000207c
    mem[2080] <= 16'hffff; // 0x80002080
    mem[2081] <= 16'hffff; // 0x80002084
    mem[2082] <= 16'hffff; // 0x80002088
    mem[2083] <= 16'hffff; // 0x8000208c
    mem[2084] <= 16'hffff; // 0x80002090
    mem[2085] <= 16'hffff; // 0x80002094
    mem[2086] <= 16'hffff; // 0x80002098
    mem[2087] <= 16'hffff; // 0x8000209c
    mem[2088] <= 16'hffff; // 0x800020a0
    mem[2089] <= 16'hffff; // 0x800020a4
    mem[2090] <= 16'hffff; // 0x800020a8
    mem[2091] <= 16'hffff; // 0x800020ac
    mem[2092] <= 16'hffff; // 0x800020b0
    mem[2093] <= 16'hffff; // 0x800020b4
    mem[2094] <= 16'hffff; // 0x800020b8
    mem[2095] <= 16'hffff; // 0x800020bc
 
 
end
endmodule
