#Ū�J10��
#��X10�Ӽ�


.text 
main:

	push:	addi $sp, $sp, -4	# Decrement stack pointer by 4
	addi $t0, $zero,50
	sw   $t0, 0($sp)		# Save $t0 to stack
	pop:	lw   $t0, 0($sp)	# Copy from stack to $t0
	addi $sp, $sp, 4		# Increment stack pointer by 4


	la $s0,4000000
	la $t6,array         # array�_�l��m��Jt6
	move $t7 $zero       # �j��p��
	addi $t8 $zero 10
input:
	la $a0 input_msg     
	li $v0 4             #  systemcode 
	syscall              #��Xinput_msg     
	
	li $v0 5             # systemcode
	syscall              #Ūint
	
	move $t0 $t7         # �N�p�ƾ���Jt0
	mul $t0 $t0 4        # �p�ⰾ���q
	addu $t0 $t0 $t6     # �Narray��m�[�W�����q
	sw $v0 0($t0)        # �Nv0��J������m
	
	addi $t7 $t7 1       # �p�ƾ�++
	blt $t7 $t8 input    # �٨S�]10�Ӽ�


output: 
	move $t7 $zero       # �p��
	addi $t8 $zero 10    # 10�Ӽ�
print_all:
	move $t0,$t7         # 
    	mul $t0,$t0,4        # �p�ⰾ���q
    	addu $t0,$t0,$t6     #  ��add�]�i�H ���O�|��overflow�����D
	lw $a0,0($t0)        #  ��O���餤����Ū�i��
   	li $v0,1  		
   	syscall  	     # ��X��
    	addi $t7,$t7,1  
    	blt $t7,$t8,print_all  
	
	li $v0 10            # �h�X 
	syscall
.data 
	array:
		.space 40      # array
	input_msg:
		.asciiz "Input number: " # str
	