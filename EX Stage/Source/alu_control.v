module alu_control(
    input [1:0] alu_op, 
    input [5:0] funct, 
    output reg [2:0] select
);
    // ALU control logic to generate control signals based on ALUOp and function code.
    always @(*) begin
        case (alu_op)
            2'b00: select = 3'b010; // Add
            2'b01: select = 3'b110; // Subtract
            2'b10: case (funct)
                      6'b100000: select = 3'b010; // Add
                      6'b100010: select = 3'b110; // Subtract
                      6'b100100: select = 3'b000; // AND
                      6'b100101: select = 3'b001; // OR
                      6'b101010: select = 3'b111; // Set less than
                      default: select = 3'bxxx;
                   endcase
            default: select = 3'bxxx;
        endcase
    end
endmodule
