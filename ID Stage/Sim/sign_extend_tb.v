module sign_extend_tb;
    reg [15:0] in;
    wire [31:0] out;

    sign_extend uut (
        .in(in),
        .out(out)
    );

    initial begin
        // case 1: Positive number
        in = 16'h1234; #10;

        // case 2: Negative number
        in = 16'hF000; #10;

        // case 3: Zero
        in = 16'h0000; #10;

        // case 4: Largest positive number
        in = 16'h7FFF; #10;

        // case 5: Smallest negative number
        in = 16'h8000; #10;

        $finish;
    end

endmodule
