module data_memory(
    input [31:0] Address,
    input [31:0] WriteData,
    input MemWrite,
    input MemRead,
    output reg [31:0] ReadData
);
    reg [31:0] memory [0:255];
    integer i;
    
    initial begin
        for (i = 0; i < 256; i = i + 1)
            memory[i] = 32'h0;
        // Example predefined values
        memory[4] = 32'hABCDEF01;
    end

    always @(*) begin
        if (MemRead)
            ReadData = memory[Address[7:0]];
    end

    always @(posedge MemWrite) begin
        memory[Address[7:0]] <= WriteData;
    end
endmodule
