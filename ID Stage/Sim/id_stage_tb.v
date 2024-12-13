module id_stage_tb;

    // Testbench signals
    reg clk;
    reg rst;
    reg [31:0] instr;
    reg [31:0] if_id_npc;
    reg [31:0] mem_wb_writedata;
    reg regWrite;
    
    // Outputs from the id_stage module
    wire [1:0] id_ex_wb;
    wire [2:0] id_ex_m;
    wire [3:0] id_ex_ex;
    wire [31:0] id_ex_npc;
    wire [31:0] id_ex_reg1;
    wire [31:0] id_ex_reg2;
    wire [31:0] id_ex_sign_ext;
    wire [4:0] id_ex_instr20_16;
    wire [4:0] id_ex_instr15_11;
    
    id_stage uut (
        .clk(clk),
        .rst(rst),
        .instr(instr),
        .if_id_npc(if_id_npc),
        .mem_wb_writedata(mem_wb_writedata),
        .regWrite(regWrite),
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
    
    always begin
        #5 clk = ~clk; 
    end
    
    initial begin
        // Initialize signals
        clk = 0;
        rst = 0;
        instr = 32'h00000000;  // Default instruction
        if_id_npc = 32'h10000000;  // Arbitrary next PC value
        mem_wb_writedata = 32'h00000000;  // No write data
        regWrite = 0;  // No write operation
        
        // reset
        rst = 1;
        #10;
        rst = 0;
        
        // case 1: Load instruction (example opcode 0x23 for lw)
        instr = 32'h8C120000;  // lw $t0, 0($a0) (example instruction)
        #10;
        
        // case 2: R-type instruction (example opcode 0x00 for add)
        instr = 32'h00000020;  // add $a0, $a1, $a2 (example instruction)
        #10;
        
        // case 3: Immediate instruction (example opcode 0x08 for addi)
        instr = 32'h21310010;  // addi $t0, $t1, 16 (example instruction)
        #10;
        
        // case 4: Branch instruction (example opcode 0x04 for beq)
        instr = 32'h10000002;  // beq $zero, $zero, 8 (example instruction)
        #10;
        
        // case 5: Store instruction (example opcode 0x2B for sw)
        instr = 32'hAD120000;  // sw $t0, 0($a0) (example instruction)
        #10;

        $finish;
    end
    
endmodule
