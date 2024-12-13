module mux_tb;
    reg [31:0] a;
    reg [31:0] b;
    reg sel;
    wire [31:0] y;

    mux uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        //case 1: sel = 0, output should be a
        a = 32'hAAAAAAAA; b = 32'h55555555; sel = 0; #10;

        //case 2: sel = 1, output should be b
        sel = 1; #10;

        //case 3: Test with different inputs, sel = 0
        a = 32'h12345678; b = 32'h87654321; sel = 0; #10;

        //case 4: Test with different inputs, sel = 1
        sel = 1; #10;
      
        $finish;
    end

endmodule
