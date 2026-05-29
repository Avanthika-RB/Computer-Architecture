.global rstr_rec_s

# Reverse a string recursively

rstr_rec_s:
    addi sp, sp, -32     #a0 = dst. a1 = src
    sd ra, 24(sp)
    sd s0, 16(sp)
    sd s1, 8(sp)
    sd s2, 0(sp)
    beqz a1, done
    mv s0, a0            #s0 = dst
    mv s1, a1            #s1 = src
    mv t0, s1            #t0 = src
    li s2, 0             #s2 = src_len 

findlength:
    lb t1, 0(t0)       
    beqz t1, length 
    addi s2, s2, 1   
    addi t0, t0, 1   
    j findlength

length:
    mv a0, s0            #a0 = dst
    li a1, 0             #a1 = dst_idx 
    mv a2, s1            #a2 = src
    addi a3, s2, -1      #a3 = src_idx 
    call continue
    ld ra, 24(sp)
    ld s0, 16(sp)
    ld s1, 8(sp)
    ld s2, 0(sp)
    addi sp, sp, 32
    ret

continue:
    add t0, a2, a3       #src + src_idx
    lb t1, 0(t0)         #t1 = src[src_idx]
    bnez t1, continue_recursion
    add t0, a0, a1       #dst + dst_idx
    sb zero, 0(t0)       #dst[dst_idx] = '\0'
    ret

continue_recursion:
    add t0, a0, a1       #t0 = dst + dst_idx
    sb t1, 0(t0)         #dst[dst_idx] = src[src_idx]
    addi sp, sp, -8
    sd ra, 0(sp)    
    addi a1, a1, 1       #dst_idx + 1
    addi a3, a3, -1      #src_idx - 1
    call continue
    ld ra, 0(sp)
    addi sp, sp, 8
    ret

done:
    li a0, -1
    ret
