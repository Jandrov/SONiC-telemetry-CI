#!/bin/bash
#Ping desde host2 a switch2
sudo docker exec -it host2 ping 192.168.2.1 -c10
sleep 2

#Ping desde host1 a host2 
sudo docker exec -it host1 ping 192.168.2.2 -c10
