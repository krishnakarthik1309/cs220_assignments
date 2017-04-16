# Code for printing first 'n' febonacci numbers
# f(0)=0, f(1)=1
# printing first 'n' means -> f(0), f(1), ....., f(n)
# printing format -> 0 1 1 
#                    space after each number
 
# Data Desction
.data
fib: .space 100  # 21X4
#size: .word 20
prompt: .asciiz "Enter an integer(n): "
space: .asciiz  " "
newline: .asciiz "\n"

# Text section -> Main code begins here
.text

main:
#   prompt
    la $a0, prompt
    li $v0, 4
    syscall
#   take input integer - n
    li $v0, 5
    syscall
    move $s0, $v0
#   newline
    # la $a0, newline
    # li $v0, 4
    # syscall
#   first two numbers are stored as default    f(0)=0, f(1)=1
    la $s1, fib
    la $t7, fib

    li $t0, 0
    sw $t0, ($s1) #f(0)=0
    addi $s1, $s1, 4

    li $t1, 1
    sw $t1, ($s1) #f(1)=1
    addi $s1, $s1, 4

    li $s2, 2
    #lw $s3, size
# $s0 -- given 'n'
# $s1 -- pointer to next address
# $s2 -- present 'i-1' is in array, 'i' to be calculated
# $t2 -- $t0 + $t1,  f(i)=$t2 
# $s3 -- max value of 'i'
#   looping
loop:
    bgt $s2, $s0, print

    add $t2, $t0, $t1
#   storing the present result
    sw $t2, ($s1)
    ############
    #lw $a0, ($s1)
    #li $v0, 1
    #syscall # print list element
    ############

    addi $s1, $s1, 4    # next address
    addi $s2, $s2, 1    # next 'i'
#   preparing for next loop
    move $t0, $t1
    move $t1, $t2
    b loop
#   reassigning address of array
    #la $t0, fib
#   printing first 'n'
print:
    lw $a0, ($t7)
    li $v0, 1
    syscall # print list element

    la $a0, space
    li $v0, 4
    syscall # print space

    addi $t7, $t7, 4
    sub $s0, $s0, 1

    bgez $s0, print

#   termination
    la $a0, fib
    li $v0, 4
    syscall # print space

    li $v0, 10
    syscall

.end main