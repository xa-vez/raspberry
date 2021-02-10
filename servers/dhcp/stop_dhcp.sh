#!/bin/bash


sudo service isc-dhcp-server stop

#sudo service isc-dhcp-server status

sudo rm /var/lib/dhcp/dhcpd.leases~

#sudo echo "" > /var/lib/dhcp/dhcpd.lease

echo "done"


