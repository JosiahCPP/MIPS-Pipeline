module if_id_latch_tb;
    reg clk;
    reg [31:0] npc;
    reg [31:0] instr;
    wire [31:0] npcout;
    wire [31:0] instrout;

    if_id_latch uut (
        .clk(clk),
        .npc(npc),
        .instr(instr),
        .npcout(npcout),
        .instrout(instrout)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        npc = 32'h00000000;
        instr = 32'h00000000;

        // case 1: Load new values
        #10 npc = 32'h12345678; instr = 32'h87654321; 
        #10 npc = 32'hDEADBEEF; instr = 32'hCAFEBABE; 

        // case 2: Hold values
        #20 npc = 32'h00000000; instr = 32'h00000000; 

        #20 $finish;
    end

endmodule
