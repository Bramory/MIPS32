
module pc	(input               clk, reset_n,
		 input       [31:0]  i_pc,
		 output  reg [31:0]  o_pc);

	always @(posedge clk, negedge reset_n) 
		if (!reset_n)
			o_pc <= 32'b0;
		else
			o_pc <= i_pc;
   
endmodule
