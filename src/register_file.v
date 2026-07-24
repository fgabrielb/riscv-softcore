module register_file (
	input clock,
	input reg_write,
	
	input [4:0] read_addr_1,
	input [4:0] read_addr_2,
	output [31:0] read_data_1,
	output [31:0] read_data_2,
	
	input [4:0] write_addr,
	input [31:0] write_data
);

reg [31:0] registers [0:31];

always @(posedge clock) begin
	if (reg_write && write_addr) begin
		registers[write_addr] <= write_data;
	end
end

assign read_data_1 = (read_addr_1) ? registers[read_addr_1] : 32'b0;
assign read_data_2 = (read_addr_2) ? registers[read_addr_2] : 32'b0;

endmodule

