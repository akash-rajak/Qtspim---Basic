# Array Representation in Mips

.data
	start1: .asciiz "Implementation of Array :\n"
	ele:	.asciiz "Printing the elements of array :\n"
	arr1:	.word 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 # Array Elements
	sp1:		.asciiz " "
	new:	.asciiz "\n"
	
.text
	.globl main
main:
	li $v0, 4
	la $a0, start1
	syscall
	
	li $v0, 4
	la $a0, ele
	syscall
	
	li $t0, 0 				# counter (index)
	li $t1, 40 				# Total no of element in array

loop:
	beq $t0, $t1, endloop 	# if counter is less than 10 then do endloop
	lw $t3, arr1($t0)  		# $t3 = memory[$t2 + 0] , copy from memory to register # $t2 is used for index of address
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	li $v0, 4
	la $a0, sp1
	syscall
	
	add $t0, 4				# $t2 = $t2 + 4 # incrementing the address by 4 because int is of 4 bytes
	
	j loop
	
	
endloop:
	li $v0, 10
	syscall