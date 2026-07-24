module control (
	input [6:0] opcode,
	
	output branch,
	output mem_read,
	output mem_to_reg,
	output [1:0] alu_op,
	output mem_write,
	output alu_src,
	output reg_write
);

always @(*) begin
	case (opcode)
		7'b 0110011: begin
			alu_src = 0;
			mem_to_reg = 0;
			reg_write = 1;
			mem_read = 0;
			mem_write = 0;
			branch = 0;
			
