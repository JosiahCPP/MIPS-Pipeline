module mux_5_tb;
    reg [4:0] a;
    reg [4:0] b;
    reg sel;
    wire [4:0] y;

    mux_5 uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        // case 1: sel = 0, output should be a
        a = 5'b10101; b = 5'b01010; sel = 0; #10;

        // case 2: sel = 1, output should be b
        sel = 1; #10;

        // case 3: Different inputs with sel = 0
        a = 5'b11100; b = 5'b00011; sel = 0; #10;

        // case 4: Different inputs with sel = 1
        sel = 1; #10;

        $finish;
    end

endmodule
