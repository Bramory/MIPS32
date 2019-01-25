.data	

.text
.globl	main
main:
	addi $t0, $0, 1
	addi $t1, $0, 2
	addi $t2, $0, 3
	addi $t3, $0, 4
	addi $t4, $0, 5
	addi $t5, $0, 6
	addi $t6, $0, 7
	addi $t7, $0, 8
	
	addi $s0, $0, 9
	addi $s1, $0, 10
	addi $s2, $0, 11
	addi $s3, $0, 12
	addi $s4, $0, 13
	addi $s5, $0, 14
	addi $s6, $0, 15
	addi $s7, $0, 16

	addi $t8, $0, 0
	addi $t9, $0, 7
	
cycle:	
	beq $t8, $t9, result
	#add $s0, $s0, $t[$t8]
	addi $t8, $t8, 1
	j cycle 
result:	
	sub $t9, $t9, $t9
