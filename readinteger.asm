#Simple program to read and print (not printing read integer) some integers on console

		.data
new:	.asciiz "\n"
		.text
		
main:
		li $v0, 5
		syscall
		move $t0, $v0 # $v0 is copied to $t0
		
		li $v0, 4
		la $a0, new
		syscall
		
		li $v0, 1
		la $a0, 32 # or li $a0, 32 can also be used
		syscall
		
		li $v0, 4
		la $a0, new
		syscall
		
		li $v0, 1
		la $a0, 64
		syscall
		
		li $v0, 4
		la $a0, new
		syscall
		
		li $v0, 1
		la $a0, 128
		syscall
		
		li $v0, 10
		syscall