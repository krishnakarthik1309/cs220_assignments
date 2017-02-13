# bubble sort

.data
prompt1: .asciiz "Enter size of array(N): "
prompt2: .asciiz "Enter integer element of array: "
prompt3: .asciiz  "Sorted array:"
space: .asciiz " "

.text

main:
	# print prompt
	li $v0, 4
	la $a0, prompt1
	syscall

	# read N
	li $v0, 5
	syscall

	move $t6, $v0	# value of N in $t6

	# allocate space
	sll $a0, $v0, 2	# num bytes in $a0
	li $v0, 9
	syscall			# $v0 starting addr of allocated mem

	add $t3, $v0, $zero
	add $t4, $v0, $zero
	move $t5, $zero	# count

	# Read n integers
	read:
		bge $t5, $t6, prepare_bubble_sort

		# print prompt
		li $v0, 4
		la $a0, prompt2
		syscall

		li $v0, 5
		syscall
		sw $v0, ($t3)

		# preparing for next iteration
		addi $t3, $t3, 4
		addi $t5, $t5, 1
		b read

	prepare_bubble_sort:
		addi $t7, $t6, -1	# N - 1
		add $t3, $t4, $zero
		move $t5, $zero		# outer_loop count 'i'

	outer_loop:
		bge $t5, $t7, prepare_print

		sub $t9, $t7, $t5	# store N - 1 - i in $t9
		move $t8, $zero 	# inner_loop count 'j'

		inner_loop:
			bge $t8, $t9, exit_inner_loop

			lw $t0, ($t3)
			lw $t1, 4($t3)
			
			ble $t0, $t1, skip_swap
			jal swap
			
			skip_swap:

			# prepare for next inner_loop iteration
			addi $t8, $t8, 1
			addi $t3, $t3, 4
			b inner_loop

		# prepare for next outer_loop iteration
		exit_inner_loop:
			addi $t5, $t5, 1
			add $t3, $t4, $zero
			b outer_loop

	# print array in sorted order
	prepare_print:
		li $v0, 4
		la $a0, prompt3
		syscall

		move $t5, $zero	# count

	print:
		bge $t5, $t6, terminate

		li $v0, 4
		la $a0, space
		syscall
		
		# print number
		lw $a0, ($t4)
		li $v0, 1
		syscall


		# prepare for next iteration
		addi $t4, $t4, 4
		addi $t5, $t5, 1
		b print

	terminate:
		li $v0, 10
		syscall

.end main

# swap contents in $t0, $t1 using $t2 as temp register
swap:
	move $t2, $t0
	move $t0, $t1
	move $t1, $t2

	sw $t0, ($t3)
	sw $t1, 4($t3)

	jr $ra