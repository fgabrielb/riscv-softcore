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
		7'b 0110011: begin // R-format
			alu_src = 0;
			mem_to_reg = 0;
			reg_write = 1;
			mem_read = 0;
			mem_write = 0;
			branch = 0;
			alu_op = 2'b10;
		end
		7'b0000011: begin // ld
			alu_src = 1;
			mem_to_reg = 1;
			reg_write = 1;
			mem_read = 1;
			mem_write = 0;
			branch = 0;
			alu_op = 2'b00;
		end
		7'b0100011: begin // sd
			alu_src = 1;
			mem_to_reg = 0; // don't care bit
			reg_write = 0;
			mem_read = 0;
			mem_write = 1;
			branch = 0;
			alu_op = 2'b00;
		end
		7'b1100011: begin // beq
			alu_src = 0;
			mem_to_reg = 0;
			reg_write = 0;
			mem_read = 0;
			mem_write = 0;
			branch = 1;
			alu_op = 2'b01;
		end
	endcase
end
endmodule
			
