module instruction_memory 
#(
	parameter MEMORY_DEPTH = 256
)
(

	input [31:0] read_address,
	
	output [31:0] instruction
);

localparam ADDRESS_WIDTH = $clog2(MEMORY_DEPTH);

reg [31:0] memory [0:MEMORY_DEPTH-1];

assign instruction = read_address[ADDRESS_WIDTH+1:2];
