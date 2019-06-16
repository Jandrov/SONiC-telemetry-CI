#!/bin/bash
echo "Borrando los contenedores y bridges con el mismo nombre..."
sudo docker rm -f switch1
sudo docker rm -f switch2
sudo docker rm -f host1
sudo docker rm -f host2
sudo docker rm -f gnmicli
sudo ovs-vsctl del-br switch1_switch2
sudo ovs-vsctl del-br host1_switch1
sudo ovs-vsctl del-br host2_switch2

sudo docker rm $(sudo docker ps -qa) > /dev/null 2>&1
sudo docker rmi $(sudo docker images --filter 'dangling=true' -q --no-trunc) > /dev/null 2>&1

sudo docker network prune -f

#echo "Borrando las imagenes..."
#sudo docker rmi -f docker-sonic-p4:latest
#sudo docker rmi -f ubuntu:14.04
