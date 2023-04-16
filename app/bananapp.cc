#include <iostream>

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <cstring>

#include <sys/mman.h>

#include <thread>
#include <memory>
#include <chrono>

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
	
	volatile bool thread_alive;
	std::shared_ptr<std::thread> t;
	
	Banana_MSX() {
		
		fd = open("/dev/banana_msx", O_RDWR);
		if (fd < 0) throw std::runtime_error("Failed to open file");
		
		shared_mem = (uint8_t *) mmap( NULL, MEMORY_MAP::end - MEMORY_MAP::start, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0 );
		if (shared_mem == MAP_FAILED) throw std::runtime_error("Mapping failed");
		
		w<uint32_t>(MEMORY_MAP::buffer_begin, 0);
		thread_alive = true;
		t = std::make_shared<std::thread>([this](){ this->log_thread(); });
	}

	~Banana_MSX() {
		thread_alive = false;
		if (t) t->join();
		
		munmap(shared_mem, MEMORY_MAP::end - MEMORY_MAP::start);
		close(fd);
	}
	
	void log_thread() {

		using namespace std::chrono_literals;
 
   		uint32_t pos;
		r(MEMORY_MAP::buffer_begin, pos);
		
		while (thread_alive) {
			
			uint32_t new_pos;
			r(MEMORY_MAP::buffer_begin, new_pos);
			
			if (pos == new_pos) {
				std::this_thread::sleep_for(10ms);				
				continue;
			}
			
			char c;
			r(MEMORY_MAP::buffer_begin+4+pos, c);
			putchar(c);
			pos++;
			pos = pos & ((1<<16)-1);
		}
	}
	
	
	
	void load_core() {

#include "core/core.h"
static constexpr const uint8_t core_process[] = CORE;
		
		uint32_t init = *(uint32_t *)&core_process[0];
		
		printf("size: %d bytes\n", (uint32_t)sizeof(core_process));
		printf("init: %08x\n", init);
		
		//memcpy(&shared_mem[ MEMORY_MAP::program_begin -  MEMORY_MAP::start ], (void *)&core_process[0], sizeof(core_process));
		
		uint32_t pos = MEMORY_MAP::program_begin;
		
		for (auto c : core_process)
			w(pos++, c);
		
		w(MEMORY_MAP::start, init);
	}

		
	
	template<typename T>
	void r(uint32_t pos, T &t) {
		
		//lseek(fd, pos - MEMORY_MAP::start, SEEK_SET);
		//if (read(fd, &t, sizeof(T)) != sizeof(T)) throw std::runtime_error("Failed to read");
		t = *(T*)(shared_mem + pos - MEMORY_MAP::start);
	}

	template<typename T>
	void w(uint32_t pos, T t) {
		
		//lseek(fd, pos - MEMORY_MAP::start, SEEK_SET);
		//if (write(fd, &t, sizeof(T)) != sizeof(T)) throw std::runtime_error("Failed to read");
		*(T*)(shared_mem + pos - MEMORY_MAP::start) = t;
	}
};

int main() {

	
	Banana_MSX banana;

	banana.load_core();
	
	sleep(10);

}
