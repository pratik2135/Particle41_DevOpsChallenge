# Particle41_DevOpsChallenge
This repository solves the tasks associated with the problem statement for the DevOps Challenge.

#  Minimalist Application Deployment & Terraform Infrastructure Automation

This project demonstrates how to deploy a simple web application that displays the current UTC time and the IP address of the visitor.

It includes:
- **Task 1:** Local deployment using Docker
- **Task 2:** Cloud deployment using Terraform on AWS

---

## 🧾 Project Overview

The goal is to:
- Build and run a containerized application locally using Docker.
- Provision cloud infrastructure and host the application on AWS using Terraform.

---

#  Task 1: Local Docker-Based Deployment

###  Prerequisites

- **Git** – Required to clone the repository  
  🔗 [Download Git](https://git-scm.com/downloads)

- **Docker** – Required to build and run the container  
  🔗 [Install Docker](https://www.docker.com/products/docker-desktop)

> Note: Ensure Docker daemon is running before executing Docker commands.

---

###  Deployment Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/pratik2135/Particle41_DevOpsChallenge
   cd app
   ```
2. **Docker Build**
   ```bash
   docker build -t yourdockerhubusername/imagename .
  > Note: -t adds tag to your docker image
3. **Docker Run**
   ```bash
   docker run -p 8080:8080 yourdockerhubusername/imagename
 > Note: -p publishes the host port with container port

---

#  Task 2: Terraform and Cloud: create the infrastructure to host your container

###  Prerequisites

- **AWS CLI** – Required to configure AWS credentials and interact with AWS services  
  🔗 [AWS-CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

- **Docker** – Required to build and run the container  
  🔗 [Download Terraform](https://developer.hashicorp.com/terraform/install)

##  AWS CLI Configuration

Before using Terraform, configure your AWS credentials:

```bash
aws configure
```
Provide the following when prompted:  
1. AWS Access Key ID  
2. AWS Secret Access Key  
3. Default region name (e.g., us-east-1)  
4. Default output format (e.g., json)

Verify Configuration before deployment:    
```bash
1. aws --version                 # Check AWS CLI installation
```
```bash
2. terraform version             # Check Terraform installation
```
```bash
3. aws sts get-caller-identity   # Verify AWS authentication
```

##  Deployment Instructions
1. **Clone the repo(if not already)**
   ```bash
   git clone https://github.com/pratik2135/Particle41_DevOpsChallenge
   cd Terraform
   ```
2. **Initialize Terraform**
   ```bash
   terraform init
   ```
3. **Preview the Deployment**
   ```bash
    terraform plan
   ```
4. **Apply the Deployment**
   ```bash
   terraform apply
   ```
   ---
Check the ouput for DNS URL and verify the application on your WEB.

After successfull verification don't forget to clean up your resources so you don't incur any cost by using below command.
```bash
terrform destroy
```




