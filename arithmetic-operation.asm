#Simple program for arithmetic operaton on 32 - bit integer

		.data
a1:		.asciiz "Addition of two numbers : "
a11:	.asciiz "Addition of three numbers : " # important -> addition for 3 numbers is not possible
a2:		.asciiz "Addition of two numbers with one integer as constant : "
s1:		.asciiz "Subtraction of two numbers : "
m1:		.asciiz "Multiplication of two (32 - bit)numbers : "
m11:	.asciiz "Multiplication of two (64 - bit)numbers : "
d1:		.asciiz "Division (quotient) of two numbers : "
r1:		.asciiz "Remainder of two numbers : "
new:	.asciiz "\n"
		.text

main:
		li $t0, 10 # four integer value taken and stored in t0 to t3
		li $t1, 20
		li $t2, 30
		li $t3, 40
		#--------------------------------------------------------------------------
		li $v0, 4
		la $a0, a1
		syscall
		
		add $a0, $t0, $t2 # means a0=(t0 + t2)
		li $v0, 1
		syscall
		
		li $v0, 4
		la $a0, new
		syscall
		#--------------------------------------------------------------------------
		la $a0, a2
		syscall
		
		addi $a0, $t0, 100 # means a0=(t0 + 100)
		li $v0, 1
		syscall
		
		li $v0, 4
		la $a0, new
		syscall
		#--------------------------------------------------------------------------
		#la $a0, a11
		#syscall
		
		#add $a0, $t0, $t1, $t2 # means a0=(t0 + t1 + t2)
		#li $v0, 1
		#syscall
		#--------------------------------------------------------------------------
		la $a0, s1
		syscall
		
		sub $a0, $t0, $t1 # means a0=(t0 - t1)
		li $v0, 1
		syscall
		
		li $v0, 4
		la $a0, new
		syscall
		#--------------------------------------------------------------------------
		la $a0, m1
		syscall
		
		mul $a0, $t2, $t3 # means a0=(t2 * t3)
		li $v0, 1
		syscall
		
		li $v0, 4
		la $a0, new
		syscall
		#--------------------------------------------------------------------------
		la $a0, m11
		syscall
		
		mult $t2, $t3 # means [Hi Lo]=(t2 * t3)
		mflo $a0 # since we know numbers are small we use only mflo
		li $v0, 1
		syscall
		
		li $v0, 4
		la $a0, new
		syscall
		#--------------------------------------------------------------------------
		la $a0, d1
		syscall
		
		div $a0, $t3, $t0 # means a0=(t3 / t0)
		li $v0, 1
		syscall
		
		li $v0, 4
		la $a0, new
		syscall
		#--------------------------------------------------------------------------
		la $a0, r1
		syscall
		
		rem $a0, $t3, $t0 # means a0=(t3 % t0)
		li $v0, 1
		syscall
		
		li $v0, 4
		la $a0, new
		syscall
		
		
		
		
		