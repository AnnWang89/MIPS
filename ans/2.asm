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
	move $s0,$v0 #input n in $s0
	sll $t0,$s0,2
	addi $t0,$t0,1 #t0 is the row we want
	srl $s2,$t0,1 #$s2 is t0/2
	andi $s1,1
	ori $s1,1  # $s1 is 1 in the begin
	sll $s3,$s0,2
	addi $s3,$s3,2 #calculate how many space in the front
	sll $s4,$s0,1
	addi $s4,$s4,1
	sll $s4,$s4,1 #calculate how manystars
Loop:
	slt $t2,$s2,$s1
	beq  $t2,$zero ,first
	j last
	slt $t2,$t0,$s0
	beq $t2,$zero,last
	beq $t0,$s0,last
first:
	move $t1,$t0
	#j Loop1
	slt $t2,$s0,$s1
	bne $t2,$zero,mid
	j Loop1
mid:
	add $t1,$t1,$s1
	add $t1,$t1,$s1
	sub  $t1,$t1,$s3
	
	j Loop1
last:
	move $t1,$s1
	slt $t2,$s0,$t0
	bne $t2,$zero,mid2
	j Loop1
mid2:
	add $t1,$t1,$t0
	add $t1,$t1,$t0
	sub  $t1,$t1,$s3
Loop1:	#print space
	li      $v0, 4
         la      $a0,output_blank
         syscall
	subi $t1,$t1,1
	bne $t1,$zero,Loop1
	
	#print star
	slt $t2,$s2,$s1
	beq  $t2,$zero ,firststar
	move  $t3,$t0
	slt $t2,$s0,$t0
	bne $t2,$zero,mid3
	j Loop2
mid3:
	add $t3,$t3,$s4
	sub $t3,$t3,$t0
	sub  $t3,$t3,$t0
	j Loop2
firststar:
	move $t3,$s1
	
	slt $t2,$s0,$s1
	bne $t2,$zero,mid4
	j Loop2
mid4:
	add $t3,$t3,$s4
	sub $t3,$t3,$s1
	sub  $t3,$t3,$s1
	
Loop2: #print star
	li      $v0, 4
         la      $a0, output_star
	syscall
         subi $t3,$t3,1
	bne $t3,$zero,Loop2
	
	addi $s1,$s1,1
	subi $t0,$t0,1
	la      $a0,nl
	li      $v0, 4
         syscall
	bne $t0,$zero,Loop


exit:
	la $a0 exit_msg
	li $v0 4             
	syscall
	li $v0 10            
	syscall
	


.data


input_msg1:	
	.asciiz "Input number:\n"
	
output_star:      
	.asciiz "* "
output_blank:      
	.asciiz " "	
nl:     
	.asciiz "\n"                    # Newline

exit_msg:      
	.asciiz "exit... "
	
tmsg:   .asciiz "The answer is :\n"     # Total message.
	
