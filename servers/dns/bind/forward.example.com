;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	server.example.com. root.server.example.com. (
			      2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	server.example.com.
@	IN	A	192.168.10.1
server  IN      A       192.168.10.1
host    IN      A       192.168.10.1
client  IN      A       192.168.10.12
www     IN      A       192.168.10.12

