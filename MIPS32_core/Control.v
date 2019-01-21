
module Control	(input		[5:0]	opcode,
		 output	reg		reg_dst, reg_write, ext_op, ALU_scr, beq, bne, j, mem_read, mem_write, mem_to_reg);
  
	always @(opcode)
		if (!opcode) begin					//R-type
			reg_dst	<= 1'b1;
			reg_write <= 1'b1;
			ext_op <= 1'bx;
			ALU_scr <= 1'b0;
			beq <= 1'b0;
			bne <= 1'b0;
			j <= 1'b0;
			mem_read <= 1'b0;
			mem_write <= 1'b0;
			mem_to_reg <= 1'b0;
		end
		else
			case (opcode)
				6'b_0010_00: 				//addi
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
						mem_to_reg <= 1'b0;
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
						mem_to_reg <= 1'b0;
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
						mem_to_reg <= 1'b0;
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
						mem_to_reg <= 1'b0;
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
						mem_to_reg <= 1'b0;
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
						mem_to_reg <= 1'b1;
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
						mem_to_reg <= 1'bx;
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
						mem_to_reg <= 1'bx;
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
						mem_to_reg <= 1'bx;
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
						mem_to_reg <= 1'bx;
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
						mem_to_reg <= 1'bx;
					end
			endcase
			  
endmodule
