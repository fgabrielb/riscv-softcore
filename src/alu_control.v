module alu_control (
	input [1:0] alu_op,
	input [2:0] func3,
	input [6:0] func7,
	
	output reg [3:0] operation
);

always @(*) begin
	case (alu_op)
		2'b00: operation = 4'b0010;
		2'b01: operation = 4'b0110;
		2'b10: begin
			case({func3, func7[5]})
				4'b000_0: operation = 4'b0010;
				4'b000_1: operation = 4'b0110;
				4'b111_0: operation = 4'b0000;
				4'b110_0: operation = 4'b0001;
				default: operation = 4'b1111;
			endcase
		end
		default: operation = 4'b1111;
	endcase
endmodule
		
