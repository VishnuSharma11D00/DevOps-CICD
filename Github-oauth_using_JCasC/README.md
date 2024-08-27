## Jenkins Configurations as Code to create Github-oauth for Jenkins login

1. **Create and publish jenkins Image that includes**:
   - required plugins in _plugins.txt_ and
   - empty directory for jenkins _casc_configs_ to store JCasC yaml files.
     
2. **User data script for EC2 userdata**:
   - Install openjdk 
   - install docker
   - run jenkins-container
   - run sonarqube container
   - install kubectl
   - install eksctl
   - install terraform
   - install trivy
   - install Helm

3. **Terraform apply**
   
4. **Create Github Oauth app**:
   - Homepage URL : http://ec2-pub-ip:8080
   - Authorization callback url: http://ec2-pub-ip:8080/securityRealm/finishLogin
   - Get **Client ID** and **Client Secret ID**
   - update the values in jenkins JasC jenkins.yaml file in the repo.     

5. **Copy jenkins.yaml into jenkins-container** :
   - ssh into EC2 instance and run commands:
   ```
   git clone https://github.com/VishnuSharma11D00/DevOps-CICD.git
   ```
   ```
   docker cp DevOps-CICD/Github-oauth_using_JCasC/jenkins.yaml jenkins-container:/var/jenkins_home/casc_configs/jenkins.yaml
   ```
   
6. **Apply JCasC** :
    - open jenkins form http://<ec2-pub-ip>:8080 
    - **Manage Jenkins** > **Jenkins Configuration as Code** > give path of your JCasC yam file **/var/jenkins_home/casc_configs/jenkins.yaml**
    - apply configurations


  ![Screenshot](Screenshot-2024-08-17-190420.png)


### Further Customization:
1. Using GitHub actions
   - to build and publish jenkins image.
   - Update image version in user-data code.
   - Trigger terraform form GitHub actions. 
2. Using github link form JCaC instead of doing docker cp into jenkins container.

      
      
