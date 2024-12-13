module ex_mem_latch(
    input clk,
    input [1:0] ctlwb_in, ctlm_in,
    input [31:0] adder_in, alu_result_in, rdata2_in,
    input [4:0] muxout_in,
    output reg [1:0] ctlwb_out, ctlm_out,
    output reg [31:0] adder_out, alu_result_out, rdata2_out,
    output reg [4:0] muxout_out
);
    // Pipeline register to hold EX/MEM stage values.
    always @(posedge clk) begin
        ctlwb_out <= ctlwb_in;
        ctlm_out <= ctlm_in;
        adder_out <= adder_in;
        alu_result_out <= alu_result_in;
        rdata2_out <= rdata2_in;
        muxout_out <= muxout_in;
    end
endmodule
