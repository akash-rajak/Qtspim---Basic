# Simple program for constructing do-while loops

		.data
start2:	.asciiz "\nDo - while Loop : \n"
space:	.asciiz " "
		.text
		
main:

		#--------------------------------do-while loop-------
		
		li $v0, 4
		la $a0, start2
		syscall
		
		li $t0, 1
		
loop2:
		li $v0, 1
		move $a0, $t0
		syscall
		addi $t0, 1
		li $v0, 4
		la $a0, space
		syscall
		bge $t0, 10, end_loop
		j loop2
		
		#--------------------------------
		
end_loop:
		
		li $v0, 10
		syscall
		
.end main