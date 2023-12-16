cmake_minimum_required(VERSION 2.8.12)
project(receiver)
set(CMAKE_VERBOSE_MAKEFILE on)


#file(GLOB SOURCES "./*.cpp")
set(SOURCES
	apps/receiver/RX_Demo.cpp
        rpi3/src/cc1100_raspi.cpp
        )

set(CMAKE_C_FLAGS "-std=c99 -pedantic -O0 -g -Wall -pedantic -Wno-unused-parameter -Wno-unused-function")

include_directories(.
        rpi3/inc/
)

link_directories(/usr/lib)
link_directories(/usr/local/lib)

message(STATUS "CMAKE_CURRENT_LIST_DIR=${CMAKE_CURRENT_LIST_DIR}")

add_executable(receiver ${SOURCES})
target_link_libraries(receiver wiringPi)
 