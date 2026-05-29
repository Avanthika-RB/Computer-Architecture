.global sumarr_s

# a[] - a0
# len - a1
# sum - t0
# i   - t1

sumarr_s:
    li t0, 0
    li t1, 0

loop:
    bge t1, a1, end  
    lw t2, 0(a0) 
    add t0, t0, t2
    addi a0, a0, 4 
    addi t1, t1, 1  
    j loop
end: 
    mv a0, t0    
    ret
