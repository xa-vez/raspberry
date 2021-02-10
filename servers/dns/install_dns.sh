#!/bin/bash

echo "install packages ..."
#sudo apt install bind9 bind9utils


sudo cp bind/named.conf.local /etc/bind/.
sudo cp bind/forward.example.com /etc/bind/.
sudo cp bind/reverse.example.com /etc/bind/.
sudo cp bind/esoftthings.com /etc/bind/.

echo "restart bind9 service ...."
sudo service bind9 restart

