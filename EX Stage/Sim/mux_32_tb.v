module mux_32_tb;
    reg [31:0] a;
    reg [31:0] b;
    reg sel;
    wire [31:0] y;

    mux_32 uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    // Test procedure
    initial begin
        // case 1: sel = 0, output should be a
        a = 32'hAAAAAAAA; b = 32'h55555555; sel = 0; #10;

        // case 2: sel = 1, output should be b
        sel = 1; #10;

        // case 3: Different inputs with sel = 0
        a = 32'h12345678; b = 32'h87654321; sel = 0; #10;

        // case 4: Different inputs with sel = 1
        sel = 1; #10;

        $finish;
    end

endmodule
