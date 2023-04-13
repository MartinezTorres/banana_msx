#include <stdint.h>

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


template<uint32_t SZ>
struct CircularBuffer {
	
	uint32_t pos;
	uint8_t data[1<<SZ];
	
	void init() { pos = 0; }
	
	void push(char c) {
		data[pos++] = c;
		pos = pos & ((1<<SZ)-1);
	}
	
};

template<uint32_t SZ>
struct Log {
	
	static CircularBuffer<SZ> &b() {
		
		return *(CircularBuffer<SZ> *)(MEMORY_MAP::buffer_begin);
	}  
	
	Log() {
		
		b().init();
	}
	
	Log& operator<<(const char *str) {
		
		while (*str) 
			b().push(*str++);
			
		return *this;
	}	
};

extern "C" {
	
void main() {

	//while (1);

	Log<16> log;
	
	log << "Hello world!\n";
	
}

}

