module if_stage_tb;
    reg clk;
    reg [31:0] pcin;
    reg PCSrc;
    wire [31:0] pcout, npcout, instrout;

    if_stage uut(
        .clk(clk), 
        .pcin(pcin), 
        .PCSrc(PCSrc), 
        .pcout(pcout), 
        .npcout(npcout), 
        .instrout(instrout)
    );
    
    initial
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        clk = 0; 
        pcin = 0; 
        PCSrc = 0;
        #10 
        
        PCSrc = 1;
        pcin = 32'h2;
        #10 
        
        PCSrc = 0; 
        pcin = 32'h4;
        #10 
        
        PCSrc = 1; 
        pcin = 32'h8;
        #10
        
        PCSrc = 0;
        #30 
        
        $stop;
    end

endmodule
