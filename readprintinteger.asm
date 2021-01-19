#Simple program to read and print some integers on console

		.data
prompt: .asciiz "Enter an Integer : "
res:	.asciiz "You entered : "
new:	.asciiz "\n"
		.text

main:
		li $v0, 4
		la $a0, prompt
		syscall
		
		li $v0, 5
		syscall
		move $t0, $v0 # copy v0 to t0
		
		li $v0, 4
		la $a0, new
		syscall
		
		la $a0, res
		syscall
		
		li $v0, 1 # this read integer is printed in new line only
		move $a0, $t0 # $t0 is copied to $a0
		syscall
		
		li $v0, 4
		la $a0, new
		syscall
		
		li $v0, 10
		syscall
