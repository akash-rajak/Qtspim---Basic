# Simple program for constructing for loops

		.data
start3:	.asciiz "\nFor Loop : \n"
for1:	.asciiz " for\n"
		.text
		
main:

		#--------------------------------for loop-------
		
		li $v0, 4
		la $a0, start3
		syscall
		
		li $t0, 1
		
loop3:
		bge $t0, 10, end_loop
		li $v0, 1
		move $a0, $t0
		syscall
		add $t0, 1
		li $v0, 4
		la $a0, for1
		syscall
		j loop3
		
		#--------------------------------
		
end_loop:
		
		li $v0, 10
		syscall
		
.end main