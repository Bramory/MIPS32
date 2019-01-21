module signExtend(i_data, o_data, ext_op);

input			ext_op;
input		[15:0]  i_data;
output	reg	[31:0]  o_data;

reg	[15:0]	signed_last;

	always @(*) 
		if (!ext_op) begin
			o_data [15:0] <= i_data;
			o_data [31:16] <= 0;
		end
		else begin
			o_data [15:0] <= i_data;
			signed_last <= {16{i_data[15]}};
			o_data [31:16] <= signed_last;
		end

endmodule
