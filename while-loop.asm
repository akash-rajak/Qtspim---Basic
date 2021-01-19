# Simple program for constructing while loops

		.data
start1:	.asciiz "\nWhile Loop : \n"
space:	.asciiz " "
		.text
		
main:

		#-----------------------------------while loop-------
		
		li $v0, 4
		la $a0, start1
		syscall
		
		li $t0, 1
		
loop1:
		bge $t0, 10, end_loop
		li $v0, 1
		move $a0, $t0
		syscall
		# li $t0, $t0+1 -------- we cannot apply normal addition for increment
		add $t0, 1
		li $v0, 4
		la $a0, space
		syscall
		j loop1
		
		#-------------------------------------------------------
		
end_loop:
		
		li $v0, 10
		syscall
		
.end main