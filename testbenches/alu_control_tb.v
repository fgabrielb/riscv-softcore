module alu_control_tb;

reg [1:0] alu_op;
reg [2:0] func3;
reg [6:0] func7;
reg [31:0] a, b;
wire [3:0] operation;
wire [31:0] result;
wire zero;


alu_control alu_control_module (
    .alu_op(alu_op),
    .func3(func3),
    .func7(func7),
    .operation(operation)
);

alu alu_module (
    .a(a),
    .b(b),
    .operation(operation),
    .result(result)
);

initial begin
    $monitor("Result: %0d", result);
    a = 7;
    b = 5;

    alu_op = 2'b00;
    #10;    // result must be 12

    alu_op = 2'b10;
    func3 = 3'b000;
    func7 = 7'b0000000;
    #10;    // result must be 12 again

    alu_op = 2'b01;
    #10;    // result must be 2

    alu_op = 2'b10;
    func3 = 3'b000;
    func7 = 7'b0100000;
    #10;    // result must be 2

    func3 = 3'b111;
    func7 = 7'b0000000;
    #10;    // result must be 5

    func3 = 3'b110;
    #10;    // result must be 7

    $finish;
end
endmodule
