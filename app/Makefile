CFLAGS = -pthread -Wall -Wextra -Ofast -fno-strict-aliasing -static-libgcc -static
CXX=arm-linux-gnueabihf-g++

bananapp: *.cc core/core.h
	$(CXX) $(CFLAGS) bananapp.cc -o bananapp

core/core.h: core/src/*
	cd core && make

clean:
	cd core && make clean
	rm -f bananapp
