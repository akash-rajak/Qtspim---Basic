# MIPs instruction implementation

.data # All these data are stored in memory
	w1:		.word 234 # 32 bit -2,147,483,648 to 2,147,483,647
	h1:		.half 233 # −32,768 to 32,767
	b1:		.byte -129 # -128 to 127  if range exceed then after subtacting or adding is printed
	str1:	.asciiz "Hello asciiz str1\n"
	str2:	.ascii "Hello ascii str2\n"
	str3:	.asciiz "Hello asciiz str3\n"
	f1:		.float 23.234567
	d1:     .double 456.564634
	char1:	.byte 'Y'
	new:	.asciiz "\n"
	intstr:	.asciiz "Enter the integer input : "
	floatstr:	.asciiz "Enter the float input : "
	doublestr:	.asciiz "Enter the double input : "
	charstr:	.asciiz "Enter the char input : "
	stringstr:	.asciiz "Enter the string input : "
	intstr1:	.asciiz "Entered integer is : "
	floatstr1:	.asciiz "Entered float is : "
	doublestr1:	.asciiz "Entered double is : "
	charstr1:	.asciiz "\nEntered char is : "
	stringstr1:	.asciiz "Entered string is : "
	name:		.space 20
	char2:		.byte ' '
	add1:		.asciiz "Addition of two elements : \n"
	sub1:		.asciiz "Subtraction of two elements : \n"
	mul1:		.asciiz "Multiplication of two elements using mul: \n"
	mul2:		.asciiz "Multiplication of two elements using mult: \n"
	div1:		.asciiz "Division of two elements : \n"
.text
	.globl main
main:
	# ------------------------------------------------ printing data types --------------------------------------------------------------------------------
	
	#------------------------------------------------------------------------ string -------------------------------------------------------------------------------
	li $v0, 4 # loads immediate (const) value in register - $v0 (4 is loaded in $v0 to print the string)
	la $a0, str1 # loads computed address of label (not its content) into register
	# since str1 is null terminated therefore prints the string str1 and gets terminated
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
	li $v0, 4
	la $a0, str2
	# since str2 here is not null terminated therefore prints the strings starting from str2 till a null terminated string is not found
	# therefore str2 and str3 both printed
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
	li $v0, 4
	la $a0, str3
	# here since str3 is null terminated therefore only str3 is printed
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	#------------------------------------------------------------------------ int -------------------------------------------------------------------------------
	
	li $v0, 1 # 1 is loaded in $v0 to print the integer (32 -bit)
	la $a0, 24 # $a0 contains the integer to be printed not the address
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
	li $v0, 1
	la $a0, w1 # therefore when address is passed of integer to be printed , then address gets stored in $a0 and that is being printed
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
	li $v0, 1
	lw $a0, w1 # in case of integer we have to load word not load address therefore la does not work here
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
	li $v0, 1
	lh $a0, h1 # lh for loading half from memory to register
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
	li $v0, 1
	lb $a0, b1 # lb for loading byte from memory to register
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	#--------------------------------------------------------------------------- float ----------------------------------------------------------------------------
	
	li $v0, 2
	lwc1 $f12, f1 # load word from coprocessor 1, and it can be loaded in only $f12
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
	li $v0, 3
	ldc1 $f12, d1 # load double from coprocessor 1, and it can be loaded in only $f12
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	#---------------------------------------------------------------------------- character ---------------------------------------------------------------------------
	
	li $a0, 'R'
	li $v0, 11
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
	li $v0, 4 # character printed using code 4
	la $a0, char1
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
	li $v0, 11 # character printed using code 4 
	lb $a0, char1 # here lb is used to load character (byte) from memory to register
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
	#-------------------------------------------------------------------------------------------------------------------------------------------------------
	
	# ------------------------------------------------ reading data types --------------------------------------------------------------------------------
	
	#-------------------------------------------------------------------------------------- int ------------------------------------------------------------
	
	li $v0, 4
	la $a0, intstr
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, intstr1
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
	#------------------------------------------------------------------------------- float ------------------------------------------------------------------------
	
	li $v0, 4
	la $a0, floatstr
	syscall
	
	li $v0, 6
	syscall
	
	li $v0, 4
	la $a0, floatstr1
	syscall
	
	li $v0, 2
	# now we need to move float from register $f0 to register $f12 to print float
	# but here we cannot use move pseudocode or addi therefore we use add.s instead
	add.s $f12, $f1, $f0 # means $f12 = $f1 + $f0 = $f0 as $f1 = 1 , therefore $f1 is used here just like in case of identity
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
	#------------------------------------------------------------------------------- double ------------------------------------------------------------------------
	
	li $v0, 4
	la $a0, doublestr
	syscall
	
	li $v0, 7
	syscall
	
	li $v0, 4
	la $a0, doublestr1
	syscall
	
	li $v0, 3
	# now all the register are of 32 - bit and double is of 64 - bit, therefore for storing the double value we need two register $f0 and $f1
	add.d $f12, $f2, $f0 # here $f2 is used as identity as double is stored in $f0, anf $f1
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
	#---------------------------------------------------------------------------- string ---------------------------------------------------------------
	
	li $v0,4
	la $a0, stringstr
	syscall
	
	li $v0, 8
	# $a0 contains the address of string input buffer
	la $a0, name # loads the address of inputted string $a0 to label name
	# $a1 contains the length of the string buffer
	la $a1, 20 # length 20 means only maximum of 19 characters are read , as soon as 19 characters are inputted the string gets printed
	syscall
	
	li $v0, 4
	la $a0, stringstr1
	syscall
	
	li $v0, 4
	la $a0, name
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
	# ---------------------------------------------------------------------------- char --------------------------------------------------------------------
	
	li $v0, 4
	la $a0, charstr
	syscall
	
	li $v0, 12 # after reading character is stored in $v0
	syscall
	
	la $s0, char2
	sb $v0, char2
	
	li $v0, 4
	la $a0, charstr1
	syscall
	
	li $v0, 11
	lb $a0, char2
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
	# --------------------------------------------------------------- Arithmetic operation ----------------------------------------------------------------
	
	li $t0, 12
	li $t1, 13
	add1 
	
	#-------------------------------------------------------------------------------------------------------------------------------------------------------
	li $v0, 10
	syscall
	
.end main

















