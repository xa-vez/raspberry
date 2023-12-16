

Create library

example:

pi@rpi3: $ make
mkdir -p obj
gcc  -pedantic -Wall -O0 -g -DAPP_VERSION=\"\" -DDEBUG_ENABLED -I inc -c src/cc1100_raspi.cpp -o obj/cc1100_raspi.o
ar rcs libcc1101.a   obj/cc1100_raspi.o 

pi@rpi3:~/Work/CC1101/rpi3 $ make clean
rm -rf obj
rm -f libcc1101.a