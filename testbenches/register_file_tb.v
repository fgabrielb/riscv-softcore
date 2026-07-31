module regiter_file_tb;

reg clock, reg_write_enable;
reg [4:0] write_reg, read_reg_1, read_reg_2;
reg [31:0] write_reg_data;

wire [31:0] read_reg_data_1, read_reg_data_2;

always #5 clock = ~clock;

registers registers_module (
	.clock(clock),
	.reg_write_enable(reg_write_enable),
	.write_reg(write_reg),
	.read_reg_1(read_reg_1),
	.read_reg_2(read_reg_2),
	.write_reg_data(write_reg_data),
	.read_reg_data_1(read_reg_data_1),
	.read_reg_data_2(read_reg_data_2)
);

initial begin
	$monitor("Read Register Data 1: %0d | Read Register Data 2: %0d",
		read_reg_data_1, read_reg_data_2);
		
	clock = 1'b1;
	
	write_reg_data = 32'd777;
	write_reg = 5'd1;
	reg_write_enable = 1'b1;
	#10;
	write_reg = 5'd2;
	#10;
	
	reg_write_enable = 1'b0;
	read_reg_1 = 5'd1;
	read_reg_2 = 5'd2;
	#10;
	write_reg = 5'd0;
	reg_write_enable = 1'b1; // must not write on x0
	#10;
	read_reg_1 = 5'd0;	// return value must be 0
	#10;
	
	$finish;
end
endmodule
