module control_unit(
    input wire [5:0] opcode, 
    output reg [3:0] EX,     
    output reg [2:0] M,      
    output reg [1:0] WB      
);

    // Define opcodes as parameters
    parameter RTYPE = 6'b000000; // R-format
    parameter LW     = 6'b100011; // Load Word
    parameter SW     = 6'b101011; // Store Word
    parameter BEQ    = 6'b000100; // Branch Equal

    always @(*) begin
        // Default control signals
        EX = 4'b0000; 
        M  = 3'b000;  
        WB = 2'b00;   

        // Set control signals based on opcode
        case (opcode)
            RTYPE: begin
                EX = 4'b1100; 
                M  = 3'b000;  
                WB = 2'b10;   
            end
            LW: begin
                EX = 4'b0010; 
                M  = 3'b010;  
                WB = 2'b11;   
            end
            SW: begin
                EX = 4'b0010;
                M  = 3'b001;  
                WB = 2'b00;   
            end
            BEQ: begin
                EX = 4'b0001; 
                M  = 3'b100;  
                WB = 2'b00;   
            end
            default: begin
                // (NOP)
                EX = 4'b0000;
                M  = 3'b000;
                WB = 2'b00;
            end
        endcase
    end
endmodule
