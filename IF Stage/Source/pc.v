module pc(
    input clk,
    input [31:0] pcin,
    output reg [31:0] pcout
);
    initial pcout = 0; // Initialize PC to 0
    always @(posedge clk) begin
        pcout <= pcin;
    end
endmodule
