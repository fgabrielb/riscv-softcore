module datapath (
	input clock,
	input [31:0] instruction,
	input [31:0] write_reg_data;
	
	output [31:0] read_instruction_address,
	output [31:0] alu_result,
	output [31:0] read_reg_data_2,
	output mem_read,
	output mem_write,
	output mem_to_reg
);


wire branch;
wire [1:0] alu_op;
wire alu_src;
wire reg_write_enable;

wire [6:0] opcode = instruction[6:0];

control control_module (
	.opcode(opcode),
	
	.branch(branch),
	.mem_read(mem_read),
	.mem_to_reg(mem_to_reg),
	.alu_op(alu_op),
	.mem_write(mem_write),
	.alu_src(alu_src),
	.reg_write_enable(reg_write_enable)
);


wire [3:0] operation;

wire [2:0] func3 = instruction[14:12];
wire [6:0] func7 = instruction[31:25];

alu_control alu_control_module (
	.alu_op(alu_op),
	.func3(func3),
	.func7(func7),
	
	.operation(operation)
);


wire [31:0] read_reg_data_1;


wire [4:0] read_reg_1 = instruction[19:15];
wire [4:0] read_reg_2 = instruction[24:20];
wire [4:0] write_reg = instruction[11:7];

registers registers_module (
	.clock(clock),
	.reg_write_enable(reg_write_enable),
	.read_reg_1(read_reg_1),
	.read_reg_2(read_reg_2),
	.write_reg(write_reg),
	.write_reg_data(write_reg_data),
	
	.read_reg_data_1(read_reg_data_1),
	.read_reg_data_2(read_reg_data_2)
);


wire [31:0] imm;

immgen immgen_module (
	.instruction(instruction),
	
	.imm(imm)
);


wire [31:0] b = (alu_src) ? imm : read_reg_data_2;

wire zero;

alu alu_module (
	.a(read_reg_data_1),
	.b(b),
	.result(alu_result),
	.zero(zero)
);


pc pc_module (
	.clock(clock),
	.zero(zero),
	.branch(branch),
	.reset(reset),
	.imm(imm),
	.counter(read_instruction_address)
);
