module ex_mem_latch_tb;
    // Inputs
    reg clk;
    reg [1:0] ctlwb_in, ctlm_in;
    reg [31:0] adder_in, alu_result_in, rdata2_in;
    reg [4:0] muxout_in;
    wire [1:0] ctlwb_out, ctlm_out;
    wire [31:0] adder_out, alu_result_out, rdata2_out;
    wire [4:0] muxout_out;

    ex_mem_latch uut (
        .clk(clk),
        .ctlwb_in(ctlwb_in),
        .ctlm_in(ctlm_in),
        .adder_in(adder_in),
        .alu_result_in(alu_result_in),
        .rdata2_in(rdata2_in),
        .muxout_in(muxout_in),
        .ctlwb_out(ctlwb_out),
        .ctlm_out(ctlm_out),
        .adder_out(adder_out),
        .alu_result_out(alu_result_out),
        .rdata2_out(rdata2_out),
        .muxout_out(muxout_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        ctlwb_in = 2'b01; ctlm_in = 2'b10;
        adder_in = 32'h12345678; alu_result_in = 32'hABCDEF01; rdata2_in = 32'h0F0F0F0F;
        muxout_in = 5'h1A;

        #10;

        // Change inputs to observe latch behavior
        ctlwb_in = 2'b11; ctlm_in = 2'b00;
        adder_in = 32'h87654321; alu_result_in = 32'hFEDCBA98; rdata2_in = 32'h00FF00FF;
        muxout_in = 5'h0F;

        #10; 

        $finish;
    end

endmodule
