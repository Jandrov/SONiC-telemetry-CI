while /bin/true; do
#Getting Ethernet0 statistics (packet-in):
	in_octets_Eth0=$(cat /sys/class/net/Ethernet0/statistics/rx_bytes)
	in_pkts_Eth0=$(cat /sys/class/net/Ethernet0/statistics/rx_packets)
	#in_unicast_Eth0=$(cat /sys/class/net/Ethernet0/statistics/)
	#in_broadcast_Eth0=$(cat /sys/class/net/Ethernet0/statistics/)
	#in_multicast_Eth0=$(cat /sys/class/net/Ethernet0/statistics/multicast)
	#in_discards_Eth0=$(cat /sys/class/net/Ethernet0/statistics/)
	in_errors_Eth0=$(cat /sys/class/net/Ethernet0/statistics/rx_errors)
	
#Getting Ethernet0 statistics (packet-out):
	out_octets_Eth0=$(cat /sys/class/net/Ethernet0/statistics/tx_bytes)
	out_pkts_Eth0=$(cat /sys/class/net/Ethernet0/statistics/tx_packets)
	#out_unicast_Eth0=$(cat /sys/class/net/Ethernet0/statistics/)
	#out_broadcast_Eth0=$(cat /sys/class/net/Ethernet0/statistics/)
	#out_multicast_Eth0=$(cat /sys/class/net/Ethernet0/statistics/multicast)
	#out_discards_Eth0=$(cat /sys/class/net/Ethernet0/statistics/)
	out_errors_Eth0=$(cat /sys/class/net/Ethernet0/statistics/tx_errors)

#Getting Ethernet1 statistics (packet-in):
	in_octets_Eth1=$(cat /sys/class/net/Ethernet1/statistics/rx_bytes)
	in_pkts_Eth1=$(cat /sys/class/net/Ethernet1/statistics/rx_packets)
	#in_unicast_Eth1=$(cat /sys/class/net/Ethernet1/statistics/)
	#in_broadcast_Eth1=$(cat /sys/class/net/Ethernet1/statistics/)
	#in_multicast_Eth1=$(cat /sys/class/net/Ethernet1/statistics/multicast)
	#in_discards_Eth1=$(cat /sys/class/net/Ethernet1/statistics/)
	in_errors_Eth1=$(cat /sys/class/net/Ethernet1/statistics/rx_errors)
	
#Getting Ethernet1 statistics (packet-out):
	out_octets_Eth1=$(cat /sys/class/net/Ethernet1/statistics/tx_bytes)
	out_pkts_Eth1=$(cat /sys/class/net/Ethernet1/statistics/tx_packets)
	#out_unicast_Eth1=$(cat /sys/class/net/Ethernet1/statistics/)
	#out_broadcast_Eth1=$(cat /sys/class/net/Ethernet1/statistics/)
	#out_multicast_Eth1=$(cat /sys/class/net/Ethernet1/statistics/multicast)
	#out_discards_Eth1=$(cat /sys/class/net/Ethernet1/statistics/)
	out_errors_Eth1=$(cat /sys/class/net/Ethernet1/statistics/tx_errors)

#Updating Ethernet0 in redis:
    	redis-cli -n 2 hset interface:Ethernet0 in-octets $in_octets_Eth0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet0 in-pkts $in_pkts_Eth0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet0 in-unicast-pkts 0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet0 in-broadcast-pkts 0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet0 in-multicast-pkts 0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet0 in-discards 0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet0 in-unknown-protos 0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet0 in-fcs-errors $in_errors_Eth0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet0 out-octets $out_octets_Eth0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet0 out-pkts $out_pkts_Eth0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet0 out-unicast-pkts 0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet0 out-broadcast-pkts 0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet0 out-multicast-pkts 0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet0 out-discards 0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet0 out-errors $out_errors_Eth0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet0 carrier-transitions 0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet0 last-clear 0 > /dev/null 2>&1

#Updating Ethernet1 in redis:
	redis-cli -n 2 hset interface:Ethernet1 in-octets $in_octets_Eth1 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet1 in-pkts $in_pkts_Eth1 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet1 in-unicast-pkts 0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet1 in-broadcast-pkts 0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet1 in-multicast-pkts 0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet1 in-discards 0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet1 in-unknown-protos 0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet1 in-fcs-errors $in_errors_Eth1 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet1 out-octets $out_octets_Eth1 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet1 out-pkts 0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet1 out-unicast-pkts 0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet1 out-broadcast-pkts 0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet1 out-multicast-pkts 0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet1 out-discards 0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet1 out-errors $out_errors_Eth1 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet1 carrier-transitions 0 > /dev/null 2>&1
	redis-cli -n 2 hset interface:Ethernet1 last-clear 0 > /dev/null 2>&1

	#Esperamos 10 segundos para la siguiente actualizacion
	sleep 10
done &


