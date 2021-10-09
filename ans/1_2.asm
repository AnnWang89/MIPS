#判斷是否為異號
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
	
	la $a0 input_msg3
	li $v0 4             
	syscall
	li $v0 5             
	syscall
	move $s2,$v0
	
	#j fun
	jal fun

output:	

 	li      $v0, 4
        la      $a0, tmsg
        syscall
	li      $v0, 1
        move    $a0, $s0
        syscall
        li      $v0, 4
        la      $a0, nl
        syscall
	
	
	j input

fun:
	beq $s2, $zero,change0
	#當要把某一位換成1，把要換的那位變成1其他為0，再和原本的去or
	sllv $t0,$s2,$s1
	or $t0,$t0,$s0
	j changeover
change0:
#當要把某一位換成0，把要換的那位變成0其他為1，在和原本的去and
	or $t0,$t0,0xFFFF
	sllv  $t0,$t0,$s1
	xori $t1,$t0,0xFFFF
	sll  $t0,$t0,1
	add $t0,$t0,$t1
	and $t0,$t0,$s0
changeover:
	move $s0,$t0
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
	
input_msg3:      
	.asciiz "Input number3:\n"	
nl:     
	.asciiz "\n"                    # Newline

exit_msg:      
	.asciiz "exit... "
	
tmsg:   .asciiz "The answer is :\n"     # Total message.
	
