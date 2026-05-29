main:
    li a1, 3
    nop
    nop
    li a2, 4
    nop
    nop
    jal first
    nop
    nop
    nop
    nop
    unimp            # end marker        
    nop
    nop
    nop
    nop

first:
    add a0, a1, a2
    nop
    nop
    addi a0, a0, 1  # a0 = 8
    nop
    nop
    ret
    nop
    nop
    nop
    nop
