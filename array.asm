
.text

main:

	

	la $s0, array
	lw $t0, 8($s0)
	
	
	
	li $t0,7
	li $t1,8
	addi $sp,$sp,-4
	sw $t0, 0($sp)
	sw $t1, 4($sp)


.data


array:
	#.space 20  	# 5��words
	#.word 999:5  	# 5��words ��l�Ƭ�999
	.word 1,2,3     # 3��words ���O��l�Ƭ�1 2 3

temp_str :
	
	.asciiz  "123"