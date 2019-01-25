module LogicUnit	(input 		[31:0]	A, B,
			 input 		[1:0]	LO,
			 output reg	[31:0]	Result);

	reg [31:0] AND, OR, XOR, NOR;

	always @(*) begin
		AND <= A & B;
		OR  <= A | B;
		XOR <= A ^ B;
		NOR <= ~(A | B);

		case (LO)
			0: Result = AND;
			1: Result = OR;
			2: Result = NOR;
			3: Result = XOR;
			default: Result = 0;
		endcase
	end
endmodule 		
