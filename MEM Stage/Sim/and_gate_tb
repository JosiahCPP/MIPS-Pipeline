module and_gate_tb;
    reg Branch;
    reg Zero;
    wire PCSrc;

    and_gate uut (
        .Branch(Branch),
        .Zero(Zero),
        .PCSrc(PCSrc)
    );

    initial begin
        // case 1: Branch = 0, Zero = 0
        Branch = 0; Zero = 0; #10;
        
        // case 2: Branch = 0, Zero = 1
        Branch = 0; Zero = 1; #10;

        // Tcase 3: Branch = 1, Zero = 0
        Branch = 1; Zero = 0; #10;

        // case 4: Branch = 1, Zero = 1
        Branch = 1; Zero = 1; #10;

        $finish;
    end

endmodule
