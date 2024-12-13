module mux_32(
    input [31:0] a, 
    input [31:0] b, 
    input sel, 
    output [31:0] y
);
    // 32-bit multiplexer selecting between inputs a and b based on sel
    assign y = sel ? b : a;
endmodule
