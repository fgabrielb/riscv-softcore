module registers (
	input clock,
	input reg_write_enable,
	
	input [4:0] read_reg_1,
	input [4:0] read_reg_2,
	output [31:0] read_reg_data_1,
	output [31:0] read_reg_data_2,
	
	input [4:0] write_reg,
	input [31:0] write_reg_data
);

reg [31:0] registers [0:31];

always @(posedge clock) begin
	if (reg_write_enable && write_reg) begin
		registers[write_reg] <= write_reg_data;
	end
end

assign read_reg_data_1 = (read_reg_1) ? registers[read_reg_1] : 32'b0;
assign read_reg_data_2 = (read_reg_2) ? registers[read_reg_2] : 32'b0;

endmodule

