# Data Declarations

.data

x:	.word	-2
y:	.word	-4

# Main

.text

main:

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