.global findmax_s

#a0 - int arr[]
#a1 - int len

findmax_s:
    lw t0, 0(a0)          #t0 = arr[0]
    mv t1, t0             #max
    li t2, 1              #t2 is i = 1
    li t5, 4              #for offset

loop:
    bge t2, a1, done      #if i >= len done
    add t3, a0, t5        
    lw t4, 0(t3)          #v = arr[i] 
    ble t4, t1, continue  #if v <= max continue
    mv t1, t4             #max = v

continue:
    addi t2, t2, 1        #i++
    addi t5, t5, 4        #offset += 4
    j loop           

done:
    mv a0, t1     
    ret      
