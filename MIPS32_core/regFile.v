
module regFile	(input	   	        clk, i_we, reset_n,
		 input	   	[4:0]   i_raddr1, i_raddr2, i_waddr,
		 input	   	[31:0]  i_wdata,           
		 output	reg	[31:0]  o_rdata1, o_rdata2);

		 reg [31:0]	mem	[0:31];

		 reg [31:0] address;
		 wire [31:0] WE;
		 integer i;

	always @(*) begin
		address <= 0;
		address [i_waddr] <= 1;
	end

				//initial $readmemh("regi.dat", mem);

	assign WE = address & {32{i_we}};
		 
	always @(posedge clk) 
		if (WE[0])
			mem [0] <=0;
		else
			for (i = 1; i <= 31; i = i + 1)
				if (WE[i])
					mem [i] <= i_wdata;

	always @(*) 
		case (i_raddr1)
			i_raddr1: o_rdata1 <= mem [i_raddr1];
			default: o_rdata1 <= o_rdata1;
		endcase

	always @(*) 
		case (i_raddr2)
			i_raddr2: o_rdata2 <= mem [i_raddr2];
			default: o_rdata2 <= o_rdata2;
		endcase
  
endmodule
