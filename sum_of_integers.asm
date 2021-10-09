# This program reads integers until 0 and reports their sum. 
    
        .text
        .globl  main
main:
       
        li      $s1, 0                  # Place a zero in the sum
        li      $v0, 4                  # String
        la      $a0, hello
        syscall
        
        # Issume a prompt and read a string.
read:   
        li      $v0, 4                  # String
        la      $a0, prompt
        syscall
        li      $v0, 5                  # Read int, into $s0
        syscall
        move    $s0, $v0

        # See if it's a 0, and proceed to print if so
        li      $t0, 0
        beq     $s0, $t0, printtot

        # Add to total
        add     $s1, $s1, $s0

        # Round again
        j       read

printtot:
        # Print the total
        li      $v0, 4
        la      $a0, tmsg
        syscall
        li      $v0, 1
        move    $a0, $s1
        syscall
        li      $v0, 4
        la      $a0, nl
        syscall
        li      $v0, 10
        syscall


        .data
i:      .word   65535
array:  .word   9:10
array1: .word   8, 8, 8, 8, 8
prompt: .asciiz ">"                     # Input prompt
tmsg:   .asciiz "The total is: "        # Total message.
nl:     .asciiz "\n"                    # Newline
hello:	.asciiz "Input intergers to calculate the summary (0 to exit)\n"
