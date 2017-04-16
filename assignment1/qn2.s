#Data Declarations

.data 
msg1: .asciiz "Please insert text (max 20 characters) : "
msg2: .asciiz "\nFinal String is : "
string: .space 22
#length: .word 0

.text

main: 
    la $a0, msg1     
    li $v0, 4
    syscall

    la $a0, string      # address of input
    li $a1, 22       # initialize a1 to max-length of string

    li $v0, 8           # read input string
    syscall

    la $s0, string
    lb $t0, ($s0)
    beq $t0, $zero, end
    blt $t0, 'a', loop
    bgt $t0, 'z', loop

    #chage aplhabet
    sub $t0, $t0, 32
    sb $t0, ($s0)
loop:
    addi $s0, $s0, 1
    lb $t0, ($s0)

    beq $t0, $zero, end
    blt $t0, 'a', loop
    bgt $t0, 'z', loop

    #chage aplhabet
    sub $t0, $t0, 32
    sb $t0, ($s0)

    j loop

end:
    la $a0, msg2
    li $v0, 4
    syscall

    la $a0, string
    li $v0, 4
    syscall

    li $v0, 10
    syscall


.end main


