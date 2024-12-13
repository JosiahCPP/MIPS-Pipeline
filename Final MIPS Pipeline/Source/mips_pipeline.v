module mips_pipeline(
    input clk,
    input rst
);
    // Inter-stage connections
    wire [31:0] pc, npc, instr;
    wire [31:0] if_id_npc, if_id_instr;
    wire [31:0] id_ex_npc, id_ex_reg1, id_ex_reg2, id_ex_sign_ext;
    wire [4:0] id_ex_instr20_16, id_ex_instr15_11;
    wire [1:0] id_ex_wb;
    wire [2:0] id_ex_m;
    wire [3:0] id_ex_ex;
    wire [31:0] ex_mem_alu_result, ex_mem_rdata2, ex_mem_adder_out;
    wire [4:0] ex_mem_muxout;
    wire [1:0] ex_mem_wb;
    wire [2:0] ex_mem_m;
    wire [31:0] mem_wb_alu_result, mem_wb_read_data;
    wire [4:0] mem_wb_write_reg;
    wire [1:0] mem_wb_wb;
    wire [31:0] wb_write_data;

    wire [31:0] instr_mem_out;

    instr_mem INSTR_MEM(
        .addr(pc[9:2]),
        .instr_out(instr_mem_out)
    );

    // IF Stage
    if_stage IF_STAGE(
        .clk(clk),
        .pcin(pc),
        .PCSrc(ex_mem_m[2]),
        .pcout(pc),
        .npcout(npc),
        .instrout(instr_mem_out)
    );

    // IF/ID Latch
    if_id_latch IF_ID_LATCH(
        .clk(clk),
        .npc(npc),
        .instr(instr_mem_out),
        .npcout(if_id_npc),
        .instrout(if_id_instr)
    );

    // ID Stage
    id_stage ID_STAGE(
        .clk(clk),
        .rst(rst),
        .instr(if_id_instr),
        .if_id_npc(if_id_npc),
        .mem_wb_writedata(wb_write_data),
        .regWrite(mem_wb_wb[1]),
        .id_ex_wb(id_ex_wb),
        .id_ex_m(id_ex_m),
        .id_ex_ex(id_ex_ex),
        .id_ex_npc(id_ex_npc),
        .id_ex_reg1(id_ex_reg1),
        .id_ex_reg2(id_ex_reg2),
        .id_ex_sign_ext(id_ex_sign_ext),
        .id_ex_instr20_16(id_ex_instr20_16),
        .id_ex_instr15_11(id_ex_instr15_11)
    );

    // EX Stage
    ex_stage EX_STAGE(
        .clk(clk),
        .ctlwb_in(id_ex_wb),
        .ctlm_in(id_ex_m),
        .npc(id_ex_npc),
        .rdata1(id_ex_reg1),
        .rdata2(id_ex_reg2),
        .s_extend(id_ex_sign_ext),
        .instr_2016(id_ex_instr20_16),
        .instr_1511(id_ex_instr15_11),
        .alu_op(id_ex_ex[1:0]),
        .funct(id_ex_sign_ext[5:0]),
        .alusrc(id_ex_ex[2]),
        .regdst(id_ex_ex[3]),
        .ctlwb_out(ex_mem_wb),
        .ctlm_out(ex_mem_m),
        .adder_out(ex_mem_adder_out),
        .alu_result_out(ex_mem_alu_result),
        .rdata2_out(ex_mem_rdata2),
        .muxout_out(ex_mem_muxout)
    );

    // MEM Stage
    mem_stage MEM_STAGE(
        .clk(clk),
        .ALUResult(ex_mem_alu_result),
        .WriteData(ex_mem_rdata2),
        .WriteReg(ex_mem_muxout),
        .WBControl(ex_mem_wb),
        .MemWrite(ex_mem_m[0]),
        .MemRead(ex_mem_m[1]),
        .Branch(ex_mem_m[2]),
        .Zero(ex_mem_alu_result == 0),
        .ReadData(mem_wb_read_data),
        .ALUResult_out(mem_wb_alu_result),
        .WriteReg_out(mem_wb_write_reg),
        .WBControl_out(mem_wb_wb),
        .PCSrc()
    );

    // WB Stage
    wb_stage WB_STAGE(
        .mem_Read_Data(mem_wb_read_data),
        .mem_ALU_result(mem_wb_alu_result),
        .MemtoReg(mem_wb_wb[0]),
        .wb_data(wb_write_data)
    );
endmodule
