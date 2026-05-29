.global findmaxfc_s

#a0 - int arr[]
#a1 - int len

findmaxfc_s:
    lw t0, 0(a0)
    li t1, 1

max2_s:
    bge t1, a1, end
    addi a0, a0, 4
    lw t2, 0(a0)
    blt t0, t2, update
    j increment

update:
    mv t0, t2

increment:
    addi t1, t1, 1
    j max2_s

end:
    mv a0, t0
    ret
