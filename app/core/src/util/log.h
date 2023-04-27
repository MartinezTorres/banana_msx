#pragma once

#include <stdint.h>
#include "nanoprintf.h"

template<uint32_t SZ>
struct Log {
	
	uint32_t pos;
	uint8_t data[1<<SZ];
	
	void init() { pos = 0; }
	
	void push(char c) {
		data[pos++] = c;
		pos = pos & ((1<<SZ)-1);
	}

	inline Log& operator<<(const char *str) {
		
		while (*str) 
			push(*str++);
			
		return *this;
	}
	
	static inline void _out_buffer(char character, void* buffer, size_t idx, size_t maxlen)
	{
	  if (idx < maxlen) {
		((char*)buffer)[idx] = character;
	  }
	}

	static inline void _out_Log(char character, void* log, size_t , size_t ) {
		
		((Log *)log)->push(character);
	}
		
	inline int printf(const char* format, ...) {
		
	  va_list va;
	  va_start(va, format);
	  const int ret = _vsnprintf(_out_Log, (char *)this, (size_t)-1, format, va);
	  va_end(va);
	  return ret;
	}	
};
