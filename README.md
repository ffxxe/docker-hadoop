# docker-hadoop

**Install docker**
sudo yum install docker

**Enable service**
sudo systemctl start docker; systemctl enable docker

**Create docker bridge**
sudo docker network create net-hadoop

**Run headnode**
sudo docker run -p 8088:8088 -p 9870:9870 -d --name headnode --network=net-hadoop ffxxe/hadoop-headnode:hadoop3.1.2

**Run worker**
sudo docker run -d --name worker --network=net-hadoop ffxxe/hadoop-worker:hadoop3.1.2
