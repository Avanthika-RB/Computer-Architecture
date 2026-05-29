PROGS = rstr rstr_rec unstruct findmaxll findmaxllp

RSTR_OBJS = rstr.o rstr_c.o rstr_s.o
RSTR_REC_OBJS = rstr_rec.o rstr_rec_c.o rstr_rec_s.o
UNSTRUCT_OBJS = unstruct.o unstruct_c.o unstruct_s.o
FINDMAXLL_OBJS = findmaxll.o findmaxll_c.o findmaxll_s.o
FINDMAXLLP_OBJS = findmaxllp.o findmaxllp_c.o findmaxllp_s.o

OBJS = ${RSTR_OBJS} ${RSTR_REC_OBJS} \
       ${UNSTRUCT_OBJS} ${FINDMAXLL_OBJS} ${FINDMAXLLP_OBJS}\

%.o: %.c
	gcc -c -g -o $@ $<

%.o: %.s
	as -g -o $@ $<

all: ${PROGS}

rstr: ${RSTR_OBJS}
	gcc -g -o $@ $^

rstr_rec: ${RSTR_REC_OBJS}
	gcc -g -o $@ $^

unstruct: ${UNSTRUCT_OBJS}
	gcc -g -o $@ $^

findmaxll: ${FINDMAXLL_OBJS}
	gcc -g -o $@ $^

findmaxllp: ${FINDMAXLLP_OBJS}
	gcc -g -o $@ $^

clean:
	rm -rf ${PROGS} ${OBJS}
