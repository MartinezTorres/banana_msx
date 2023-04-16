
bananapp: *.cc core/core.h
	$(CXX) -pthread -O3 bananapp.cc -o bananapp

core/core.h: core/src/*
	cd core && make

clean:
	cd core && make clean
	rm -f bananapp
