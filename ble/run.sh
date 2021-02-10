#!/bin/bash 

sudo systemctl start hciuart.service

sudo hciconfig hci0 up
sudo hcitool -i hci0 lescan
