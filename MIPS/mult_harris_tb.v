`timescale 1ns / 1ps

module mult_tb;
	parameter period = 2;
	parameter N = 16;
	
	reg	 [N-1:0] A, B;
	wire	[2*N-1:0]	mult_result;

mult mult_1 (.A(A), .B(B), .mult_result(mult_result));

	initial 
	begin
	  A <= 32'd32;
	  B <= 32'd32; #(period/4)
	  A <= 5;
	  B <= -3;
		forever #(period/2)
		  begin
			 A <= $random;
			 B <= $random;
	    end
	end

	initial #100 $stop;
endmodule
