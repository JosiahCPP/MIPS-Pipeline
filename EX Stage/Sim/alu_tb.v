module alu_tb;
    reg [31:0] a;
    reg [31:0] b;
    reg [2:0] control;
    wire [31:0] result;
    wire zero;

    alu uut (
        .a(a),
        .b(b),
        .control(control),
        .result(result),
        .zero(zero)
    );

    initial begin
        // case 1: Add (control = 010)
        a = 32'd10; b = 32'd15; control = 3'b010; #10;

        // case 2: Subtract (control = 110)
        a = 32'd20; b = 32'd20; control = 3'b110; #10;

        // case 3: AND (control = 000)
        a = 32'hF0F0F0F0; b = 32'h0F0F0F0F; control = 3'b000; #10;

        // case 4: OR (control = 001)
        a = 32'hAAAA5555; b = 32'h5555AAAA; control = 3'b001; #10;

        // case 5: Set less than (control = 111)
        a = 32'd10; b = 32'd20; control = 3'b111; #10;

        $finish;
    end

endmodule
