#include <stdio.h>
#include <stdlib.h>

int fibrec_c(int);
int fibrec_s(int);

int main(int argc, char **argv) {
    int n = atoi(argv[1]);

    int c_result = fibrec_c(n);
    printf("C: %d\n", c_result);

    int s_result = fibrec_s(n);
    printf("Asm: %d\n", s_result);
    
    return 0;
}
