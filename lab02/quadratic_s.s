.global quadratic_s

# quadratic_s calculates the quadratic equation where
#    a0 = x
#    a1 = a
#    a2 = b
#    a3 = c

quadratic_s:
    mul t0, a0, a0
    mul t0, t0, a1
    mul t1, a0, a2
    add t0, t0, t1
    add a0, t0, a3
    ret
