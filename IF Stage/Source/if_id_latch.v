module if_id_latch(
    input clk,
    input [31:0] npc,
    input [31:0] instr,
    output reg [31:0] npcout,
    output reg [31:0] instrout
);
    initial begin
        npcout = 0;
        instrout = 0;
    end

    always @(posedge clk) begin
        npcout <= npc;
        instrout <= instr;
    end
endmodule
