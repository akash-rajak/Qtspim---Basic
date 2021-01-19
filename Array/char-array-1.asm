# Array Representation in Mips
# can be done with both in data , either in string or in character type

.data
	ele:	.asciiz "Printing the whole string directly :\n"
	ele1:	.asciiz "Printing th ewhole string by one by one accessing the character with index :\n"
	# arr1: 	.ascii "0123456789ABCDEF"
	arr1:	.byte 'A','B','C','D','E','F','G','H','I','J'
	new:	.asciiz "\n"
	sp1:	.byte ' '
	
.text
	.globl main
main:
	li $v0, 4
	la $a0, ele
	syscall
	
	li $v0, 4
	la $a0, arr1
	syscall
	
	li $v0, 4
	la $a0, new
	syscall
	
	#--------------------------------------------------------------------------------------
	
	li $v0, 4
	la $a0, ele1
	syscall
	
	li $v0, 11
	la $t0, arr1
	
	lb $a0, 0($t0)
	syscall
	lb $a0, sp1
	syscall
	
	lb $a0, 1($t0)
	syscall
	lb $a0, sp1
	syscall
	
	lb $a0, 2($t0)
	syscall
	lb $a0, sp1
	syscall
	
	lb $a0, 3($t0)
	syscall
	lb $a0, sp1
	syscall
	
	lb $a0, 4($t0)
	syscall
	lb $a0, sp1
	syscall
	
	lb $a0, 5($t0)
	syscall
	lb $a0, sp1
	syscall
	
	lb $a0, 6($t0)
	syscall
	lb $a0, sp1
	syscall
	
	lb $a0, 7($t0)
	syscall
	lb $a0, sp1
	syscall
	
	lb $a0, 8($t0)
	syscall
	lb $a0, sp1
	syscall
	
	lb $a0, 9($t0)
	syscall
	lb $a0, sp1
	syscall
	
	lb $a0, 10($t0)
	syscall
	lb $a0, sp1
	syscall
	
	lb $a0, 11($t0)
	syscall
	lb $a0, sp1
	syscall
	
	lb $a0, 12($t0)
	syscall
	lb $a0, sp1
	syscall
	
	lb $a0, 13($t0)
	syscall
	lb $a0, sp1
	syscall
	
	lb $a0, 14($t0)
	syscall
	lb $a0, sp1
	syscall
	
	lb $a0, 15($t0)
	syscall
	lb $a0, sp1
	syscall
	
	
	#----------------------------------------------------------------------------------------------------------
	
	
endloop:
	li $v0, 10
	syscall