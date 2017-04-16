.data
prompt: .asciiz "Enter an integer: "
result: .asciiz "\nThe number in binary format is: "

.text
# assumption 32 bit

main:

# print "Enter an integer: "
la $a0, prompt
li $v0, 4
syscall

# read the integer
li $v0, 5
syscall	# result is in v0
move $t0, $v0

# print "The number in binary format is: "
la $a0, result
li $v0, 4
syscall

# Print the binary number
# First rotate the bits left by one bit and
# and it with 00..01 to get most significant bit
li $t1, 32	# loop counter
binary:
	rol $t0, $t0, 1		# rotate left by one bit
	and $t2, $t0, 1		# and it with 00..01
	add $t2, $t2, 48	# ASCII value

	# print the bit
	move $a0, $t2
	li $v0, 11			# print the character
	syscall

	# increment loop counter
	sub $t1, $t1, 1
	bne	$t1, $zero, binary

terminate:
	li $v0, 10
	syscall

.end main