CXX = arm-none-eabi-c++
GCC = arm-none-eabi-gcc
CFLAGS = -Wall -Wextra -Os -mcpu=cortex-a7 -mthumb -ffreestanding

OBJ = tmp/main.o

all: core.h

.SUFFIXES:

tmp/%.o: src/%.cc
	mkdir -p tmp
	$(CXX) $(CFLAGS) -S src/$*.cc -o tmp/$*.s
	$(CXX) $(CFLAGS) -c tmp/$*.s -o tmp/$*.o

tmp/%.o: src/%.c
	mkdir -p tmp
	$(GCC) $(CFLAGS) -S src/$*.c -o tmp/$*.s
	$(GCC) $(CFLAGS) -c tmp/$*.s -o tmp/$*.o

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
