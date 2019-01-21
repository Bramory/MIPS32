`timescale 1ns / 1ps

module ALU	(input		[3:0]	alu_control,
		 input		[31:0]	A, B,
		 output reg	[31:0]	Result,
		 output			OF,
		 output reg		ZF);

	wire [31:0]ShifterResult, AdderResult, LogicUnitResult;
	reg [4:0] ShifterB;

	wire	[1:0]	AS;
	reg	[1:0]	SRO, LO;
	reg		AO;
		
Shifter MIPS1 (.Result(ShifterResult), .SA(ShifterB), .SRO(SRO), .Data(A));

Adder MIPS2 (.Result(AdderResult), .OF(OF), .AO(AO), .A(A), .B(B));

LogicUnit MIPS3 (.Result(LogicUnitResult), .LO(LO), .A(A), .B(B));

	assign AS = alu_control [3:2];

	always @(*)
		case (AS)
			2'b00: SRO <= alu_control [1:0];
			2'b01: AO <= alu_control [1];
			2'b10: AO <= alu_control [1];
			2'b11: LO <= alu_control [1:0];
		endcase

	always @(*) begin		
		ShifterB = B[4:0];
		case (AS) 
			0: Result = ShifterResult;
			1: Result = SLT(AdderResult, OF);
			2: Result = AdderResult;
			3: Result = LogicUnitResult;
			default: Result = 32'b0;
		endcase	
		ZF = ~(|Result);
	end		

	function [31:0] SLT;
		input [31:0] AdderResult;
		input OF;
		reg xorOF;
		reg [31:0] rslt;

		begin	
			xorOF =  AdderResult [31:31] ^ OF;
			rslt [0:0] = xorOF;
			rslt [31:1] = 30'b0;	

			SLT = rslt;
		end
	endfunction
endmodule
