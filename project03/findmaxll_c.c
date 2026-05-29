#include <stddef.h>
#include "linkedlist.h"

int findmaxll_c(struct node_st *np) {
    int v;
    int max;

    max = np->value;
    np = np->next_p;

    while (np != NULL) {
        v = np->value;
        if (v > max) {
            max = v;
        }
        np = np->next_p;
    }        

    return max;
}
