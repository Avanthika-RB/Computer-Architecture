#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include "unstruct.h"

void unstruct_c(struct packed_st *packed_p, int64_t unpacked[]);
void unstruct_s(struct packed_st *packed_p, int64_t unpacked[]);

void fill_struct(struct packed_st *packed_p, 
                 int a, int b, int c, int d, int e) {
    packed_p->u_byte = (uint8_t) a;
    packed_p->s_byte = (int8_t) b;
    packed_p->u_int  = (uint32_t) c;
    packed_p->s_int  = (int32_t) d;
    packed_p->s_double = (int64_t) e;
}

void print_doubles(int64_t doubles[], int len) {
    for (int i = 0; i < len; i++) {
        printf("%ld (0x%lX)\n", doubles[i], doubles[i]);
    }
}

int main(int argc, char **argv) {
    struct packed_st packed;    
    int64_t doubles1[5];
    int64_t doubles2[5];
    
    if (argc != 6) {
        printf("usage: unstruct <int> <int> <int> <int> <int>\n");
        exit(-1);
    }

    fill_struct(&packed, atoi(argv[1]), atoi(argv[2]), atoi(argv[3]),
                atoi(argv[4]), atoi(argv[5]));

    printf("C:\n");
    unstruct_c(&packed, doubles1);
    print_doubles(doubles1, 5);

    printf("Asm:\n");
    unstruct_s(&packed, doubles2);
    print_doubles(doubles2, 5);
}
