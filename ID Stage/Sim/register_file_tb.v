module register_file_tb;
    reg clk;
    reg rst;
    reg regwrite;
    reg [4:0] rs, rt, rd;
    reg [31:0] writedata;
    wire [31:0] A, B;

    register_file uut (
        .clk(clk),
        .rst(rst),
        .regwrite(regwrite),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .writedata(writedata),
        .A(A),
        .B(B)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        rst = 1; regwrite = 0; rs = 5'd0; rt = 5'd1; rd = 5'd0; writedata = 32'b0;
        #10 rst = 0;

        // case 1: Write to register rd and read it back
        regwrite = 1; rd = 5'd2; writedata = 32'h12345678; #10;
        regwrite = 0; rs = 5'd2; rt = 5'd1; #10;

        // case 2: Reset all registers
        rst = 1; #10 rst = 0;

        // case 3: Write to another register
        regwrite = 1; rd = 5'd3; writedata = 32'h87654321; #10;
        regwrite = 0; rs = 5'd3; rt = 5'd0; #10;

        $finish;
    end

endmodule
