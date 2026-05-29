#include <stdio.h>
#include <stdlib.h>

#define MAX_ARRAY_SIZE 1024

int findmax_c(int arr[], int len);
int findmax_s(int arr[], int len);


void print_array(char *prefix, int *arr, int len) {
    printf("%s", prefix);
    for (int i = 0; i < len; i++) {
        printf(" %d", arr[i]);
    }
    printf("\n");
}

int main(int argc, char **argv) {
    int arr[MAX_ARRAY_SIZE];
    int v;

    if (argc < 2) {
        printf("usage: findmax a0 [a1 ...]\n");
        exit(-1);
    }

    int len = argc - 1;
    for (int i = 0; i < len; i++)
        arr[i] = atoi(argv[i + 1]);

    v = findmax_c(arr, len);
    printf("C: %d\n", v);

    for (int i = 0; i < len; i++)
        arr[i] = atoi(argv[i + 1]);

    v = findmax_s(arr, len);
    printf("Asm: %d\n", v);

    return 0;
}
