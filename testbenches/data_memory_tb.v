module data_memory_tb;

reg clock, mem_read, mem_write;
reg [31:0] write_data, address;
wire [31:0] read_data;

always #5 clock = ~clock;

data_memory data_memory_module (
    .clock(clock),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .write_data(write_data),
    .address(address),
    .read_data(read_data)
);

initial begin

    $monitor("Read data: %0d", read_data);

    clock = 1;
    mem_write = 1;
    mem_read = 0;
    write_data = 32'd89; // write the number 89
    address = 32'd71;    // in the memory address 71
    #10;

    mem_write = 0;
    mem_read = 1; // trying to read the data we just wrote
    #10;

    $finish;
end
endmodule
