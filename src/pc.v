module pc (
	input clock,
	input zero,
	input branch,
	input reset,
	input [31:0] imm,
	
	output reg [31:0] counter
);

always @(posedge clock) begin
	if (branch && zero) begin
		counter <= counter + imm;
	end
	else begin 
		counter <= counter + 32'd4;
	end
	
	if (reset) counter <= 1'b0;
	
end
endmodule
