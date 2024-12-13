module adder(
    input [31:0] a, 
    input [31:0] b, 
    output [31:0] result
);
    // 32-bit adder.
    assign result = a + b;
endmodule
