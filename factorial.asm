#factorial Program

		.data
start:	.asciiz "Factorial Program\n"
new:	.asciiz "\n"
		.text
		
main:

		li $v0, 4
		la $a0, start
		syscall
		
		li $t0, 0# to count numbers
		li $t1, 1# for result
		
loop1:
		addi $t0, 1
		mul $t1, $t1, $t0 # means t1=t1*t0
		li $v0, 1
		move $a0, $t1
		syscall
		
		li $v0, 4
		la $a0, new
		syscall
		
		beq $t0, 16, end_loop
		j loop1
		
end_loop:
		li $v0, 10
		syscall
		
.end main