`timescale 1ns / 100ps

module MIPS_tb ();

	parameter period = 1;

	reg clk, reset_n;
	wire OF,ZF;

MIPS MIPS_1 (.clk(clk), .reset_n(reset_n), .OF(OF), .ZF(ZF));

	initial begin
		clk <= 0;
		forever #(period)
			clk <= ~clk;
	end

	initial begin
		reset_n <= 1'b0;
		#(period) reset_n <= 1'b1;
	end

	initial #500 $stop;

endmodule
