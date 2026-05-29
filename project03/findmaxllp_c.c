#include <stddef.h>
#include <stdio.h>
#include "linkedlist.h"

int findmaxllp_c(struct node_st *np) {
    int v;
    int max;

    max = np->value;
    printf("v = %d\n", max);

    np = np->next_p;

    while (np != NULL) {
        v = np->value;
        printf("v = %d\n", v);
        if (v > max) {
            max = v;
        }
        np = np->next_p;
    }        

    return max;
}
