// opcode choose configuration for signals from ControlUnit
// reg_dst - choose address of rd [20:16] or rt [15:11] register (to WD3 - RegFile), whether it's R/I type operation
// reg_write - confirm write in RegFile
// ext_op - save sign in [31-16] (using for load-store operations - lw-sw )
// ALU_src - control 2-nd source for ALU (is it from RD2 RegFile or SignExtender)
// beq + ZeroFlag ---> AND  ----> Multiplexor take address from (Signlmm << 2) + (cur_address + 4) ==> PC 
// bne - the same, but without ZeroFlag -- ???????????????????????????????????????????????????????????????????????????????????????????
// j - take ([25:0] << 2) + [31:28] from old address and put it in PC 
// mem_read - ???????????????????????????????????????????????????????????????????????????????????????????????????????
// mem_write - confirm write in DataMemory
// mem_to_reg - choose 1 of the 3 signal, that going for RegWrite WD3 (see picture in Harris's book)
 
module Control	(input		[5:0]	opcode,
		 output	reg		reg_dst, reg_write, ext_op, ALU_scr, beq, bne, j, mem_read, mem_write, 
		 output reg	[1:0] mem_to_reg);
  
	always @(opcode)
		if (!opcode) begin				//R-type
			reg_dst	<= 1'b1;
			reg_write <= 1'b1;
			ext_op <= 1'bx;
			ALU_scr <= 1'b0;
			beq <= 1'b0;
			bne <= 1'b0;
			j <= 1'b0;
			mem_read <= 1'b0;
			mem_write <= 1'b0;
			mem_to_reg <= 2'b00;
		end
		else
			case (opcode)
				6'b_0010_00: 			//addi
			begin
				reg_dst	<= 1'b0;
				reg_write <= 1'b1;
				ext_op <= 1'b1;
				ALU_scr <= 1'b1;
				beq <= 1'b0;
				bne <= 1'b0;
				j <= 1'b0;
				mem_read <= 1'b0;
				mem_write <= 1'b0;
				mem_to_reg <= 2'b00;
			end
			6'b_0010_10: 				//slti
			begin
				reg_dst	<= 1'b0;
				reg_write <= 1'b1;
				ext_op <= 1'b1;
				ALU_scr <= 1'b1;
				beq <= 1'b0;
				bne <= 1'b0;
				j <= 1'b0;
				mem_read <= 1'b0;
				mem_write <= 1'b0;
				mem_to_reg <= 2'b00;
			end
		6'b_0011_00:  				//andi
			begin
				reg_dst	<= 1'b0;
				reg_write <= 1'b1;
				ext_op <= 1'b0;
				ALU_scr <= 1'b1;
				beq <= 1'b0;
				bne <= 1'b0;
				j <= 1'b0;
				mem_read <= 1'b0;
				mem_write <= 1'b0;
				mem_to_reg <= 2'b00;
			end
		6'b_0011_01: 				//ori
			begin
				reg_dst	<= 1'b0;
				reg_write <= 1'b1;
				ext_op <= 1'b0;
				ALU_scr <= 1'b1;
				beq <= 1'b0;
				bne <= 1'b0;
				j <= 1'b0;
				mem_read <= 1'b0;
				mem_write <= 1'b0;
				mem_to_reg <= 2'b00;
			end
		6'b_0011_10: 				//xori
			begin
				reg_dst	<= 1'b0;
				reg_write <= 1'b1;
				ext_op <= 1'b0;
				ALU_scr <= 1'b1;
				beq <= 1'b0;
				bne <= 1'b0;
				j <= 1'b0;
				mem_read <= 1'b0;
				mem_write <= 1'b0;
				mem_to_reg <= 2'b00;
			end
		6'b_1000_11:				//lw 
			begin
				reg_dst	<= 1'b0;
				reg_write <= 1'b1;
				ext_op <= 1'b1;
				ALU_scr <= 1'b1;
				beq <= 1'b0;
				bne <= 1'b0;
				j <= 1'b0;
				mem_read <= 1'b1;
				mem_write <= 1'b0;
				mem_to_reg <= 2'b01;
			end

		6'b_1111_11:				//mult 
			begin
				reg_dst	<= 1'b1; //
				reg_write <= 1'b1;
				ext_op <= 1'bx;//
				ALU_scr <= 1'b0;//
				beq <= 1'b0;
				bne <= 1'b0;
				j <= 1'b0;
				mem_read <= 1'b0;//
				mem_write <= 1'b0;
				mem_to_reg <= 2'b10;//
				// multiplexor 2 bits
			end

		6'b_1010_11:				//sw 
			begin
				reg_dst	<= 1'bx;
				reg_write <= 1'b0;
				ext_op <= 1'b1;
				ALU_scr <= 1'b1;
				beq <= 1'b0;
				bne <= 1'b0;
				j <= 1'b0;
				mem_read <= 1'b0;
				mem_write <= 1'b1;
				mem_to_reg <= 2'bxx;
			end
		6'b_0001_00:				//beq
			begin
				reg_dst	<= 1'bx;
				reg_write <= 1'b0;
				ext_op <= 1'bx;
				ALU_scr <= 1'b0;
				beq <= 1'b1;
				bne <= 1'b0;
				j <= 1'b0;
				mem_read <= 1'b0;
				mem_write <= 1'b0;
				mem_to_reg <= 2'bxx;
			end
		6'b_0001_01:				//bne
			begin
				reg_dst	<= 1'bx;
				reg_write <= 1'b0;
				ext_op <= 1'bx;
				ALU_scr <= 1'b0;
				beq <= 1'b0;
				bne <= 1'b1;
				j <= 1'b0;
				mem_read <= 1'b0;
				mem_write <= 1'b0;
				mem_to_reg <= 2'bxx;
			end
		6'b_0000_10:				//j
			begin
				reg_dst	<= 1'bx;
				reg_write <= 1'b0;
				ext_op <= 1'bx;
				ALU_scr <= 1'bx;
				beq <= 1'b0;
				bne <= 1'b0;
				j <= 1'b1;
				mem_read <= 1'b0;
				mem_write <= 1'b0;
				mem_to_reg <= 2'bxx;
			end
		default:				//default
			begin
				reg_dst	<= 1'bx;
				reg_write <= 1'b0;
				ext_op <= 1'bx;
				ALU_scr <= 1'bx;
				beq <= 1'b0;
				bne <= 1'b0;
				j <= 1'b0;
				mem_read <= 1'b0;
				mem_write <= 1'b0;
				mem_to_reg <= 2'bxx;
			end
	endcase
			  
endmodule
