#include <iostream>

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <cstring>

#include <sys/mman.h>


namespace MEMORY_MAP {
	enum {
		start         = 0x58000000,
		
		stack_begin   = 0x58010000,
		stack_end     = 0x58100000,
		
		program_begin = 0x58200000,
		program_end   = 0x58300000-4,

		buffer_begin  = 0x58300000,
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
	
	void load_core() {

#include "core/core.h"
static constexpr const uint8_t core_process[] = CORE;
		
		printf("size: %08x\n", (uint32_t)sizeof(core_process));
		//printf("init: %08x\n", (uint32_t)core.init - (uint32_t)core.begin);
		
		//memcpy(&banana.shared_mem[ MEMORY_MAP::program_begin -  MEMORY_MAP::start ], (void *)bananacore_begin, (uint *)bananacore_end - (uint *)bananacore_begin);
	}

		
	
	template<typename T>
	void r(uint32_t pos, T &t) {
		t = *(T*)(shared_mem + pos - MEMORY_MAP::start);
	}

	template<typename T>
	void w(uint32_t pos, T t) {
		
		*(T*)(shared_mem + pos - MEMORY_MAP::start) = t;
	}
};

int main() {

	
	Banana_MSX banana;
	
	uint32_t i = 0x4356, j = 0;
	
	banana.w(MEMORY_MAP::buffer_begin, i);
	
	banana.r(MEMORY_MAP::buffer_begin, j);
	
	std::cerr << j << std::endl;
	
	banana.load_core();
	
	//memcpy(&banana.shared_mem[ MEMORY_MAP::program_begin -  MEMORY_MAP::start ], (void *)bananacore_begin, (uint *)bananacore_end - (uint *)bananacore_begin);
	
	//banana.w(MEMORY_MAP::start, ((int8_t *)MEMORY_MAP::program_begin) + ((uint *)bananacore_init - (uint *)bananacore_begin ));

	for (int i=0; i<10; i++) {
		char c;
		banana.r(MEMORY_MAP::buffer_begin + i, c);
		printf("%02x %c\n", (int)c, c);
	}
}
