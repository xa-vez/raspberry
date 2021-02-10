#!/bin/bash


# launch dhcp server service
sudo service isc-dhcp-server restart

# check logs
# sudo tail -f /var/log/syslog | grep DHCPACK



# launch dns (bind9) service
sudo service bind9 restart


nslookup server.example.com


