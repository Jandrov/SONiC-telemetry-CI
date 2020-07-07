#wget https://sonic-jenkins.westus2.cloudapp.azure.com/job/p4/job/buildimage-p4-all/543/artifact/target/docker-sonic-p4.gz
wget https://sonic-jenkins.westus2.cloudapp.azure.com/job/p4/job/buildimage-p4-all/lastStableBuild/artifact/target/docker-sonic-p4.gz

sudo docker load < docker-sonic-p4.gz

#Contruimos las imagenes atendiendo al Dockerfile
sudo docker build -f Dockerfile_sonic . 
sudo docker build -f Dockerfile_golang1 . -t gnmi_client
sudo docker images
