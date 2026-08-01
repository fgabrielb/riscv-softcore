module data_memory 
#(
	parameter MEMORY_DEPTH = 512
)
(
	input clock,
	input mem_read,
	input mem_write,
	input [31:0] write_data,
	input [31:0] address,
	
	output [31:0] read_data
);

localparam ADDRESS_WIDTH = $clog2(MEMORY_DEPTH);

reg [31:0] memory [0:MEMORY_DEPTH-1];

always @(posedge clock) begin
	if (mem_write) begin
		memory[address[ADDRESS_WIDTH+1:2]] <= write_data;
	end
end

assign read_data = (mem_read) ? memory[address[ADDRESS_WIDTH+1:2]] : 32'b0;

endmodule
