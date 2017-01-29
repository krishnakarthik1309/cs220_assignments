# Data Declarations

.data
	
	prompt1: .asciiz "Enter value of x: "
	prompt2: .asciiz "Enter value of y:"
	x:	.word	0
	y:	.word	0

# Main

.text


main:

# --------------------
	#prompt the user to enter x 
	li $v0, 4
	la $a0, prompt1
	syscall

	#get x from user
	li $v0, 5
	syscall

	#store x in $to
	move $t0, $v0
	sw $t0, x

	#prompt the user to enter y
	li $v0, 4
	la $a0, prompt2
	syscall

	#get y from user
	li $v0, 5
	syscall

	#store y in $to
	move $t0, $v0
	sw $t0, y
#-------------------------------------

	# pass arguments to func
	lw $a0, x
	lw $a1, y

	jal func

	# save v0 in a0
	move $a0, $v0

	# print value in a0
	li $v0, 1
	syscall

	# terminate the program
	li $v0, 10
	syscall

.end main

func:
	li $v0, 0	# int u = 0
	
	sub $t0, $zero, 5
	mul $t0, $t0, $a0
	
	add $t1, $zero, 7
	mul $t1, $t1, $a1

	sub $v0, $t0, $t1

	blt $v0, -35, case_1
	bgt $v0, 35, case_2

	jr $ra

case_1:
	li $v0, -35
	jr $ra

case_2:
	li $v0, 35
	jr $ra
