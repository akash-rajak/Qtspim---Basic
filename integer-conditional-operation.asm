#Simple program for conditional operaton
#can be done same for all 

		.data
new:	.asciiz "\n"
equal: 	.asciiz "equal\n" #beq
nequal:	.asciiz "not_equal\n" #bne
greater:.asciiz "greater\n" #bgtz
gequal:	.asciiz "greater_equal\n" #bgez
smaller:.asciiz "smaller\n" #bltz
sequal:	.asciiz "smaller_equal\n" #blez
		.text

main:
		#if($t0==$t1)
		#print if
		#else
		#print else
		
		li $t0, 11
		li $t1, 13
		
		#------------------------------------------
		
		beq $t0, $t1, print_equal
		li $v0, 4
		la $a0, nequal
		syscall
print_equal:
		li $v0, 4
		la $a0, equal
		syscall
		
		la $a0, new
		syscall
		
		#------------------------------------------
		
		bne $t0, $t1, print_nequal
		li $v0, 4
		la $a0, equal
		syscall
print_nequal:
		li $v0, 4
		la $a0, nequal
		syscall
		
		la $a0, new
		syscall
		
		#------------------------------------------------
		li $v0, 10
		syscall
		
.end main
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		