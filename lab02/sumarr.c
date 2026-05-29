#include <stdio.h>
#include <stdlib.h>

int sumarr_c(int *, int);
int sumarr_s(int *, int);

int main(int argc, char **argv) {
    int arr[1024] = {0};
    int len = 0;

    for (len = 0; len < argc - 1; len++) {
        arr[len] = atoi(argv[len + 1]);
    }

    int c_result = sumarr_c(arr, len);
    printf("C: %d\n", c_result);

    int s_result = sumarr_s(arr, len);
    printf("Asm: %d\n", s_result);

    return 0;
}
