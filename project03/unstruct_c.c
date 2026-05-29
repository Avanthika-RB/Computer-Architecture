#include <stdint.h>
#include "unstruct.h"

void unstruct_c(struct packed_st *packed_p, int64_t unpacked[]) {
    unpacked[0] = (int64_t) packed_p->u_byte;
    unpacked[1] = (int64_t) packed_p->s_byte;
    unpacked[2] = (int64_t) packed_p->u_int;
    unpacked[3] = (int64_t) packed_p->s_int;
    unpacked[4] = (int64_t) packed_p->s_double;
}
