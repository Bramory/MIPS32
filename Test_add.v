`timescale 1ns / 1ps
module Test_add;

	parameter period = 2;
	// Inputs
	reg [31:0] a;
	reg [31:0] b;

	// Outputs
	wire [31:0] c;

	//Unit Under Test (UUT)
	qadd #(19,32) uut (
		.a(a), 
		.b(b), 
		.c(c)
	);

	//	These are to monitor the values...
	wire	[30:0]	c_out;
	wire	[30:0]	a_in;
	wire	[30:0]	b_in;
	wire				a_sign;
	wire				b_sign;
	wire				c_sign;
	
	
	assign	a_in = a[30:0];
	assign	b_in = b[30:0];
	assign	c_out = c[30:0];
	assign	a_sign = a[31];
	assign	b_sign = b[31];
	assign	c_sign = c[31];
	
	
	initial begin
		// Initialize Inputs
		a[30:0] = 123;
		a[31] = 0;
		b[31] = 0;
		b[30:0] = 0;

		// Wait 100 ns for global reset to finish
		#1;
       
		forever begin
			forever #(4*period) begin
				a <= $random;
				b <= $random;#(period/2)
				a[31] = 0;
				b[31] = 0; #(period/2)// add (1)
				a[31] = 0;
				b[31] = 1; #(period/2)// sub
				a[31] = 1;
				b[31] = 0; #(period/2)// add to negative
				a[31] = 1;
				b[31] = 1; 		// add neg and neg (1)
			end
		end

	end
      
endmodule

