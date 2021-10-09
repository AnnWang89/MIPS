
.text

main:
	la $s1, array   #array在$s1
input:	
	
	la $a0 input_msg1    
	li $v0 4             
	syscall
	
	li $v0 5             
	syscall
	beq $v0, $zero,exit
	move $s0,$v0 #input n in $s0
	addi $s4,$zero,1
	addi $s5,$zero,2
	
	bne $s0,$s4,not_1
	move $s3,$s4
	j output
not_1:
	bne $s0,$s5,not_2
	move $s3,$s5
	j output
not_2:
	addi $t1,$zero,4
	add $t1,$t1,$s1
	addi $t2,$zero,2
	sw $t2, 0($t1) #把2放進array[2]
	subi $t3,$s0,2
Loop:
	addi $t1,$t1,4
	lw $s2,-4($t1)
	lw $s3,-8($t1)
	add $t2,$s2,$s3
	
	sw $t2, 0($t1) #把2放進array[2]
	subi $t3,$t3,1	
	bne $t3,$zero,Loop
	
	lw $s3,0($t1)
output:	
	li      $v0, 4
        la      $a0, tmsg
        syscall
	li      $v0, 1
        move    $a0, $s3
        syscall
        li      $v0, 4
        la      $a0, nl
        syscall
	
	j input
exit:
	la $a0 exit_msg
	li $v0 4             
	syscall
	li $v0 10            
	syscall
	

.data


input_msg1:	
	.asciiz "Input :\n"
	
array:

	.word 1:50 	# 40個words 初始化為1

nl:     
	.asciiz "\n"                    # Newline

exit_msg:      
	.asciiz "exit... "
	
tmsg:   .asciiz "Output :\n"     # Total message.
	
