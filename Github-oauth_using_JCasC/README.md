# Created Github-oauth for Jenkins using JCasC

1. Firstly created and publish a jenkins Image that includes:
   - required plugins from plugins.txt and
   - _casc_configs_ empty directory to store jcasc yaml files.
   - 
2. Create Github Oauth app:
   - Homepage URL : http://<ec2-pub-ip>:8080
   - Authorization callback url: http://<ec2-pub-ip>:8080/securityRealm/finishLogin
   - Get **Client ID** and **Client Secret ID**
   - update the values in jenkins JasC jenkins.yaml file in the repo.
     
3. Next, a script for EC2 userdata to automize:
   - openjdk for jenkins
   - install docker
   - run junkins-container
   - Clone github repo of JCasC jenkins.yaml file. Copy jenkins.yaml file into jenkins-container inside _casc_configs_ directory using **docker cp** command.
   - run junkins container
   - run sonarqube container
   - install kubectl
   - install eksctl
   - install terraform
   - install trivy
   - install Helm

4. Terraform apply
   
5. open jenkins form http://<ec2-pub-ip>:8080 
    - **Manage Jenkins** > **Jenkins Configuration as Code** > give path of your JCasC yam file **/var/jenkins_home/casc_configs/jenkins.yaml**
    - apply configurations


  ![Screenshot](Screenshot-2024-08-17-190420.png)
      
      
