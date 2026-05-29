.global unstruct_s

# int a0 - struct packed_st *packed_p
# int a1 - int64_t unpacked[]

unstruct_s:
    lbu t0, 0(a0)
    sd t0, 0(a1)
    lb t0, 1(a0)
    sd t0, 8(a1)
    lwu t0, 4(a0)
    sd t0, 16(a1)
    lw t0, 8(a0)
    sd t0, 24(a1)
    ld t0, 16(a0)
    sd t0, 32(a1)
    ret
