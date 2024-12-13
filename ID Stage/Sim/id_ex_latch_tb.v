module id_ex_latch_tb;
    reg clk;
    reg rst;
    reg [1:0] ctlwb_out;
    reg [2:0] ctlm_out;
    reg [3:0] ctlex_out;
    reg [31:0] npc;
    reg [31:0] readdat1;
    reg [31:0] readdat2;
    reg [31:0] signext_out;
    reg [4:0] instr_2016;
    reg [4:0] instr_1511;
    wire [1:0] wb_ctlout;
    wire [2:0] m_ctlout;
    wire [3:0] ex_ctlout;
    wire [31:0] npcout;
    wire [31:0] rdata1out;
    wire [31:0] rdata2out;
    wire [31:0] s_extendedout;
    wire [4:0] instrout_2016;
    wire [4:0] instrout_1511;

    id_ex_latch uut (
        .clk(clk),
        .rst(rst),
        .ctlwb_out(ctlwb_out),
        .ctlm_out(ctlm_out),
        .ctlex_out(ctlex_out),
        .npc(npc),
        .readdat1(readdat1),
        .readdat2(readdat2),
        .signext_out(signext_out),
        .instr_2016(instr_2016),
        .instr_1511(instr_1511),
        .wb_ctlout(wb_ctlout),
        .m_ctlout(m_ctlout),
        .ex_ctlout(ex_ctlout),
        .npcout(npcout),
        .rdata1out(rdata1out),
        .rdata2out(rdata2out),
        .s_extendedout(s_extendedout),
        .instrout_2016(instrout_2016),
        .instrout_1511(instrout_1511)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        rst = 1;
        ctlwb_out = 2'b0;
        ctlm_out = 3'b0;
        ctlex_out = 4'b0;
        npc = 32'b0;
        readdat1 = 32'b0;
        readdat2 = 32'b0;
        signext_out = 32'b0;
        instr_2016 = 5'b0;
        instr_1511 = 5'b0;
        #10 rst = 0;

        // case 1: Load values
        ctlwb_out = 2'b11;
        ctlm_out = 3'b101;
        ctlex_out = 4'b1100;
        npc = 32'h12345678;
        readdat1 = 32'hAABBCCDD;
        readdat2 = 32'h11223344;
        signext_out = 32'h0000FFFF;
        instr_2016 = 5'b10101;
        instr_1511 = 5'b01010;
        #10;

        // case 2: Reset
        rst = 1; #10 rst = 0;

        // case 3: Change values
        ctlwb_out = 2'b01;
        ctlm_out = 3'b011;
        ctlex_out = 4'b0011;
        npc = 32'h87654321;
        readdat1 = 32'h55667788;
        readdat2 = 32'h99AABBCC;
        signext_out = 32'hFFFF0000;
        instr_2016 = 5'b11111;
        instr_1511 = 5'b00001;
        #10;

        $finish;
    end

endmodule
