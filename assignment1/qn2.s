#Data Declarations

.data 

string: .asciiz "bcd%BADShA_+#"
length: .word 13

.text

main:

    # s0 stores starting adress of string
    la $s0, string
    
    # initialize count
    li $a1, 1
    li $a2, 13

loop:
    
    bgt $a1, $a2, end
    
    lb $t0, ($s0)

    blt $t0, 'a', loop1
    bgt $t0, 'z', loop1

    #chage aplhabet
    sub $t0, $t0, 32
    sb $t0, ($s0)

    #move $a0, $t0
    #li $v0, 11
    #syscall
    
    addi $s0, $s0, 1
    addi $a1, $a1, 1
    j loop

loop1:
    #move $a0, $t0
    #li $v0, 11
    #syscall
    
    # FORWARD THE ADDRESS
    addi $s0, $s0, 1
    addi $a1, $a1, 1
    j loop

end:

    la $a0, string

    li $v0, 4
    syscall


    li $v0, 10
    syscall


.end main


