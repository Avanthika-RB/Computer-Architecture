main:
    li a0, 3
    li a1, 7
    blt a0, a1, foo
    li a0, 30
    li a1, 70
    unimp               # marker instruction
foo:
    addi a0, a0, 1      # a0 should be 4
    unimp
