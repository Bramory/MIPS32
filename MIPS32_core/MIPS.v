
module MIPS	(input	clk, reset_n,
		 output OF, ZF);

	wire [31:0]	o_address, i_address, instruction, sign_extend, A, B, ALU_result, o_rdata2, mux3in_data, i_wdata, next_pc_result, out_sum;
	wire [5:0]	opcode, funct;
	wire [4:0]	rs, rt, rd, sa, i_waddr;
	wire [15:0]	immediate16;
	wire [3:0]	alu_control;
	wire [25:0]	imm26;
	
	wire 		reg_dst, reg_write, ext_op, ALU_scr, beq, bne, j, mem_read, mem_write, mem_to_reg, pc_src;

pc pc_1 (.clk(clk), .reset_n(reset_n), .i_pc(i_address), .o_pc(o_address));

sum4 sum4_1 (.i_data(o_address), .o_data(out_sum));

Rom Rom_1 (.address(o_address), .data(instruction));

mux2in1 mux2in1_1 (.i_dat0(out_sum), .i_dat1(next_pc_result), .control(pc_src), .o_dat(i_address));

mux2in1 mux2in1_2 (.i_dat0(rt), .i_dat1(rd), .control(reg_dst), .o_dat(i_waddr));

mux2in1 mux2in1_3 (.i_dat0(o_rdata2), .i_dat1(sign_extend), .control(ALU_scr), .o_dat(B));

mux2in1 mux2in1_4 (.i_dat0(ALU_result), .i_dat1(mux3in_data), .control(mem_to_reg), .o_dat(i_wdata));

regFile regFile_1 (.clk(clk), .reset_n(reset_n), .i_we(reg_write), .i_raddr1(rs), .i_raddr2(rt), .i_waddr(i_waddr), .i_wdata(i_wdata), .o_rdata1(A), .o_rdata2(o_rdata2));

signExtend signExtend_1 (.ext_op(ext_op), .i_data(immediate16), .o_data(sign_extend));

ALU ALU_1 (.alu_control(alu_control), .A(A), .B(B), .Result(ALU_result), .OF(OF), .ZF(ZF));

Alu_Control Alu_Control_1 (.alu_op(opcode), .alu_funct(funct), .alu_control(alu_control));

Control Control_1 (.opcode(opcode), .reg_dst(reg_dst), .reg_write(reg_write), .ext_op(ext_op), .ALU_scr(ALU_scr), .beq(beq), .bne(bne), .j(j), .mem_read(mem_read), .mem_write(mem_write), .mem_to_reg(mem_to_reg));

Ram Ram_1 (.clk(clk), .mem_read(mem_read), .mem_write(mem_write), .addr(ALU_result), .i_data(o_rdata2), .o_data(mux3in_data));

next_pc next_pc_1 (.inc_pc(out_sum), .imm26(imm26), .zero(ZF), .beq(beq), .bne(bne), .j(j), .result(next_pc_result), .pc_src(pc_src));


	assign immediate16	= instruction [15:0];
	assign opcode		= instruction [31:26];
	assign rs		= instruction [25:21];
	assign rt		= instruction [20:16];
	assign rd		= instruction [15:11];
	assign sa		= instruction [10:6];
	assign funct		= instruction [5:0];
	assign imm26		= instruction [25:0];	

endmodule
	
	
