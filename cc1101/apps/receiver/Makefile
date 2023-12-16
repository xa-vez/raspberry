GIT_VERSION := $(shell git describe --abbrev=4 --dirty --always --tags)

APPLICATION_NAME ?= RX_Demo

DEFINES = \
	-DDEBUG_ENABLED \
	-DPRINT_ENABLED

INCLUDES = \
	  -I . \
	  -I ../../rpi3/inc
         
ASM_SOURCES = \

C_SOURCES = \

CPP_SOURCES = \
	RX_Demo.cpp \

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
CXX = gcc
LD = ld
OBJDUMP = objdump
OBJCOPY = objcopy
SIZE = size

THIS_MAKEFILE := $(lastword $(MAKEFILE_LIST))

.PHONY: clean
STATIC_LIBS = -L. ../../rpi3/libcc1101.a
LDLIBS = -lwiringPi 

all: build size

build: $(APPLICATION_NAME).elf $(APPLICATION_NAME).lst $(APPLICATION_NAME).bin $(APPLICATION_NAME).hex

$(APPLICATION_NAME).elf: $(ASM_OBJECTS) $(C_OBJECTS) $(CPP_OBJECTS) $(HEADERS) $(THIS_MAKEFILE)
	$(CXX) $(CXXFLAGS) $(addprefix $(OBJ_DIR)/, $(notdir $(ASM_OBJECTS))) $(addprefix $(OBJ_DIR)/, $(notdir $(C_OBJECTS))) $(addprefix $(OBJ_DIR)/, $(notdir $(CPP_OBJECTS))) $(LDLIBS) -o $@ $(STATIC_LIBS)

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

%.lst: %.elf
	$(OBJDUMP) -x -S $(APPLICATION_NAME).elf > $@

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@

%.hex: %.elf
	$(OBJCOPY) -O ihex $< $@

size: 
	#$(APPLICATION_NAME).elf
	$(SIZE) $(APPLICATION_NAME).elf

clean:
	rm -rf $(OBJ_DIR)
	rm -f $(APPLICATION_NAME).elf
	rm -f $(APPLICATION_NAME).bin
	rm -f $(APPLICATION_NAME).map
	rm -f $(APPLICATION_NAME).hex
	rm -f $(APPLICATION_NAME).lst
