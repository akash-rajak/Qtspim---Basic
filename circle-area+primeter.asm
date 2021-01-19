# Assignment 1 - Ques 1
# Program to find area and perimeter of circle

		.data
pi:		.float 3.1415926
two:	.float 2.0
radinput:	.asciiz "Enter the radius : "
rad:	.asciiz "Radius : "
pii:	.asciiz "Value of pi : "
area:	.asciiz "Area of the circle with given radius : "
perimeter:	.asciiz "Perimeter of the circle with given radius : "
new: 	.asciiz "\n"
		.text
		
main:
		#l.s $f0, radius
		l.s $f1, pi
		l.s $f2, two
		
		#reading radius - input radius by default gone to $f0
		li $v0, 4
		la $a0, radinput
		syscall
		
		li $v0, 6
		syscall
		
		# printing radius-------------------------------
		li $v0, 4
		la $a0, rad
		syscall
		
		li $v0, 2
		add.s $f12, $f0, $f3 #$f12 = $f0 , as $f3 =0 by default
		syscall
		
		li $v0, 4
		la $a0, new
		syscall
		
		# printing value of pi-------------------------------
		la $a0, pii
		syscall
		
		li $v0, 2
		lwc1 $f12, pi # from load word from coprocessor 1, load $f12 and assign it the value of pi
		syscall
		
		li $v0, 4
		la $a0, new
		syscall
		
		# Calculating Area-------------------------------------
		
		la $a0, area
		syscall
		mul.s $f12, $f0, $f0 #$f12 = ($f0 * $f0)
		mul.s $f12, $f12, $f1 #$f12 = ($f12 * $f1)
		li $v0, 2
		syscall
		
		li $v0, 4
		la $a0, new
		syscall
		
		# Calculating Perimeter-----------------------------------
		
		la $a0, perimeter
		syscall
		mul.s $f12, $f1, $f2 #$f12 = ($f1 * $f2)
		mul.s $f12, $f12, $f0 ##$f12 = ($f12 * $f0)
		li $v0, 2
		syscall
		
		li $v0, 10
		syscall

.end main