#!/bin/bash

#Activación de la telemetría en el switch2
sudo docker exec switch2 ./sonic/telemetry --port 8080 --insecure --logtostderr --allow_no_client_auth &
sleep 15

#Monitorización del Switch2:
sudo docker exec -it gnmicli ./bin/gnmi_get -xpath_target COUNTERS_DB -xpath interface:Ethernet1/in-pkts -target_addr 192.18.0.12:8080 -insecure -logtostderr

#Ping desde host1 a host2 
sudo docker exec -it host1 ping 192.168.2.2 -c10

sleep 5

#Monitorización del Switch2:
sudo docker exec -it gnmicli ./bin/gnmi_get -xpath_target COUNTERS_DB -xpath interface:Ethernet1/in-pkts -target_addr 192.18.0.12:8080 -insecure -logtostderr
