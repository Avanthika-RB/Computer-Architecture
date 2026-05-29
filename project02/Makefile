PROGS = findmax findmaxfc swap sort fibrec
FINDMAX_OBJS = findmax.o findmax_c.o findmax_s.o
FINDMAXFC_OBJS = findmaxfc.o findmaxfc_c.o findmaxfc_s.o
SWAP_OBJS = swap.o swap_c.o swap_s.o
SORT_OBJS = sort.o sort_c.o sort_s.o swap_c.o swap_s.o
FIBREC_OBJS = fibrec.o fibrec_c.o fibrec_s.o
OBJS = ${FINDMAX_OBJS} ${FINDMAXFC_OBJS} \
       ${SWAP_OBJS} ${SORT_OBJS} ${FIBREC_OBJS}

%.o: %.s
	as -g -o $@ $<

%.o: %.c
	gcc -c -g -o $@ $<

all: ${PROGS}

findmax: ${FINDMAX_OBJS}
	gcc -g -o $@ $^

findmaxfc: ${FINDMAXFC_OBJS}
	gcc -g -o $@ $^

swap: ${SWAP_OBJS}
	gcc -g -o $@ $^

sort: ${SORT_OBJS}
	gcc -g -o $@ $^

fibrec: ${FIBREC_OBJS}
	gcc -g -o $@ $^


clean:
	rm -rf ${PROGS} ${OBJS}
