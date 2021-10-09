#§PÂ_¬O§_¬°²§¸¹
.text

main:

input:	
	la $a0 input_msg1    
	li $v0 4             
	syscall
	li $v0 5             
	syscall
	beq $v0, $zero,exit
	move $s0,$v0
	
	la $a0 input_msg2
	li $v0 4             
	syscall
	li $v0 5             
	syscall
	beq $v0, $zero,exit
	move $s1,$v0
	
	#j fun
	jal fun
	
	beq $v0,$zero,false
	la $a0 outTrue
	j output
false:	la $a0 outFalse
	
output:	li $v0 4             
	syscall
	
	j input

fun:
	
	xor $t0,$s0,$s1
	andi $t0,$t0,0x8000
	move $v0,$t0
	jr $ra



exit:
	la $a0 exit_msg
	li $v0 4             
	syscall
	li $v0 10            
	syscall
	


.data


input_msg1:	
	.asciiz "Input number1:\n"
	
input_msg2:      
	.asciiz "Input number2:\n"
	
outTrue:
	.asciiz "True\n"
outFalse:
	.asciiz "False\n"	

exit_msg:      
	.asciiz "exit... "
	
do_something:      
	.asciiz "do something\n\n"
	
