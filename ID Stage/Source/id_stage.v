module id_stage(
    input clk,
    input rst,
    input [31:0] instr, 
    input [31:0] if_id_npc, 
    input [31:0] mem_wb_writedata, 
    input regWrite, 
    output [1:0] id_ex_wb, 
    output [2:0] id_ex_m, 
    output [3:0] id_ex_ex, 
    output [31:0] id_ex_npc, 
    output [31:0] id_ex_reg1, 
    output [31:0] id_ex_reg2, 
    output [31:0] id_ex_sign_ext, 
    output [4:0] id_ex_instr20_16, // Instruction[20:16] to ID/EX latch
    output [4:0] id_ex_instr15_11 // Instruction[15:11] to ID/EX latch
);

    // Internal signals
    wire [15:0] imm = instr[15:0]; 
    wire [5:0] opcode = instr[31:26]; 
    wire [4:0] rs = instr[25:21]; 
    wire [4:0] rt = instr[20:16]; 
    wire [4:0] rd = instr[15:11]; 
    wire [1:0] wb;
    wire [2:0] m;
    wire [3:0] ex;
    wire [31:0] reg1_out, reg2_out;
    wire [31:0] sign_ext_out;
    
    // Sign-Extend Unit
    sign_extend SE(.in(imm), .out(sign_ext_out));

    // Control Unit
    control_unit CU(
        .opcode(opcode), 
        .EX(ex), 
        .M(m), 
        .WB(wb)
    );

    // Register File
    register_file RF(
        .clk(clk), 
        .rst(rst), 
        .regwrite(regWrite), 
        .rs(rs), 
        .rt(rt), 
        .rd(rd), 
        .writedata(mem_wb_writedata), 
        .A(reg1_out), 
        .B(reg2_out)
    );

// ID/EX Pipeline Register
    id_ex_latch ID_EX(
        .clk(clk),
        .rst(rst),
        .ctlwb_out(wb),
        .ctlm_out(m),
        .ctlex_out(ex),
        .npc(if_id_npc),
        .readdat1(reg1_out),
        .readdat2(reg2_out),
        .signext_out(sign_ext_out),
        .instr_2016(rt),
        .instr_1511(rd),
        .wb_ctlout(id_ex_wb),
        .m_ctlout(id_ex_m),
        .ex_ctlout(id_ex_ex),
        .npcout(id_ex_npc),
        .rdata1out(id_ex_reg1),
        .rdata2out(id_ex_reg2),
        .s_extendedout(id_ex_sign_ext),
        .instrout_2016(id_ex_instr20_16),
        .instrout_1511(id_ex_instr15_11)
    );

endmodule
