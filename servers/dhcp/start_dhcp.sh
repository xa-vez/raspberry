#!/bin/bash

INTERFACE='eth0'

# set static ip
sudo cp config/dhcpcd.conf /etc/.
sudo ifconfig ${INTERFACE} down
sudo ifconfig ${INTERFACE} up
sleep 10

# display interface
sudo ifconfig ${INTERFACE}

# restart the service
sudo service isc-dhcp-server start
sudo service isc-dhcp-server status

echo "done"
