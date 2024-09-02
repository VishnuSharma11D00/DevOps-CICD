#!/bin/bash
# For Ubuntu 22.04

# Updating package lists
sudo apt update -y

# Installing Java
sudo apt install openjdk-17-jre openjdk-17-jdk -y
java --version || { echo "Java installation failed"; exit 1; }

# Installing Docker 
sudo apt install docker.io -y
sudo usermod -aG docker $USER
sudo systemctl enable --now docker
sudo chmod 666 /var/run/docker.sock  # Giving Docker permissions

# Installing Jenkins (using Docker)
docker run -d -p 8080:8080 -p 50000:50000 --name jenkins-container vishnusharma11d00/jenkins-jcasc-plugin:14 || { echo "Jenkins installation failed"; exit 1; }

