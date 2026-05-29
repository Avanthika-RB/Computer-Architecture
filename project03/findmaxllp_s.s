.global findmaxllp_s
.global printf

.data
string: 
    .string "v = %d\n"       

.text

findmaxllp_s:
    addi sp, sp, -64            
    sd ra, 24(sp)              
    mv t0, a0       
    ld a1, 0(t0)     
    sd t0, (sp)
    sd a1, 8(sp)
    la a0, string               
    call printf                
    ld t0, (sp)                 
    ld t1, 8(t0)
    ld t2, 8(sp)
    
loop:
    beqz t1, done               #if np == NULL, done
    ld a1, 0(t1)                #a1 = np->value
    la a0, string
    sd t1, 8(sp)
    sd a1, 16(sp)    
    sd t2, 32(sp)
    call printf
    ld t1, 8(sp)  
    ld a1, 16(sp)
    ld t2, 32(sp)              
    bgt t2, a1, next_node       #if v>max, update
    mv t2, a1                  

next_node:
    ld t1, 8(t1)                #np = np->next_p
    j loop                      

done:
    mv a0, t2            
    ld ra, 24(sp)                                                      
    addi sp, sp, 64             
    ret                        
