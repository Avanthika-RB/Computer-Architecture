main:
    li a1, 3
    li a2, 4
    li t0, 0
    nop
    nop    
    add a0, a1, a2
    nop
    nop
    sd a0, (t0)
    ld t1, (t0)
    nop
    nop
    add a0, t1, 1      # a0 = 8
    unimp              # end marker
    nop
    nop
    nop
    nop
