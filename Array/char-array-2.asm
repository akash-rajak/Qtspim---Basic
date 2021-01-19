# Array Representation in Mips
# can be done with both in data , either in string or in character type

.data
	ele:	.asciiz "Printing the whole string directly :\n"
	ele1:	.asciiz "Printing the whole string by one by one accessing the character with index using loop :\n"
	arr1: 	.ascii "0123456789ABCDEF"
	# arr1:	.byte 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P'
	new:	.asciiz "\n"
	sp1:	.byte ' '
	
.text
	.globl main
main:
	li $v0, 4
	la $a0, ele
	syscall
	
	li $v0, 4
	la $a0, arr1
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
	#--------------------------------------------------------------------------------------
	
	li $v0, 4
	la $a0, ele1
	syscall
	
	li $v0, 11
	la $t0, arr1
	# lb $a0, arr1(10)
	# syscall
	
	li $t1, 0
	# li $t2, 16
loop1:	
	beq $t1, 16, endloop
	
	lb $a0, arr1($t1)
	syscall
	
	add $t1, 1
	j loop1
	
	
	#----------------------------------------------------------------------------------------------------------
	
	
endloop:
	li $v0, 10
	syscall