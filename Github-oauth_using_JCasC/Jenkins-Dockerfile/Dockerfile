FROM jenkins/jenkins:lts

COPY Github-oauth_using_JCasC/Jenkins-Dockerfile/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN mkdir -p /var/jenkins_home/casc_configs/ && \
        jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
