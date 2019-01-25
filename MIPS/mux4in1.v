module mux4in1	(input		[31:0]	i_dat0, i_dat1, i_dat2, i_dat3, 
		 input		[1:0]   control,
		 output	reg	[31:0]	o_dat);
 		 
	always @(*)
		case (control)	
			00: 
			o_dat = i_dat0;
			01:
			o_dat = i_dat1;
			10: 
			o_dat = i_dat2;
			11:
			o_dat = i_dat3;
		endcase	
endmodule

