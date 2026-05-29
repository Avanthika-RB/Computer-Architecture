#include <stdio.h>
#include <stdlib.h>

#include "linkedlist.h"

int findmaxll_c(struct node_st *np);
int findmaxll_s(struct node_st *np);

int main(int argc, char **argv) {
    struct node_st nodes[1024];
    int i;
    int v;

    if (argc < 2) {
        printf("usage: findmaxll a0 [a1 ...]\n");
        exit(-1);
    }

    // Build linked list
    int len = argc - 1;
    for (i = 0; i < len; i++) {
        nodes[i].value = atoi(argv[i + 1]);
        nodes[i].next_p = &nodes[i + 1];
    }
    nodes[i - 1].next_p = NULL;

    v = findmaxll_c(&nodes[0]);
    printf("C: %d\n", v);

    v = findmaxll_s(&nodes[0]);
    printf("Asm: %d\n", v);

    return 0;
}
