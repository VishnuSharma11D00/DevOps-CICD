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
