.global fibrec_s     
                                                                                                      
#fibrec - compute the nth fibonacci number
#a0 - int n

fibrec_s:                                                                                                                  
    li t0, 1          #if n<=1, return n                                                                                           
    ble a0, t0, done                                                                                                       
    addi sp, sp, -32  #allocating stack                                                                                     
    sd ra, 0(sp)      #ra is return address   
    sw a0, 8(sp)                                                                                                           
    addi a0, a0, -1   #fibrec(n-1)    
    call fibrec_s                                                                                                         
    sw a0, 16(sp)                                                                                       
    lw a0, 8(sp)                                                                                                           
    addi a0, a0, -2   #fibrec(n-2)  
    call fibrec_s 
    ld t1, 16(sp)                                                                                                     
    add a0, a0, t1    #fibrec(n-1)+fibrec(n-2)                                                                              
    ld ra, 0(sp)                                                                                                         
    addi sp, sp, 32   #free stack                                                                                            
    ret
    
done:
    ret
