# force macs to use g++-15 to avoid clang mapped to g++
ifeq ($(OS),Windows_NT)
	CXX = g++
else
	OS_NAME := $(shell uname -s)
	ifeq ($(OS_NAME),Darwin)
		CXX = g++-15
	else
		CXX = g++
	endif
endif

# compiler options
CXXFLAGS = -g -Wall -Wextra
CXXFLAGS += -std=c++20 -fmodules-ts -pedantic -pedantic-errors
CXXFLAGS += -Wfloat-equal -Wredundant-decls -Wshadow -Wconversion -Wuninitialized

# list .h files here
HEADERS =

# list .cpp files here
TEST_FILES = tests.cpp
SHARED_FILES = 

.PHONY: all
all: tests.exe

.PHONY: tests.exe # Always force rebuild of tests
tests.exe:  $(SHARED_FILES) $(TEST_FILES) $(HEADERS)
	$(CXX) $(CXXFLAGS) $(SHARED_FILES) $(TEST_FILES) -o $@

.PHONY: clean
clean:
	rm -f tests.exe
