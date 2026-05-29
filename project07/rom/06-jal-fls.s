main:
    li a0, 3
    jal foo
    unimp               # marker instruction
foo:
    addi a0, a0, 4      # a0 should be 7
    ret
