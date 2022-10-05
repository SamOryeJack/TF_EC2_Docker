#!/bin/bash

# create a repository to store the docker image in docker hub

# launch an ec2 instance. open port 80 and port 22

# install and configure docker on the ec2 instance
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo systemctl enable docker

# create a dockerfile

# build the docker image
sudo docker build -t image_100422 .

# login to your docker hub account ~~~Need to create a txt file with password
cat ~/Desktop/dockcred.txt | sudo docker login --username samoryejack --password-stdin

# use the docker tag command to give the image a new name
sudo docker tag image_100422 samoryejack/dockertf1

# push the image to your docker hub repository
sudo docker push samoryejack/dockertf1

# start the container to test the image 
sudo docker run -dp 80:80 samoryejack/dockertf1

# referances
# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/create-container-image.html
# https://docs.docker.com/get-started/02_our_app/
# https://docs.docker.com/engine/reference/commandline/login/#provide-a-password-using-stdin