.data
 
	prompt1: .asciiz "Enter numerator of 1st rational(a): "
	prompt2: .asciiz "Enter denominator of 1st rational(b): "
	prompt3: .asciiz "Enter numerator of 2nd rational(c): "
	prompt4: .asciiz "Enter denominator of 2nd rational(d): "
	output: .asciiz "e+"
	dot: .asciiz "."
	one: .float 1.0
.text

main:
	
	#print prompt1
	la $a0, prompt1
	li $v0, 4
	syscall

	#take input (a) for numerator of 1st rational
	li $v0, 6
	syscall	# result is in v0
	mov.s $f1, $f0
#----------------------

#print prompt2
	la $a0, prompt2
	li $v0, 4
	syscall

	#take input (b) for denominator of 1st rational
	li $v0, 6
	syscall	# result is in v0
	mov.s $f2, $f0
#------------------------

#print prompt3
	la $a0, prompt3
	li $v0, 4
	syscall

	#take input (c) for numerator of 2nd rational
	li $v0, 6
	syscall	# result is in v0
	mov.s $f3, $f0
#---------------------------

#print prompt4
	la $a0, prompt4
	li $v0, 4
	syscall

	#take input (d) for denominator of 2nd rational
	li $v0, 6
	syscall	# result is in v0
	mov.s $f4, $f0
#----------------------------

	div.s $f5, $f1, $f2  #calculating a/b
 	div.s $f6, $f3, $f4  #calculating c/d
	add.s $f7, $f5, $f6  #adding the two rationals

	li.s $f10, 0.0

	c.eq.s $f7, $f10
	bc1f njero
	mov.s $f9, $f7
	b exit
njero:

#-----------------------------
	#calculate the number of digits* in the sum and store it in $t2
	li.s $f8, 10.0 
	li.s $f11, -1.0
	li $t8, -1
	li $t2, 0 # loop counter

	c.lt.s $f7, $f10
	bc1f posit
	li.s $f11, -1.0
	mul.s $f7, $f7, $f11
	b skip

posit:
	li.s $f11, 1.0
	li $t8, 1

skip:
	mov.s $f9, $f7

	
#________________ comparing the abs(sum) with 1

	l.s $f1, one
	c.lt.s $f9, $f1
	bc1t loop2




loop1:		
					# if the sum is greater than 1 do this
		
		div.s $f9, $f9, $f8
		add $t2, $t2, 1
		c.lt.s $f9, $f8
		bc1t exit		
		b loop1

loop2:     # if sum is less than 1

		li.s $f2, 10.0
		sub $t2, $t2, 1
		mul.s $f9, $f9, $f2

		c.lt.s $f1, $f9
		bc1f loop2
		bc1t exit

exit:
#-------- For rounding off the decimals to double precision

		mov.s $f4, $f9
	
round:
	li.s $f8, 100.0
	mul.s $f4, $f4, $f8
	round.w.s $f4, $f4
	mfc1 $t4, $f4 	
	
	li $t3, 100
	div $t4, $t3
	mflo $t5
	mfhi $t6
	blt $t6, 10, addzero
	b skipzeroadd
	li $t9, 0

addzero:
	li $t9, 1

skipzeroadd:
##
	mul $t5, $t5, $t8
	li $v0, 1
	move $a0, $t5
	syscall
# Newline
	la $a0, dot
	li $v0, 4
	syscall
##
	beq $t9, 0, ncat
	move $a0, $zero
	li $v0, 1
	syscall

ncat:
	

	li $v0, 1
	move $a0, $t6
	syscall

	la $a0, output
	li $v0, 4
	syscall

	move $a0, $t2
	la $v0, 1
	syscall

	li $v0, 10
	syscall


.end main


