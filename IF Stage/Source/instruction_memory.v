module instruction_memory(
    input [31:0] addr,
    output [31:0] data
);
    reg [31:0] memory [0:127]; // 128 32-bit words

    initial begin
        // Initialize first 10 words of memory
        memory[0] = 32'hA00000AA;
        memory[1] = 32'h10000011;
        memory[2] = 32'h20000022;
        memory[3] = 32'h30000033;
        memory[4] = 32'h40000044;
        memory[5] = 32'h50000055;
        memory[6] = 32'h60000066;
        memory[7] = 32'h70000077;
        memory[8] = 32'h80000088;
        memory[9] = 32'h90000099;
    end

    assign data = memory[addr[6:0]]; // Use 7 LSB for address
endmodule
