// get 16 bits from instruction data bus [15:0] - offset

//if extension operation 1:
// copy sign bit  [15] to [31:16] 			//for correct signed numbers
// output: [31:16] - 16 sign bits + offset [15:0]
// # ssss_ssss_ssss_ssss_1111_2222_3333_4444
// where s - sign bit

//else 
// output: 0000_0000_0000_0000_1111_2222_3333_4444	//32 bits

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
