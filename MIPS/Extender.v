`timescale 1ns / 1ps

module Extender	(input		[31:0]	Data,
		 input		[1:0]	SRO,
		 output reg	[62:0]	Result);

	always @(SRO, Data) begin
		case (SRO)
			0: Result = SLL(Data);
			1: Result = SRA(Data);
			2: Result = SRL(Data);
			3: Result = ROR(Data);
			default: Result =  2'b00;
		endcase
	end

	function [62:0] SLL;
		input	[31:0]	Data;
		reg	[62:0]	rsll;

		begin

			rsll[62:31] = Data;
			rsll[30:0] = 31'b0;

			SLL = rsll;	
		
		end	
	endfunction

	function [62:0] SRA;
		input [31:0] Data; 
		reg [62:0] rsra; 

		begin 	

			rsra[31:0] = Data; 
			rsra[62:32] = {31{Data[31:31]}};	
			
			SRA = rsra;
		end	
	endfunction

	function [62:0] SRL;
		input	[31:0]	Data;
		reg	[62:0]	rsrl;

		begin

			rsrl[31:0] = Data;
			rsrl[62:32] = 31'b0;

			SRL = rsrl;	
		
		end	
	endfunction

	function [62:0] ROR;
		input	[31:0]	Data;
		reg	[62:0]	rror;

		begin

			rror[31:0] = Data;
			rror[62:32] = Data[30:0];

			ROR = rror;	
		
		end	
	endfunction
endmodule
