#!/bin/bash

#Ping desde host1 a switch1
sudo docker exec -it host1 ping 192.168.1.1 -c5

#Ping desde switch1 a host1
sudo docker exec -it switch1 ping 192.168.1.2 -c5

#Ping desde host1 a host2
sudo docker exec -it host1 ping 192.168.2.2 -c5

#Ping desde host2 a switch2
sudo docker exec -it host2 ping 192.168.2.1 -c5

#Ping desde switch2 a host2
sudo docker exec -it switch2 ping 192.168.2.2 -c5

#Ping desde host2 a host1
sudo docker exec -it host2 ping 192.168.1.2 -c5

sleep 10 

#Monitorización switch1
sudo echo "Paquetes recibidos por Ethernet 1 en switch1"
sudo docker exec -it gnmicli ./bin/gnmi_get -xpath_target COUNTERS_DB -xpath interface:Ethernet1/in-pkts -target_addr 192.18.0.11:8080 -insecure -logtostderr
sudo echo "Paquetes recibidos por Ethernet 0 en switch1"
sudo docker exec -it gnmicli ./bin/gnmi_get -xpath_target COUNTERS_DB -xpath interface:Ethernet0/in-pkts -target_addr 192.18.0.11:8080 -insecure -logtostderr

#Monitorización switch2
sudo echo "Paquetes recibidos por Ethernet 1 en switch2"
sudo docker exec -it gnmicli ./bin/gnmi_get -xpath_target COUNTERS_DB -xpath interface:Ethernet1/in-pkts -target_addr 192.18.0.12:8080 -insecure -logtostderr
sudo echo "Paquetes recibidos por Ethernet 0 en switch2"
sudo docker exec -it gnmicli ./bin/gnmi_get -xpath_target COUNTERS_DB -xpath interface:Ethernet0/in-pkts -target_addr 192.18.0.12:8080 -insecure -logtostderr
