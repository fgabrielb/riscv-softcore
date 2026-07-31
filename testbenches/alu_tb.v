module alu_tb;

reg [31:0] a, b;
reg [3:0] operation;

wire [31:0] result;
wire zero;

alu alu_module (
	.a(a),
	.b(b),
	.operation(operation),
	
	.result(result),
	.zero(zero)
);

initial begin
	$monitor("result: %0d | Zero: %0d", result, zero);
	
	
	operation = 4'b0000;
	a = 32'd2;
	b = 32'd6;
	#10;
	a = 32'd0;
	b = 32'd0;
	#10;
	operation = 4'b0001;
	a = 32'd6;
	b = 32'd7;
	#10;
	operation = 4'b0010;
	a = 32'd9;
	b = 32'd5;
	#10;
	operation = 4'b0110;
	a = 10;
	b = 3;
	#10;
	
	$finish;
end
endmodule
