`timescale 1ns/100ps //

module Control_tb ();

	parameter period = 1;

	reg	[5:0]	opcode;
	wire		reg_dst, reg_write, ext_op, ALU_scr, beq, bne, j, mem_read, mem_write;
	wire	[1:0] 	mem_to_reg; //2

	reg	[5:0]	 i;

Control Control_1 (.opcode(opcode), .reg_dst(reg_dst), .reg_write(reg_write), .ext_op(ext_op), .ALU_scr(ALU_scr), .beq(beq), .bne(bne), .j(j), .mem_read(mem_read), .mem_write(mem_write), .mem_to_reg(mem_to_reg));

	initial begin
			opcode = 6'b_0000_00;
		#5	opcode = 6'b_0010_00;
		#5	opcode = 6'b_0010_10;
		#5	opcode = 6'b_0011_00;
		#5	opcode = 6'b_0011_01;
		#5	opcode = 6'b_0011_10;
		#5	opcode = 6'b_1000_11;
		#5	opcode = 6'b_1010_11;
		#5	opcode = 6'b_0001_00;
		#5	opcode = 6'b_0001_01;
		#5	opcode = 6'b_000_10; //
		#5	forever #(period) 
				for (i = 0; i <= 63; i = i + 1) 
					#5 opcode = i;
	end

	initial #300 $stop;

endmodule
