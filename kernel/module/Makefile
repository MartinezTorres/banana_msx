EXTRA_CFLAGS = -Wall -O3

obj-m += banana_msx.o
always-m += banana_msx.s

all:
	make -C ../linux-source-5.15.93-sunxi M=$(PWD) modules

clean:
	make -C ../linux-source-5.15.93-sunxi M=$(PWD) clean
