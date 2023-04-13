#include <iostream>

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <sys/mman.h>

namespace MEMORY_MAP {
	enum {
		start         = 0x58000000,
		
		stack_begin   = 0x58010000,
		stack_end     = 0x58100000,
		
		program_begin = 0x58200000,
		program_end   = 0x58300000-4,

		buffer_begin  = 0x58300000 - start,
		buffer_end    = 0x58400000,
		
		end     = 0x60000000,
	};
};

struct Banana_MSX {
	
	int fd;
	uint8_t *shared_mem;
	
	Banana_MSX() {
		
		int fd = open("/dev/banana_msx", O_RDWR);
		if (fd < 0) throw std::runtime_error("Failed to open file");
		
		shared_mem = (uint8_t *) mmap( NULL, MEMORY_MAP::end - MEMORY_MAP::start, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0 );
		if (shared_mem == MAP_FAILED) throw std::runtime_error("Mapping failed");
	
		close(fd);
	}

	~Banana_MSX() {
		munmap(shared_mem, MEMORY_MAP::end - MEMORY_MAP::start);
	}
	
	template<typename T>
	void r(uint32_t pos, T &t) {
		t = *(T*)(shared_mem + pos);
	}

	template<typename T>
	void w(uint32_t pos, const T &t) {
		
		*(T*)(shared_mem + pos) = t;
	}
};

int main() {

	
	Banana_MSX banana;
	
	uint32_t i = 377, j = 0;
	
	banana.w(MEMORY_MAP::buffer_begin, i);
	
	banana.r(MEMORY_MAP::buffer_begin, j);
	
	std::cerr << j << std::endl;
}
