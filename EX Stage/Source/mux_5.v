module mux_5(
    input [4:0] a, 
    input [4:0] b, 
    input sel, 
    output [4:0] y
);
    // 5-bit multiplexer selecting between inputs a and b based on sel.
    assign y = sel ? b : a;
endmodule
