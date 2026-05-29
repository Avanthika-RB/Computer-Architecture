PROGS = numinfo numconv
NUMINFO_OBJS = numinfo.o
NUMCONV_OBJS = numconv.o
OBJS = ${NUMINFO_OBJS} ${NUMCONV_OBJS}

%.o: %.c
	gcc -Wall -c -g -o $@ $<

all : ${PROGS}

numinfo : ${NUMINFO_OBJS}
	gcc -g -o $@ $^

numconv : ${NUMCONV_OBJS}
	gcc -g -o $@ $^
	
clean:
	rm -rf ${PROGS} ${OBJS}
