module mult_harris #(parameter N = 16)
		(
		 input [N-1:0] A,
		 input [N-1:0]	B,
		output [2*N-1:0] mult_result);
		
assign mult_result = $signed(A) * $signed(B);

endmodule