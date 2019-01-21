`timescale 1ns / 1ps

module Shifter	(input		[31:0]	Data,
		 input		[1:0]	SRO,
		 input		[4:0]	SA,
		 output reg	[31:0]	Result);

		 wire [62:0] Result1;
		 reg [4:0] SAsll;
		 reg [46:0] in1;
		 reg [38:0] in2;
		 reg [34:0] in3;
		 reg [32:0] in4;

Extender Shifter (.SRO(SRO), .Data(Data), .Result(Result1));

	always @(*) begin
		SAsll = {5{(~(SRO[1:1] | SRO[0:0]))}} ^ SA;
		
		in1 = SAsll[4] ? Result1[62:16] : Result1[46:0];

		in2 = SAsll[3] ? in1[46:8] : in1[38:0];
	
		in3 = SAsll[2] ? in2[38:4] : in2[34:0];

		in4 = SAsll[1] ? in3[34:2] : in3[32:0];

		Result = SAsll[0] ? in4[32:1] : in4[31:0];
	end
endmodule					
