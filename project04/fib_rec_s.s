.global fib_rec_s

fib_rec_s:
    li t0, 1                                                                                                  
    ble a0, t0, done                                                                                                       
    addi sp, sp, -32                                                                                  
    sd ra, 0(sp)        
    sw a0, 8(sp)                                                                                                           
    addi a0, a0, -1    
    call fib_rec_s                                                                                                         
    sw a0, 16(sp)                                                                                       
    lw a0, 8(sp)                                                                                                           
    addi a0, a0, -2 
    call fib_rec_s 
    ld t1, 16(sp)                                                                                                     
    add a0, a0, t1                                                                               
    ld ra, 0(sp)                                                                                                         
    addi sp, sp, 32                                                                                            
    ret
    
done:
    ret
