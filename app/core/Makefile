CXX = arm-none-eabi-c++
GCC = arm-none-eabi-gcc
OBJDUMP = arm-none-eabi-objdump
OBJDUMPFLAGS = --visualize-jumps --source-comment="                                        ;" 
CFLAGS = -Wall -Wextra -Ofast -mcpu=cortex-a7 -mthumb -ffreestanding -fno-exceptions

OBJ = tmp/main.o

all: core.h

.SUFFIXES:

tmp/%.o: src/%.cc
	mkdir -p tmp
	$(CXX) $(CFLAGS) -S src/$*.cc -o tmp/$*.gs
	$(CXX) $(CFLAGS) -c -g src/$*.cc -o tmp/$*.o
	$(OBJDUMP) $(OBJDUMPFLAGS) -S tmp/$*.o > tmp/$*.s

tmp/%.o: src/%.c
	mkdir -p tmp
	$(GCC) $(CFLAGS) -S src/$*.c -o tmp/$*.gs
	$(GCC) $(CFLAGS) -c -g src/$*.c -o tmp/$*.o
	$(OBJDUMP) $(OBJDUMPFLAGS) -S tmp/$*.o > tmp/$*.s

core.bin: tmp/startup.o $(OBJ)
	arm-none-eabi-ld -Tsrc/core.ld -o tmp/core.elf $+
	arm-none-eabi-objcopy -O binary tmp/core.elf core.bin
	
core.h: core.bin
	echo -n "#define CORE { " > core.h
	echo -n `cat core.bin | xxd -C -i` >> core.h
	echo " }" >> core.h

disassemble:core.bin
	arm-none-eabi-objdump -S --disassemble tmp/core.elf
	
clean:
	rm -rf core.bin core.h tmp
