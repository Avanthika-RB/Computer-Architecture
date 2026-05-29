.global swap_s
.global sort_s

#sort_s - sorts an array of 32-bit integers in-place,
#         in ascending order
#a0 - int arr[]
#a1 - int len

sort_s:
    li t0, 1                #i = 1

outer_loop:
    bge t0, a1, done      
    mv t1, t0               #j = i

inner_loop:
    beqz t1, increment 
    slli t2, t1, 2     
    add t2, a0, t2     
    lw t3, 0(t2)            #t3 = arr[j]
    lw t4, -4(t2)           #t4 = arr[j-1]  
    ble t4, t3, increment  
    addi sp, sp, -32
    sd ra, 0(sp)
    sd t0, 8(sp)
    sd t1, 16(sp)
    sd a1, 24(sp)
    mv a2, t1               #a2 = j
    addi a1, t1, -1         #a1 = j - 1
    call swap_s       
    ld ra, 0(sp)
    ld t0, 8(sp)
    ld t1, 16(sp)
    ld a1, 24(sp)
    addi sp, sp, 32
    addi t1, t1, -1         #j--
    j inner_loop
increment:
    addi t0, t0, 1          #i++
    j outer_loop

done:
    ret
