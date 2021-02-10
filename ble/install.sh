#!/bin/bash

sudo apt-get update
sudo apt-get install -y libusb-dev libreadline-dev libglib2.0-dev libudev-dev libdbus-1-dev libical-dev

wget http://www.kernel.org/pub/linux/bluetooth/bluez-5.50.tar.xz
tar xvf bluez-5.50.tar.xz

cd bluez-5.50
./configure --enable-library

make -j4

sudo make install

btmon -v

