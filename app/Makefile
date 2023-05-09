CXX = arm-linux-gnueabihf-g++
CFLAGS = -pthread -Wall -Wextra -Ofast -fno-strict-aliasing -static-libgcc -static -I. -Iinclude

INCLUDES = $(shell find include)
 
loader: src/loader.cc tmp/stage1/stage1.bin.h tmp/stage2/stage2.bin.h
	$(CXX) $(CFLAGS) src/loader.cc -o loader


CXX_NONE = arm-none-eabi-c++
OBJDUMP = arm-none-eabi-objdump
OBJDUMPFLAGS = --visualize-jumps --source-comment="                                        ;" 
CFLAGS_NONE = -std=gnu++2a -Wall -Wextra -Ofast -mcpu=cortex-a7 -marm -ffreestanding -fno-exceptions -fno-strict-aliasing -I. -Iinclude
UPPERCASE = $(shell echo '$1' | tr '[:lower:]' '[:upper:]'| tr '.' '_')

.SUFFIXES:

.PRECIOUS: tmp/%.o tmp/%.bin

tmp/%.o: src/%.cc $(INCLUDES)
	mkdir -p $(@D)
	$(CXX_NONE) $(CFLAGS_NONE) -S src/$*.cc -o tmp/$*.gs
	$(CXX_NONE) $(CFLAGS_NONE) -c -g src/$*.cc -o tmp/$*.o
	$(OBJDUMP) $(OBJDUMPFLAGS) -S tmp/$*.o > tmp/$*.s

tmp/%.bin: tmp/%.o src/%.ld
	arm-none-eabi-ld -Tsrc/$*.ld -o tmp/$*.elf tmp/$*.o
	arm-none-eabi-objcopy -O binary tmp/$*.elf tmp/$*.bin
	md5sum tmp/$*.bin
	
tmp/%.h: tmp/%.bin
	echo -n "#define $(call UPPERCASE,$(*D)) { " > tmp/$*.h
	echo -n `cat tmp/$*.bin | xxd -C -i` >> tmp/$*.h
	echo " }" >> tmp/$*.h

tmp/%.h: */%
	mkdir -p $(@D)
	echo -n "#define $(call UPPERCASE,$(@F)) { " > tmp/$*.h
	echo -n `cat $< | xxd -C -i` >> tmp/$*.h
	echo " }" >> tmp/$*.h
	
clean:
	rm -rf loader tmp
