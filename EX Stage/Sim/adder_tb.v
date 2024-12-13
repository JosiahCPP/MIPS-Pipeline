module adder_tb;
    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] result;

    adder uut (
        .a(a),
        .b(b),
        .result(result)
    );

    initial begin
        // case 1: Add two positive numbers
        a = 32'd10; b = 32'd20; #10;

        // case 2: Add a positive and a negative number
        a = 32'd15; b = -32'd5; #10;

        // case 3: Add two negative numbers
        a = -32'd10; b = -32'd20; #10;

        // case 4: Add zero to a number
        a = 32'd0; b = 32'd50; #10;

        $finish;
    end

endmodule
