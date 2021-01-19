# Assignment-4 - Ques 1
# Design 8-bit ALU which can perform AND, XOR, ADD, SUB in assembly language. Write the code using switch case statement. Consider all inputs are unsigned.

.data
	start:	.asciiz "Implementation of switch case statement to perform AND, XOR, ADD, SUB on 8 - bit input :\n"
	input1:	.asciiz "Enter an input 1 : "
	input11:	.asciiz "Entered input 1 is : "
	input2:	.asciiz "Enter an input 2 : "
	input22:	.asciiz "Entered input 2 is : "
	terinp:	.asciiz "Enter the terminating input : "
	caseinp:	.asciiz "Enter the case input : "
	add1:	.asciiz "Addition Operation :\n"
	sub1:	.asciiz "Subtraction Operation :\n"
	and1:	.asciiz "AND Operation :\n"
	xor1:	.asciiz "XOR Operation :\n"
	end1:	.asciiz "End of Program !!!"
	new:	.asciiz "\n\n"
	
.text
	.globl main
main:
	li $v0, 4
	la $a0, start
	syscall
	
	# reading input 1 ---------------------------------------
	li $v0, 4
	la $a0, input1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, input11
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
	# reading input 2 ---------------------------------------
	li $v0, 4
	la $a0, input2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	li $v0, 4
	la $a0, input22
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
par:
	# reading the terminating input --------------------------------------
	li $v0, 4
	la $a0, terinp
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	beq $t2, -1, endloop
	# reading the case input -------------------------------------
	li $v0, 4
	la $a0, caseinp
	syscall
	
	li $v0, 5
	syscall
	move $t3, $v0
	
	beq $t3, 0, case0
	
	beq $t3, 1, case1

	beq $t3, 2, case2
	
	beq $t3, 3, case3
	
case0: # case 0 is for addition 
	li $v0, 4
	la $a0, add1
	syscall
	
	add $a0, $t0, $t1 # means a0=(t0 + t1)
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
	j par
	
case1: # case 1 is for subtraction 
	li $v0, 4
	la $a0, sub1
	syscall
	
	sub $a0, $t0, $t1 # means a0=(t0 - t1)
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
	j par
	
case2: # case 2 is for AND operation
	li $v0, 4
	la $a0, and1
	syscall
	
	and $a0, $t0, $t1
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
	j par
	
case3: # case 3 is for XOR operation 
	li $v0, 4
	la $a0, xor1
	syscall
	
	xor $a0, $t0, $t1
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
	j par

endloop:
	li $v0, 4
	la $a0, end1
	syscall
	
	li $v0, 10
	syscall