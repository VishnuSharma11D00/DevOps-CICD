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
docker run -d -p 8080:8080 -p 50000:50000 --name jenkins-container vishnusharma11d00/jenkins-jcasc-plugin:13 || { echo "Jenkins installation failed"; exit 1; }

# Running Docker Container for SonarQube
docker run -d --name sonar -p 9000:9000 sonarqube:lts-community || { echo "SonarQube installation failed"; exit 1; }

# Installing AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip -y
unzip awscliv2.zip
sudo ./aws/install || { echo "AWS CLI installation failed"; exit 1; }

# Installing Kubectl
sudo curl -LO "https://dl.k8s.io/release/v1.28.4/bin/linux/amd64/kubectl"
sudo chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version --client || { echo "kubectl installation failed"; exit 1; }

# Installing eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version || { echo "eksctl installation failed"; exit 1; }

# Installing Terraform
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install terraform -y || { echo "Terraform installation failed"; exit 1; }

# Installing Trivy
sudo apt-get install wget apt-transport-https gnupg lsb-release -y
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo tee /usr/share/keyrings/trivy-archive-keyring.gpg
echo deb [signed-by=/usr/share/keyrings/trivy-archive-keyring.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/trivy.list
sudo apt update
sudo apt install trivy -y || { echo "Trivy installation failed"; exit 1; }

# Installing Helm
sudo snap install helm --classic || { echo "Helm installation failed"; exit 1; }

echo "All installations completed successfully!"
