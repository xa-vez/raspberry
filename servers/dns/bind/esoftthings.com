;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	esoftlink.esoftthings.com. root.esoftlink.esoftthings.com. (
			      2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	esoftlink.esoftthings.com.
@	IN	A	192.168.10.1
esoftlink  IN      A       192.168.10.1


