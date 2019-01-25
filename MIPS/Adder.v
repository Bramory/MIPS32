//?????????????????????????????????????

// provide results of sum and subtracting 
// operates with numbers in 2's complement ("additional code")
// AO - arithmetic operation: (0 = add), (1 = subtraction)
// OF - OverFlow. If only 1 of the 2 last carry bits equal "1" => OF = 1
// if (AO) B = -B
module Adder	(
     input		[31:0]	A, B,
		 input			AO,
		 output	reg	[31:0] 	Result,
		 output reg		OF);

		 reg [32:0] internal;

	always @(*) begin
		if (AO) internal = A + ~B + AO;
		else	internal = A + B;		
		
		Result = internal [31:0];
	
		OF = internal [32];// XOR 2 last carry bits
	end
endmodule		
