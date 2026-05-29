.global rstr_s
.global strlen

# Reverse a string iteratively

rstr_s:
    addi sp, sp, -32    #a0 = dst, a1 = src
    sd ra, 24(sp)
    sd s0, 16(sp)
    sd s1, 8(sp)
    sd s2, 0(sp)
    beqz a1, done
    mv s0, a0            #s0 = dst
    mv s1, a1            #s1 = src
    mv a0, a1            #a0 = src 
    call strlen          #a0 = strlen
    mv s2, a0            #s2 = src_len 
    add t0, s1, s2       #t0 = src + src_len 
    addi t0, t0, -1      #gets last character
    mv t1, s0            #t1 = dst 
    
reverse_loop:
    blt t0, s1, reverse_done 
    lb t2, 0(t0)         #t2 = *t0 
    sb t2, 0(t1)         #*t1 = t2 
    addi t0, t0, -1      
    addi t1, t1, 1      
    j reverse_loop

reverse_done:
    sb zero, 0(t1)       #t1 null terminator
    ld ra, 24(sp)
    ld s0, 16(sp)
    ld s1, 8(sp)
    ld s2, 0(sp)
    addi sp, sp, 32
    li a0, 0           
    ret

done:
    li a0, -16          #error handling for null          
    ld ra, 24(sp)
    ld s0, 16(sp)
    ld s1, 8(sp)
    ld s2, 0(sp)
    addi sp, sp, 32
    ret
