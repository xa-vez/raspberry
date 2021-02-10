#!/bin/bash

#########################################################

echo installing packages ...
# install dhcp packages
sudo apt update && sudo apt install isc-dhcp-server      
#########################################################

echo configuring dhcp server ...
# interface required is set in this file
sudo cp config/isc-dhcp-server /etc/default/.

# required ip is set in this file
sudo cp config/dhcpd.conf /etc/dhcp/.

########################################################
echo done !

# check ip address leasing
# cat /var/lib/dhcp/dhcpd.leases | grep hostname
# dhcp-lease-list
