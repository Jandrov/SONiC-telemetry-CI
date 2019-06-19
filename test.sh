#!/bin/bash
#Ping desde switch1 a host1
sudo docker exec -it switch1 ping 192.168.1.2 -c 2 -l 32

#Ping desde host2 a host1 
sudo docker exec -it host2 ping 192.168.1.2 -c 2 -l 32

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
