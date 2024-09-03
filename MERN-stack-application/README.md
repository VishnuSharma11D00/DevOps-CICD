# MERN Stack application (CI) - Jenkins using JCasC

## Overview

This document outlines the recent upgrades made to the Continuous Integration (CI) part of our Advanced End-to-End DevSecOps Kubernetes Three-Tier Project. These upgrades involve enhancing the Jenkins configuration and automation using the Jenkins Configuration as Code (JCasC) approach.

This project is inspired by the blog post by Aman Pathak, [Advanced End-to-End DevSecOps Kubernetes Three-Tier Project Using AWS EKS, ArgoCD, Prometheus](https://blog.stackademic.com/advanced-end-to-end-devsecops-kubernetes-three-tier-project-using-aws-eks-argocd-prometheus-fbbfdb956d1a), which provides a comprehensive overview of a DevSecOps implementation.

## CI Pipeline Upgrades

### Previous Setup

Previously, our CI pipelines in Jenkins were manually configured and involved multiple stages, including:

- Running Terraform to create EKS infrastructure on AWS.
- Performing SonarQube and Trivy scans for application code.
- Building and publishing frontend and backend application images to Amazon ECR.
- Managing application code in GitHub repositories.

### New Setup

With the recent upgrades, we've streamlined our Jenkins setup using JCasC. Here’s a summary of the new CI configuration:

1. **Custom Jenkins Image**:
   - A custom Jenkins image has been created with all necessary plugins pre-installed. This was achieved by:
     - Building the Jenkins image using GitHub Actions.
     - Utilizing a plugin.txt file in the Dockerfile to install required Jenkins plugins.

2. **Jenkins Configuration as Code (JCasC)**:
   - Jenkins Configuration as Code (JCasC) is used to automate the configuration of Jenkins. This includes:
     - Setting up credentials.
     - Configuring tools and plugins.
     - Defining global settings and job configurations.

3. **Jenkins Configuration File**:
   - The JCasC configuration is defined in a YAML file which is integrated into the Jenkins image. This YAML file specifies:
     - Jenkins credentials (AWS, GitHub, sonar).
     - Tool configurations (Terraform, nodejs, docker, sonar).
     - Global Jenkins settings and job definitions.

## Benefits of the Upgrade

- **Consistency**: Automated Jenkins setup ensures that every Jenkins instance is configured identically.
- **Efficiency**: Reduces manual configuration time and effort.
- **Scalability**: Easier to replicate Jenkins environments across different stages or environments.
- **Maintainability**: Simplifies updating and managing Jenkins configurations through version-controlled YAML files.

## Next Steps

- Review and test the updated Jenkins image and JCasC configuration.
- Integrate the updated setup into your CI/CD workflows.
- Monitor and adjust configurations as needed based on feedback and requirements.

# Credential Best Practices

While the current JCasC setup may involve hardcoding credentials, this approach is not recommended for sensitive information. A better practice is to define non-sensitive details in the code and use placeholders for sensitive credentials. 
- I have filled random credentials in jenkins.yaml and After creating the Jenkins instance, I manually updated these credentials through the Jenkins UI. This way, all the credential configuratons are already created and you just have to edit them with appropriate credentials and passwords.
-  Alternatively, consider using secure methods like Docker secrets, AWS Secrets Manager, or Azure Key Vault to manage sensitive information. For more details, refer https://github.com/jenkinsci/configuration-as-code-plugin/tree/master/demos/credentials
https://github.com/jenkinsci/configuration-as-code-plugin/blob/master/docs/features/secrets.adoc#secret-sources

## Instructions
- create Jenkins image and update user data
- deploy terraform
- copy jenkins.yaml
- apply configurations
