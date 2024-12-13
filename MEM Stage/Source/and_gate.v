module and_gate(
    input Branch,
    input Zero,
    output PCSrc
);
    assign PCSrc = Branch & Zero;
endmodule
