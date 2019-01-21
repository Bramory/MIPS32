
module sum4	(input		[31:0]	i_data,
		 output	reg	[31:0]	o_data);

	always @(*)
		o_data <= i_data + 1'b1;

endmodule
