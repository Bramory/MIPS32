
module next_pc	(input	[31:0]	inc_pc,
				 input	[25:0]	imm26,
				 input		zero, beq, bne, j,
				 output	[31:0]	result,
				 output		pc_src);

	reg 	[31:0]	se_result, adder, imm_pc;

	always @(*) begin
		se_result [15:0] <= imm26 [15:0];
		se_result [31:16] <= {16{imm26[15]}};
	end

	always @(*)
		adder <= inc_pc + se_result;

	always @(*) begin
		imm_pc [25:0] <= imm26;
		imm_pc [31:26] <= inc_pc [31:26];
	end 

	assign result = j ? imm_pc : adder;

	assign pc_src = (~zero & bne) | (zero & beq) | j;

endmodule
