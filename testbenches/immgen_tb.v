module immgen_tb;

reg [31:0] instruction;
wire [31:0] imm;

immgen immgen_module (
    .instruction(instruction),
    .imm(imm)
);

initial begin
    $monitor("Imediate: 0x%0h", imm);

    instruction = 32'h00500093; // addi x1, x0, 5
    #10;    // the immediate must be 0x00000005

    instruction = 32'h008000EF; // jal x1, 8
    #10;    // the immediate must be 0x00000008

    instruction = 32'h123450B7; // lui x1, 0x12345
    #10;    // the immediate must be 0x12345000

    instruction = 32'h0020A223; // sw x2, 4(x1)
    #10;    // the immediate must be 0x00000004

    instruction = 32'h00208463; // beq x1, x2, 8
    #10;    // the immediate must be 0x00000008

    $finish;
end
endmodule
