module mem_stage_tb();
    reg clk;
    reg [31:0] ALUResult, WriteData;
    reg [4:0] WriteReg;
    reg [1:0] WBControl;
    reg MemWrite, MemRead, Branch, Zero;
    wire [31:0] ReadData, ALUResult_out;
    wire [4:0] WriteReg_out;
    wire [1:0] WBControl_out;
    wire PCSrc;

    mem_stage uut (
        .clk(clk),
        .ALUResult(ALUResult),
        .WriteData(WriteData),
        .WriteReg(WriteReg),
        .WBControl(WBControl),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .Branch(Branch),
        .Zero(Zero),
        .ReadData(ReadData),
        .ALUResult_out(ALUResult_out),
        .WriteReg_out(WriteReg_out),
        .WBControl_out(WBControl_out),
        .PCSrc(PCSrc)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Test 1: Simple Memory Read
    ALUResult = 32'h00000004;
    WriteData = 32'h12345678;
    WriteReg = 5'h02;
    WBControl = 2'b01;
    MemWrite = 0;
    MemRead = 1;
    Branch = 0;
    Zero = 0;

    #10; // Wait for memory read

    // Test 2: Memory Write
    MemWrite = 1;
    MemRead = 0;
    #10; // Allow write to occur
    MemWrite = 0;
    MemRead = 1;
    #10; // Verify write by reading back

    // Test 3: Branch Taken
    Branch = 1;
    Zero = 1;
    #10; // Check PCSrc

    $finish;
end
endmodule

