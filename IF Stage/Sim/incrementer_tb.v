module incrementer_tb;
    reg [31:0] pc;
    wire [31:0] npc;

    incrementer uut (
        .pc(pc),
        .npc(npc)
    );

    initial begin
        pc = 32'h00000000; #10; // Test increment from 0
        pc = 32'h00000001; #10; // Test increment from 1
        pc = 32'h0000FFFF; #10; // Test increment from a large value
        pc = 32'hFFFFFFFF; #10; // Test increment from maximum value (overflow case)

        $finish;
    end
    
endmodule
