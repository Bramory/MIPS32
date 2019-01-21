
module Alu_Control	(input		[5:0]	alu_op, alu_funct,
			 output	reg	[3:0]	alu_control);
 
	
	always @(*)
		
		if (!alu_op)
			
			case (alu_funct)//ALU_FUNCT!!!

				6'b_1000_00: alu_control <= 4'b_100x;	//add

				6'b_1000_10: alu_control <= 4'b_101x;	//sub

6'b_1001_00: alu_control <= 4'b_1100;	//and

6'b_1001_01: alu_control <= 4'b_1101;	//or
6'b_1001_11: alu_control <= 4'b_1110;	//nor
6'b_1001_10: alu_control <= 4'b_1111;	//xor

6'b_1010_10: alu_control <= 4'b_011x;	//slt

endcase
		
else 

case (alu_op)//ALU_OPCODE!!!
				
6'b_0010_00: alu_control <= 4'b_100x;	//addi

				6'b_0010_10: alu_control <= 4'b_011x;	//slti

				6'b_0011_00: alu_control <= 4'b_1100;	//andi

				6'b_0011_01: alu_control <= 4'b_1101;	//ori

				6'b_0011_10: alu_control <= 4'b_1111;	//xori

				6'b_1000_11: alu_control <= 4'b_100x;	//lw
	
				6'b_1010_11: alu_control <= 4'b_100x;	//sw

				6'b_0001_00: alu_control <= 4'b_101x;	//beq

				6'b_0001_01: alu_control <= 4'b_101x;	//bne

				6'b_0000_10: alu_control <= 4'b_x;	//j

			endcase
  
endmodule
