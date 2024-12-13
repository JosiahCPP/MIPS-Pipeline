module alu(
    input [31:0] a, 
    input [31:0] b, 
    input [2:0] control, 
    output reg [31:0] result, 
    output reg zero
);
    // Arithmetic Logic Unit implementing various operations based on control input.
    always @(*) begin
        case (control)
            3'b010: result = a + b;       // Add
            3'b110: result = a - b;       // Subtract
            3'b000: result = a & b;       // AND
            3'b001: result = a | b;       // OR
            3'b111: result = (a < b) ? 1 : 0; // Set less than
            default: result = 32'bx;
        endcase
        zero = (result == 0) ? 1'b1 : 1'b0;
    end
endmodule
