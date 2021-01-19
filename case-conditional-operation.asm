# Simple program for case statement (like switch)

		.data
cstate: .asciiz "Case Statement : \n"
print_zero: 	.asciiz "zero\n"
print_one: 	.asciiz "one\n"
print_two: 	.asciiz "two\n"
print_default: 	.asciiz "default\n"
		.text
		
main:
		li $t0, 0
		
		#case (i)
		#		0:  print "zero"
		#		1:  print "one"
		#		2:  print "two"
		#		default:  print "default"
		
		li $v0, 4
		la $a0, cstate
		syscall
		
		#--------------------------------
		
		beq $t0, $zero, zero
		
		li $t1, 1
		beq $t0, $t1, one
		
		li $t1, 2
		beq $t0, $t1, two
		
		j default 
		
zero:
		li $v0, 4
		la $a0, print_zero
		syscall
		j end_case
one:
		li $v0, 4
		la $a0, print_one
		syscall
		j end_case
two:
		li $v0, 4
		la $a0, print_two
		syscall
		j end_case
default:
		li $v0, 4
		la $a0, print_default
		syscall
		j end_case
		
end_case:
		#--------------------------------
		
		li $v0, 10
		syscall
		
.end main