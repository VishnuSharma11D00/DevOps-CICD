# Base image
FROM jenkins/jenkins:2.464-slim-jdk17

# Switch to root user to install additional packages
USER root

# Install Docker CLI
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
# Add Docker's official GPG key
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

# Set up the Docker stable repository
RUN echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# Install Docker CLI
RUN apt-get update && apt-get install -y docker-ce-cli

# Install Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/download/v2.28.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

COPY Github-oauth_using_JCasC/Jenkins-Dockerfile/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN mkdir -p /var/jenkins_home/casc_configs/ && \
        jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
        
# Switch back to the jenkins user
USER jenkins
