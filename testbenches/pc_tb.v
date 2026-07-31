module pc_tb;

always #5 clock = ~clock;

reg clock, zero, branch, reset;
reg [31:0] imm;
wire [31:0] counter;

pc pc_module (
	.clock(clock),
	.zero(zero),
	.branch(branch),
	.reset(reset),
	.imm(imm),
	.counter(counter)
);


initial begin
	clock = 1'b0;
	reset = 1'b1;
	#10;
	reset = 1'b0;
	imm = 32'd64;
	
	$monitor("Counter: %0d", counter);
	
	#50;
	
	zero = 1'b1;	//
	branch = 1'b1; // must use the immediate
	
	#10;
					//
	zero = 1'b0;	// must not use the immediate
					//
	#10;
	
	zero = 1'b1;	//
	branch = 1'b0; // must not use the immediate
	
	#50;
	
	$finish;
end
endmodule
