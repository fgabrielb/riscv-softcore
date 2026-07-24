module data_memory (
	input clock,
	input mem_read,
	input mem_write,
	input [31:0] write_data,
	input [31:0] address,
	
	output [31:0] read_data
);

reg [32:0] memory [0:512];

always @(posedge clock) begin
	if (mem_write) begin
		memory[address] <= write_data;
	end
end

assign read_data = (mem_read) ? memory[address] : 32'b0;

endmodule
