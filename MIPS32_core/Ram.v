
module Ram	(input			clk, mem_read, mem_write,
		 input		[31:0]	addr,
		 input		[31:0]	i_data,
		 output	reg	[31:0]	o_data);

		 reg [31:0]	mem	[0:31];

	//initial $readmemb ("ram_init.dat", mem);

	always @(posedge clk)
		if (mem_write)
			mem [addr] <= i_data;

	always @(*)
		if (mem_read)
			o_data <= mem [addr];

endmodule
