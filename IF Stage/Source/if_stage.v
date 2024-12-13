module if_stage(
    input clk,
    input [31:0] pcin,
    input PCSrc,
    output [31:0] pcout,
    output [31:0] npcout,
    output [31:0] instrout
);
    wire [31:0] pc, npc, instr, pc_next;

    pc PC1(
        .clk(clk), 
        .pcin(pcin),
        .pcout(pc)
    );
    
    incrementer INC(
        .pc(pc), 
        .npc(npc)
    );
    
    instruction_memory IM(
        .addr(pc), 
        .data(instr)
    );
    
    mux M(
        .a(npc), 
        .b(pc), 
        .sel(PCSrc), 
        .y(pc_next)
    );
    
    if_id_latch LATCH(
        .clk(clk), 
        .npc(pc_next), 
        .instr(instr), 
        .npcout(npcout), 
        .instrout(instrout)
    );

    assign pcout = pc;
endmodule
