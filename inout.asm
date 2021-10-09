#讀入10數
#輸出10個數


.text 
main:

	push:	addi $sp, $sp, -4	# Decrement stack pointer by 4
	addi $t0, $zero,50
	sw   $t0, 0($sp)		# Save $t0 to stack
	pop:	lw   $t0, 0($sp)	# Copy from stack to $t0
	addi $sp, $sp, 4		# Increment stack pointer by 4


	la $s0,4000000
	la $t6,array         # array起始位置放入t6
	move $t7 $zero       # 迴圈計數
	addi $t8 $zero 10
input:
	la $a0 input_msg     
	li $v0 4             #  systemcode 
	syscall              #輸出input_msg     
	
	li $v0 5             # systemcode
	syscall              #讀int
	
	move $t0 $t7         # 將計數器放入t0
	mul $t0 $t0 4        # 計算偏移量
	addu $t0 $t0 $t6     # 將array位置加上偏移量
	sw $v0 0($t0)        # 將v0放入對應位置
	
	addi $t7 $t7 1       # 計數器++
	blt $t7 $t8 input    # 還沒跑10個數


output: 
	move $t7 $zero       # 計數
	addi $t8 $zero 10    # 10個數
print_all:
	move $t0,$t7         # 
    	mul $t0,$t0,4        # 計算偏移量
    	addu $t0,$t0,$t6     #  用add也可以 但是會有overflow的問題
	lw $a0,0($t0)        #  把記憶體中的值讀進來
   	li $v0,1  		
   	syscall  	     # 輸出拉
    	addi $t7,$t7,1  
    	blt $t7,$t8,print_all  
	
	li $v0 10            # 退出 
	syscall
.data 
	array:
		.space 40      # array
	input_msg:
		.asciiz "Input number: " # str
	