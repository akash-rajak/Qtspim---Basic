# Assignment 1 - Ques 2
# Program to find out the length of diagonal of a square and then using the diagonal find out its area. Input - length of side.

		.data
sqrt2:	.float 1.4142135
two:	.float 2.0
leninput:	.asciiz "Enter the length of the square : "
length1: 	.asciiz "Length of the square : "
dlength:	.asciiz "Length of diagonal : "
area:	.asciiz "Area of the square : "
new: 	.asciiz "\n"
		.text
		
main:
		l.s $f1, sqrt2
		l.s $f2, two
		
		#reading input of radius---------------------------
		li $v0, 4
		la $a0, leninput
		syscall
		
		li $v0, 6
		syscall
		
		#printing the length of the square-----------------------
		li $v0, 4
		la $a0, length1
		syscall
		
		li $v0, 2
		add.s $f12, $f0, $f3
		syscall
		
		li $v0, 4
		la $a0, new
		syscall
		
		#Calculating length of diagonal ------------------------------------------
		li $v0, 4
		la $a0, dlength
		syscall
		
		mul.s $f12, $f0, $f1
		li $v0, 2
		syscall
		
		li $v0, 4
		la $a0, new
		syscall
		
		#Calculating area of square using length of diagonal----------------------------
		li $v0, 4
		la $a0, area
		syscall
		
		mul.s $f12, $f12, $f12
		div.s $f12, $f12, $f2
		li $v0, 2
		syscall
		
		li $v0, 10
		syscall

.end main