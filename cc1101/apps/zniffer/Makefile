GIT_VERSION := $(shell git describe --abbrev=4 --dirty --always --tags)

APPLICATION_NAME ?= zniffer

DEFINES = \
	-DDEBUG_ENABLED \
	-DPRINT_ENABLED

INCLUDES = \
	  -I . \
	  -I ../../rpi3/inc
         
ASM_SOURCES = \

C_SOURCES = \
    main.c

CPP_SOURCES = \

HEADERS = \
	../../rpi3/inc/cc1100_raspi.h

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
CXX = g++
LD = ld
OBJDUMP = objdump
OBJCOPY = objcopy
SIZE = size

THIS_MAKEFILE := $(lastword $(MAKEFILE_LIST))

STATIC_LIBS = -L. ../../rpi3/libcc1101.a
LDLIBS = -lwiringPi 

all: build size

APPLICATION_NAME: build

build: $(APPLICATION_NAME) $(APPLICATION_NAME).lst $(APPLICATION_NAME).hex

$(APPLICATION_NAME): $(ASM_OBJECTS) $(C_OBJECTS) $(CPP_OBJECTS) $(HEADERS) $(THIS_MAKEFILE)
	$(CC) $(CXXFLAGS) $(addprefix $(OBJ_DIR)/, $(notdir $(ASM_OBJECTS))) $(addprefix $(OBJ_DIR)/, $(notdir $(C_OBJECTS))) $(addprefix $(OBJ_DIR)/, $(notdir $(CPP_OBJECTS))) $(LDLIBS) -o $@ $(STATIC_LIBS)

$(ASM_OBJECTS): | $(OBJ_DIR)

$(C_OBJECTS): | $(OBJ_DIR)

$(CPP_OBJECTS): | $(OBJ_DIR)

$(OBJ_DIR):
	mkdir -p $@

%.o: %.c $(HEADERS) $(THIS_MAKEFILE)
	$(CC) $(CXXFLAGS) -c $< -o $(addprefix $(OBJ_DIR)/, $(notdir $@))

%.o: %.cpp $(HEADERS) $(THIS_MAKEFILE)
	$(CC) $(CXXFLAGS) -c $< -o $(addprefix $(OBJ_DIR)/, $(notdir $@))

%.o: %.S $(HEADERS) $(THIS_MAKEFILE)
	$(CC) $(CXXFLAGS) -c $< -o $(addprefix $(OBJ_DIR)/, $(notdir $@)) 

%.lst: %
	$(OBJDUMP) -x -S $(APPLICATION_NAME) > $@

%.bin: %
	$(OBJCOPY) -O binary $< $@

%.hex: %
	$(OBJCOPY) -O ihex $< $@

size: 
	#$(APPLICATION_NAME)
	$(SIZE) $(APPLICATION_NAME)

.PHONY: clean
clean:
	rm -rf $(OBJ_DIR)
	rm -f $(APPLICATION_NAME)
	rm -f $(APPLICATION_NAME).bin
	rm -f $(APPLICATION_NAME).map
	rm -f $(APPLICATION_NAME).hex
	rm -f $(APPLICATION_NAME).lst
