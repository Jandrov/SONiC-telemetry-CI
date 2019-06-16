wget https://sonic-jenkins.westus2.cloudapp.azure.com/job/p4/job/buildimage-p4-all/613/artifact/target/docker-sonic-p4.gz
sudo docker load < docker-sonic-p4.gz
sudo docker pull ubuntu:14.04

#Contruimos las imagenes atendiendo al Dockerfile
sudo docker build -f Dockerfile_sonic . 
sudo docker build -f Dockerfile_golang1 . -t gnmi_client
sudo docker images
