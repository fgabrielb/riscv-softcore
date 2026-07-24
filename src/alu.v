module alu (
	input [3:0] operation,
	input [32:0] a,
	input [32:0] b,
	
	output reg [32:0] result,
	output reg zero
);
always @(*) begin
	case (operation)
		4'b0000: result = a & b;
		4'b0001: result = a | b;
		4'b0010: result = a + b;
		4'b0110: result = a	- b;
	endcase
	
	zero = (result == 0) ? 1 : 0;
end 
endmodule
