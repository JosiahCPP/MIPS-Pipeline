module pc_tb;
    reg clk;
    reg [31:0] pcin;
    wire [31:0] pcout;

    pc uut (
        .clk(clk),
        .pcin(pcin),
        .pcout(pcout)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        pcin = 0;

        // Apply test cases
        #10 pcin = 32'h00000004; // Test increment to 4
        #10 pcin = 32'h00000008; // Test increment to 8
        #10 pcin = 32'h0000000C; // Test increment to 12

        #20;

        $finish;
    end

endmodule
