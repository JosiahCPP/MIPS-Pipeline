module register_file(
    input clk,
    input rst,
    input regwrite,        
    input [4:0] rs,      
    input [4:0] rt,      
    input [4:0] rd,      
    input [31:0] writedata,    
    output reg [31:0] A,   
    output reg [31:0] B    
);
    reg [31:0] registers [31:0];
    integer i;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] <= 32'b0;
            end
        end else if (regwrite) begin
            registers[rd] <= writedata;
        end
    end

    always @(*) begin
        A = registers[rs];
        B = registers[rt];
    end
endmodule
