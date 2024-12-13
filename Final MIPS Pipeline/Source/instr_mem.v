module instr_mem(
    input [7:0] addr,
    output [31:0] instr_out
);
    reg [31:0] memory [0:255];

    initial begin
        $readmemh("instr_mem.txt", memory); // Load instructions
    end

    assign instr_out = memory[addr];
    
endmodule
