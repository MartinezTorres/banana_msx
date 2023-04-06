EXTRA_CFLAGS = -Wall -O3

obj-m += banana_msx.o
always-m += banana_msx.s

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
