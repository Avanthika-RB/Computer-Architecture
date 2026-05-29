.global min_s

# min_s returns the smaller of a0 and a1 

min_s:
    ble a0, a1, end
    mv a0, a1

end:    
    ret
