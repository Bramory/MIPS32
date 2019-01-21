`timescale 1ns / 1ps

module Adder	(input		[31:0]	A, B,
		 input			AO,
		 output	reg	[31:0] 	Result,
		 output reg		OF);

		 reg [32:0] internal;

	always @(*) begin
		if (AO) internal = A + ~B + AO;
		else	internal = A + B;		
		
		Result = internal [31:0];
	
		OF = internal [32];
	end
endmodule		
