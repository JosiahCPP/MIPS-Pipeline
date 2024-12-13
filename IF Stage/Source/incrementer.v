module incrementer(
    input [31:0] pc,
    output [31:0] npc
);
    assign npc = pc + 1;
endmodule
