module mem_wb_latch_tb;
    reg clk;
    reg [31:0] ALUResult_in;
    reg [31:0] ReadData_in;
    reg [4:0] WriteReg_in;
    reg [1:0] WBControl_in;
    wire [31:0] ALUResult_out;
    wire [31:0] ReadData_out;
    wire [4:0] WriteReg_out;
    wire [1:0] WBControl_out;

    mem_wb_latch uut (
        .clk(clk),
        .ALUResult_in(ALUResult_in),
        .ReadData_in(ReadData_in),
        .WriteReg_in(WriteReg_in),
        .WBControl_in(WBControl_in),
        .ALUResult_out(ALUResult_out),
        .ReadData_out(ReadData_out),
        .WriteReg_out(WriteReg_out),
        .WBControl_out(WBControl_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        ALUResult_in = 32'h12345678;
        ReadData_in = 32'hABCDEF01;
        WriteReg_in = 5'h1F;
        WBControl_in = 2'b10;

        #10;
      
        ALUResult_in = 32'h87654321;
        ReadData_in = 32'hFEDCBA98;
        WriteReg_in = 5'h0A;
        WBControl_in = 2'b01;

        #10; 

        $finish;
    end

endmodule
