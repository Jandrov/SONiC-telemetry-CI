#!/bin/bash
#Desactivamos la interfaz Ethernet0
sudo docker exec -it host1 ifconfig eth1 down

#Ping desde host1 a host2 
sudo docker exec -it host1 ping 192.168.2.2 -c5

sleep 5

#Monitorización del Switch2:
sudo docker exec -it gnmicli ./bin/gnmi_get -xpath_target COUNTERS_DB -xpath interface:Ethernet1/in-pkts -target_addr 192.18.0.12:8080 -insecure -logtostderr

sudo docker exec -it gnmicli ./bin/gnmi_get -xpath_target COUNTERS_DB -xpath interface:Ethernet1/out-pkts -target_addr 192.18.0.12:8080 -insecure -logtostderr
