module control_unit_tb;
    reg [5:0] opcode;
    wire [3:0] EX;
    wire [2:0] M;
    wire [1:0] WB;

    control_unit uut (
        .opcode(opcode),
        .EX(EX),
        .M(M),
        .WB(WB)
    );

    initial begin
        // case 1: R-type instruction
        opcode = 6'b000000; #10;

        // case 2: Load Word (LW)
        opcode = 6'b100011; #10;

        // case 3: Store Word (SW)
        opcode = 6'b101011; #10;

        // case 4: Branch Equal (BEQ)
        opcode = 6'b000100; #10;

        // case 5: Default case (NOP/unknown opcode)
        opcode = 6'b111111; #10;

        $finish;
    end

endmodule
