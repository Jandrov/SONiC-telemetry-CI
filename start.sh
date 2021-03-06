#!/bin/bash

sudo docker run --net=none --privileged --entrypoint /bin/bash --name switch1 -it -d -v $PWD/switch1:/sonic docker-sonic-p4:latest
sudo docker run --net=none --privileged --entrypoint /bin/bash --name switch2 -it -d -v $PWD/switch2:/sonic docker-sonic-p4:latest
sudo docker run --net=none --privileged --entrypoint /bin/bash --name host1 -it -d ubuntu:14.04
sudo docker run --net=none --privileged --entrypoint /bin/bash --name host2 -it -d ubuntu:14.04

sudo ovs-vsctl add-br switch1_switch2
sudo ovs-docker add-port switch1_switch2 sw_port0 switch1
sudo ovs-docker add-port switch1_switch2 sw_port0 switch2

sudo ovs-vsctl add-br host1_switch1
sudo ovs-docker add-port host1_switch1 sw_port1 switch1
sudo ovs-docker add-port host1_switch1 eth1 host1

sudo ovs-vsctl add-br host2_switch2
sudo ovs-docker add-port host2_switch2 sw_port1 switch2
sudo ovs-docker add-port host2_switch2 eth1 host2


sudo docker exec -d host1 sysctl net.ipv6.conf.eth0.disable_ipv6=1
sudo docker exec -d host1 sysctl net.ipv6.conf.eth1.disable_ipv6=1
sudo docker exec -d host2 sysctl net.ipv6.conf.eth0.disable_ipv6=1
sudo docker exec -d host2 sysctl net.ipv6.conf.eth1.disable_ipv6=1

sudo docker exec -d host1 ifconfig eth1 192.168.1.2/24 mtu 1400
sudo docker exec -d host1 ip route replace default via 192.168.1.1
sudo docker exec -d host2 ifconfig eth1 192.168.2.2/24 mtu 1400
sudo docker exec -d host2 ip route replace default via 192.168.2.1


sudo docker exec -d switch1 ip netns add sw_net
sudo docker exec -d switch1 ip link set dev sw_port0 netns sw_net
sudo docker exec -d switch1 ip netns exec sw_net sysctl net.ipv6.conf.sw_port0.disable_ipv6=1
sudo docker exec -d switch1 ip netns exec sw_net ip link set sw_port0 up
sudo docker exec -d switch1 ip link set dev sw_port1 netns sw_net
sudo docker exec -d switch1 ip netns exec sw_net sysctl net.ipv6.conf.sw_port1.disable_ipv6=1
sudo docker exec -d switch1 ip netns exec sw_net ip link set sw_port1 up

sudo docker exec -d switch2 ip netns add sw_net
sudo docker exec -d switch2 ip link set dev sw_port0 netns sw_net
sudo docker exec -d switch2 ip netns exec sw_net sysctl net.ipv6.conf.sw_port0.disable_ipv6=1
sudo docker exec -d switch2 ip netns exec sw_net ip link set sw_port0 up
sudo docker exec -d switch2 ip link set dev sw_port1 netns sw_net
sudo docker exec -d switch2 ip netns exec sw_net sysctl net.ipv6.conf.sw_port1.disable_ipv6=1
sudo docker exec -d switch2 ip netns exec sw_net ip link set sw_port1 up

#########################################################################################################

#Bridge de gestion de contenedores
sudo docker network create \
    --driver bridge \
    --subnet=192.18.0.0/24 \
    --gateway=192.18.0.1 \
    --opt "com.docker.network.bridge.name"="gestion" \
    gestion

#Creacion de contenedor con gnmi_get
sudo docker run --privileged --entrypoint /bin/sh --name gnmicli -it -d gnmi_client

sudo ./iftobridge add-link mgmt1 switch1 gestion --sip="192.18.0.11/24"
sudo ./iftobridge add-link mgmt1 switch2 gestion --sip="192.18.0.12/24"
sudo ./iftobridge add-link mgmt1 gnmicli gestion --sip="192.18.0.10/24"

#Actualizacion de redisDB
sudo docker exec -d switch1 sh /sonic/scripts/update_redisDB.sh &
sudo docker exec -d switch2 sh /sonic/scripts/update_redisDB.sh &

#Activamos la telemetría en los switches:
sudo docker exec -d switch1 ./sonic/telemetry --port 8080 --insecure --logtostderr --allow_no_client_auth &
sudo docker exec -d switch2 ./sonic/telemetry --port 8080 --insecure --logtostderr --allow_no_client_auth &

#########################################################################################################

echo "Booting switches, please wait ~3 minutes for switches to load"
sudo docker exec -d switch1 sh /sonic/scripts/startup.sh
sudo docker exec -d switch2 sh /sonic/scripts/startup.sh

sleep 180

docker ps
