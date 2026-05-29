#include <stdio.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("invalid\n");
    }
    printf("Hello, %s!\n", argv[1]);
}
