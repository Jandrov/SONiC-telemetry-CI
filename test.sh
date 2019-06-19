#!/bin/bash
#Ping desde host1 a switch1
sudo docker exec -it host1 ping 192.168.1.1 -c10

#Ping desde host1 a switch2
sudo docker exec -it host1 ping 192.168.2.1 -c10

#Ping desde host1 a host2 
sudo docker exec -it host2 ping 192.168.1.2 -c10

sleep 20 

#Monitorización switch2
sudo docker exec -it gnmicli ./bin/gnmi_get -xpath_target COUNTERS_DB -xpath interface:Ethernet1/in-pkts -target_addr 192.18.0.11:8080 -insecure -logtostderr
sudo docker exec -it gnmicli ./bin/gnmi_get -xpath_target COUNTERS_DB -xpath interface:Ethernet1/out-pkts -target_addr 192.18.0.11:8080 -insecure -logtostderr
sudo docker exec -it gnmicli ./bin/gnmi_get -xpath_target COUNTERS_DB -xpath interface:Ethernet0/in-pkts -target_addr 192.18.0.11:8080 -insecure -logtostderr
sudo docker exec -it gnmicli ./bin/gnmi_get -xpath_target COUNTERS_DB -xpath interface:Ethernet0/out-pkts -target_addr 192.18.0.11:8080 -insecure -logtostderr

#Monitorización switch2
sudo docker exec -it gnmicli ./bin/gnmi_get -xpath_target COUNTERS_DB -xpath interface:Ethernet1/in-pkts -target_addr 192.18.0.12:8080 -insecure -logtostderr
sudo docker exec -it gnmicli ./bin/gnmi_get -xpath_target COUNTERS_DB -xpath interface:Ethernet1/out-pkts -target_addr 192.18.0.12:8080 -insecure -logtostderr
sudo docker exec -it gnmicli ./bin/gnmi_get -xpath_target COUNTERS_DB -xpath interface:Ethernet0/in-pkts -target_addr 192.18.0.12:8080 -insecure -logtostderr
sudo docker exec -it gnmicli ./bin/gnmi_get -xpath_target COUNTERS_DB -xpath interface:Ethernet0/out-pkts -target_addr 192.18.0.12:8080 -insecure -logtostderr
