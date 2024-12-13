module alu_control_tb;
    reg [1:0] alu_op;
    reg [5:0] funct;
    wire [2:0] select;

    alu_control uut (
        .alu_op(alu_op),
        .funct(funct),
        .select(select)
    );

    initial begin
        // case 1: ALUOp = 00 (Add operation)
        alu_op = 2'b00; 
        funct = 6'bxxxxxx; #10;

        // ase 2: ALUOp = 01 (Subtract operation)
        alu_op = 2'b01; 
        funct = 6'bxxxxxx; #10;

        // case 3: ALUOp = 10, funct = 100000 (Add)
        alu_op = 2'b10; 
        funct = 6'b100000; #10;

        // case 4: ALUOp = 10, funct = 100010 (Subtract)
        alu_op = 2'b10; 
        funct = 6'b100010; #10;

        // case 5: ALUOp = 10, funct = 100100 (AND)
        alu_op = 2'b10; 
        funct = 6'b100100; #10;

        // case 6: ALUOp = 10, funct = 100101 (OR)
        alu_op = 2'b10; 
        funct = 6'b100101; #10;

        // case 7: ALUOp = 10, funct = 101010 (Set less than)
        alu_op = 2'b10; 
        funct = 6'b101010; #10;

        $finish;
    end

endmodule
