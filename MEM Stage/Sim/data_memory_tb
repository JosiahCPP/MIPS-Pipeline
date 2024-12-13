module data_memory_tb;
    reg [31:0] Address;
    reg [31:0] WriteData;
    reg MemWrite;
    reg MemRead;

    wire [31:0] ReadData;

    data_memory uut (
        .Address(Address),
        .WriteData(WriteData),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .ReadData(ReadData)
    );

    initial begin
        
      Address = 32'd4; 
      WriteData = 32'h0; 
      MemWrite = 0; 
      MemRead = 0;

        // case 1: Read predefined value from memory
        MemRead = 1; #10; MemRead = 0;

        // case 2: Write a value to memory and read it back
        MemWrite = 1; WriteData = 32'h12345678; #10; MemWrite = 0;
        MemRead = 1; #10; MemRead = 0;

        $finish;
    end

endmodule
