#Simple program to print some text on console
# here one: , main: are labels

		.data #.data directive - tells the assembler that now we are givin some data to work with
			#here one: is the string name
one:    .asciiz "This is string one!\n" #.asciiz directive - denotes that we will given string with zero at the end
two:	.asciiz "\tThis is string two!\n"# this is string two 
		.text #.text directive tells the assembler to expect some code like printing output
main:	li $v0, 4 # 4 is put in v0 to print string in output
		la $a0, one # one that is the address of string is put in a0 so we can access from there
		syscall # syscall instruction is called to go and print the output on console
		
		la $a0, two# now here while printing string two we don't have to again an agin se the value of v0 to 4, we have to set only when v0 is changed
		syscall
		
		.data
hello:	.asciiz "\nHello World!\n"
		.text
		
		la $a0, hello
		syscall
		
		li $v0, 10 # 10 is put in v0 to quit the program
		syscall #then again syscall is called