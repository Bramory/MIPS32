`timescale 1ns / 100ps

module Rom_tb ();

	parameter period = 1;	

	reg 	[7:0]	addr;
	wire	[31:0]	data;

	reg	[7:0]	i;

Rom Rom_1 (.addr(addr), .data(data));
	
	initial 
		forever #(period)
			for (i = 0; i <= 256; i = i + 1)
				#5 addr <= i;

	initial #300 $stop;

endmodule
