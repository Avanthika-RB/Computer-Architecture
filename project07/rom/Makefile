HEX_FILES = 00-add-3nop.hex 01-add-2nop.hex 02-jal.hex 03-ld.hex 04-add-fwd.hex\
            05-ld-stl.hex 06-jal-fls.hex 07-branch.hex 08-fibrec.hex

AS = riscv64-unknown-elf-as
OBJDUMP = riscv64-unknown-elf-objdump

.PRECIOUS: %.o %.obj

%.o: %.s
	${AS} -o $@ $<

%.obj: %.o
	${OBJDUMP} -d $< > $@

%.hex: %.obj
	cat $< | python3 makerom3.py > $@

all: ${HEX_FILES}

clean:
	rm -rf ${HEX_FILES} *.o *.obj
