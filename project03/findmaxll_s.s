.global findmaxll_s

findmaxll_s:
    lw t0, 0(a0)  #t0 = np->value (max)
    ld a0, 8(a0)  #a0 = np->next_p

loop:
    beqz a0, done  #while np = NULL, done
    lw t1, 0(a0)  # t1 = np->value
    bgt t0, t1, next_node  #if max > v, next
    mv t0, t1 

next_node:
    ld a0, 8(a0)  #np = np->next_p
    j loop  

done:
    mv a0, t0  
    ret
