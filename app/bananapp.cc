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

#include "core/src/bsx.h"

namespace MEMORY_MAP_OLD {
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
	volatile BSX::MEMMAP_U *mem;
	
	volatile bool thread_alive;
	std::shared_ptr<std::thread> t;
	
	Banana_MSX() {
		
		fd = open("/dev/banana_msx", O_RDWR);
		if (fd < 0) throw std::runtime_error("Failed to open file");
		
		shared_mem = (uint8_t *) mmap( NULL, 128_M, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0 );
		if (shared_mem == MAP_FAILED) throw std::runtime_error("Mapping failed");
		
		mem = &HAL_map<BSX::MEMMAP_U>(shared_mem, 0x58000000);
		volatile auto &log = *&mem->log;
		
		log.pos = 0;

		thread_alive = true;
		t = std::make_shared<std::thread>([this](){ this->log_thread(); });
	}

	~Banana_MSX() {
		thread_alive = false;
		if (t) t->join();
		
		munmap(shared_mem, 128_M);
		close(fd);
	}
	
	void log_thread() {

		using namespace std::chrono_literals;
		
		volatile auto &log = *&mem->log;
	
 
   		uint32_t pos = 0;
		while (thread_alive) {
			
			uint32_t new_pos = log.pos;
			if (pos == new_pos) {
				std::this_thread::sleep_for(100ms);				
				continue;
			}
			
			putchar(log.data[pos++]);
			pos = pos & ((1<<20)-1);
		}
	}
	
	void load_core() {

		#include "core/core.h"
		static constexpr const uint8_t core_process[] = CORE;
		
		uint32_t init = *(uint32_t *)&core_process[0];
		
		printf("size: %d bytes\n", (uint32_t)sizeof(core_process));
		printf("init: %08x\n", init);
		
		memcpy((void *)mem->program, core_process, sizeof(core_process));
		mem->init = InitType(init);
	}
};

int main() {

	Banana_MSX banana;
	banana.load_core();
	
	sleep(5);
}
