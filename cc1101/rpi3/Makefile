GIT_VERSION := $(shell git describe --abbrev=4 --dirty --always --tags)

APPLICATION_NAME ?= libcc1101

DEFINES = \
	-DDEBUG_ENABLED

INCLUDES = \
	  -I inc
         
ASM_SOURCES = \

C_SOURCES = \

CPP_SOURCES = \
	src/cc1100_raspi.cpp

HEADERS = \
	inc/cc1100_raspi.h


ASM_OBJECTS = $(patsubst %.S, %.o, $(ASM_SOURCES))

C_OBJECTS = $(patsubst %.c, %.o, $(C_SOURCES))

CPP_OBJECTS = $(patsubst %.cpp, %.o, $(CPP_SOURCES))

OBJ_DIR = obj

LINKER_SCRIPT =

CXXFLAGS := $(CXXFLAGS) \
        -pedantic -Wall -O0 -g -DAPP_VERSION=\"$(GIT_VERSION)\"
CXXFLAGS +=$(DEFINES)
CXXFLAGS +=$(INCLUDES)

CC = gcc
CXX = gcc
LD = ld
OBJDUMP = objdump
OBJCOPY = objcopy
SIZE = size

THIS_MAKEFILE := $(lastword $(MAKEFILE_LIST))

.PHONY: clean
#LDIRS = -L/usr/local/lib -L/usr/lib
LDIRS =

LDLIBS = 

all: build

build: $(APPLICATION_NAME).a 

$(APPLICATION_NAME).a: $(ASM_OBJECTS) $(C_OBJECTS) $(CPP_OBJECTS) $(HEADERS) $(THIS_MAKEFILE)
	ar rcs $(APPLICATION_NAME).a $(addprefix $(OBJ_DIR)/, $(notdir $(ASM_OBJECTS))) $(addprefix $(OBJ_DIR)/, $(notdir $(C_OBJECTS))) $(addprefix $(OBJ_DIR)/, $(notdir $(CPP_OBJECTS))) 

$(ASM_OBJECTS): | $(OBJ_DIR)

$(C_OBJECTS): | $(OBJ_DIR)

$(CPP_OBJECTS): | $(OBJ_DIR)

$(OBJ_DIR):
	mkdir -p $@

%.o: %.c $(HEADERS) $(THIS_MAKEFILE)
	$(CXX) $(CXXFLAGS) -c $< -o $(addprefix $(OBJ_DIR)/, $(notdir $@))

%.o: %.cpp $(HEADERS) $(THIS_MAKEFILE)
	$(CXX) $(CXXFLAGS) -c $< -o $(addprefix $(OBJ_DIR)/, $(notdir $@))

%.o: %.S $(HEADERS) $(THIS_MAKEFILE)
	$(CXX) $(CXXFLAGS) -c $< -o $(addprefix $(OBJ_DIR)/, $(notdir $@)) 

# size: 
# 	#$(APPLICATION_NAME).elf
# 	$(SIZE) $(APPLICATION_NAME).lib

clean:
	rm -rf $(OBJ_DIR)
	rm -f $(APPLICATION_NAME).a
