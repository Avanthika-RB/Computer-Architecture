main:
    li a0, 0
    li a1, 4
    sd a1, (a0)
    ld a2, (a0)
    addi a0, a2, 1      # a0 should be 5
    unimp               # marker instruction
