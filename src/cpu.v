module cpu (
	input clock
);


wire [31:0] alu_result;
wire [31:0] read_memory;
wire [31:0] read_reg_data_2;
wire mem_read;
wire mem_write;
wire mem_to_reg;

wire [31:0] instruction;
wire [31:0] write_reg_data;

datapath datapath_module (
	.clock(clock),
	.instruction(instruction),
	.write_reg_data(write_reg_data),
	
	.read_instruction_adddress(read_instruction_address),
	.read_reg_data_2(read_reg_data_2),
	.alu_result(alu_result),
	.mem_read(mem_read),
	.mem_write(mem_write),
	.mem_to_reg(mem_to_reg)
);


instruction_memory instruction_memory_module (
	.read_address(read_instruction_address),
	
	.instruction(instruction)
);


wire [31:0] data_memory_read_data;

data_memory data_memory_module (
	.mem_read(mem_read),
	.mem_write(mem_write),
	.write_data(read_reg_data_2),
	.address(alu_result),
	
	read_data(data_memory_read_data)
);
	
write_reg_data = (mem_to_reg) ? data_memory_read_data : alu_result;
