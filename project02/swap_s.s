.global swap_s

#swap_s - swap two elements of an integer array
#swap arr[i] with arr[j]
#a0 - int arr[]
#a1 - int i
#a2 - int j

swap_s:
    li t0, 4   
    mul t1, a1, t0
    add t1, a0, t1
    lw t2, 0(t1)
    mul t3, a2, t0
    add t3, a0, t3
    lw t4, 0(t3)   
    sw t4, 0(t1)
    sw t2, 0(t3)  
    ret
