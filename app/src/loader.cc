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

#include <include/bsx.h>

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
	
	void load_stage1() {
		
		using namespace std::chrono_literals;

		#include <tmp/stage1/stage1.h>
		static constexpr const uint8_t stage1[] = STAGE1;
		
		printf("Stage1 size: %d bytes\n", uint32_t(sizeof(stage1)));

		uint32_t init_address = ((uint32_t *)stage1)[0];

		printf("Stage1 init: %08x \n", init_address);
		
		if (mem->stage1_init == InitType(0xC0FFEE)) {
			
			printf("Stage1 already loaded\n");
			return;
		}
		
		memcpy((void *)&mem->stage1[0], &stage1[0], sizeof(stage1));
		mem->stage1_init = InitType(init_address);
		
		for (int i=0; i<100; i++) {
			
			if (mem->stage1_init == InitType(0xC0FFEE)) {
				printf("Stage1 finished loading\n");
				return;
			}
			std::this_thread::sleep_for(10ms);
		}
		
		printf("Stage1 didn't load\n");
	}

	void load_stage2() {

		#include <tmp/stage2/stage2.h>
		static constexpr const uint8_t stage2[] = STAGE2;
		
		printf("Stage2 size: %d bytes\n", uint32_t(sizeof(stage2)));

		uint32_t init_address = ((uint32_t *)stage2)[0];

		printf("Stage2 init: %08x \n", init_address);
		
		if (mem->stage2_init != InitType(0xBADC0DE)) {
			
			printf("Stage1 not ready for Stage2\n");
			return;
		}
		
		if (mem->stage2_init == InitType(init_address)) {
			
			printf("Stage2 already loaded\n");
			return;
		}
		
		memcpy((void *)&mem->stage2[0], &stage2[0], sizeof(stage2));
		mem->stage2_init = InitType(init_address);
	}};

int main() {

	Banana_MSX banana;
	banana.load_stage1();
	banana.load_stage2();
	
	sleep(3);
}
