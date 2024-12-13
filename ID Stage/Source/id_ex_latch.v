module id_ex_latch (
    input clk,    
    input rst,                
    input wire [1:0] ctlwb_out,           
    input wire [2:0] ctlm_out,
    input wire [3:0] ctlex_out,
    input wire [31:0] npc,
    input wire [31:0] readdat1,
    input wire [31:0] readdat2,
    input wire [31:0] signext_out, 
    input wire [4:0] instr_2016,
    input wire [4:0] instr_1511,

    output reg [1:0] wb_ctlout,
    output reg [2:0] m_ctlout,
    output reg [3:0] ex_ctlout,
    output reg [31:0] npcout,
    output reg [31:0] rdata1out,
    output reg [31:0] rdata2out,
    output reg [31:0] s_extendedout,
    output reg [4:0] instrout_2016,
    output reg [4:0] instrout_1511
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            wb_ctlout <= 2'b0;
            m_ctlout <= 3'b0;
            ex_ctlout <= 4'b0;
            npcout <= 32'b0;
            rdata1out <= 32'b0;
            rdata2out <= 32'b0;
            s_extendedout <= 32'b0;
            instrout_2016 <= 5'b0;
            instrout_1511 <= 5'b0;
        end else begin
            wb_ctlout <= ctlwb_out;
            m_ctlout <= ctlm_out;
            ex_ctlout <= ctlex_out;
            npcout <= npc;
            rdata1out <= readdat1;
            rdata2out <= readdat2;
            s_extendedout <= signext_out;
            instrout_2016 <= instr_2016;
            instrout_1511 <= instr_1511;
        end
    end
endmodule
