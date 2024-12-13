module wb_stage(
    input [31:0] mem_Read_Data,
    input [31:0] mem_ALU_result,
    input MemtoReg,
    output [31:0] wb_data
);
    assign wb_data = MemtoReg ? mem_ALU_result : mem_Read_Data;
endmodule
