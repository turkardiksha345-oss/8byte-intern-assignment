# 8byte DevOps Intern Assignment

## Project Overview
This project is part of the **8byte DevOps Intern Technical Assignment**.  

The objective is to deploy a simple Node.js application on AWS using modern DevOps practices such as containerization, and Infrastructure as Code. 

The application is built using Node.js (Express), Containerized using Docker, 
Deployed on an AWS EC2 instance provisioned via Terraform .

## Tech Stack used to create resources 

- Cloud Provider: AWS
- Infrastructure as Code: Terraform
- Containerization: Docker
- Backend: Node.js (Express)
- Operating System: Ubuntu 22.04

## Application Details
The application exposes a single HTTP endpoint:

- Port: `3000`
- Response:
 `8byte Intern Assignment Successfully Deployed`

## Architecture Diagram
```text
Developer (Local Machine)
        |
        v
Node.js Application
        |
        v
Docker Container
        |
        v
Terraform (Infrastructure as Code)
        |
        v
AWS Cloud
  ├── VPC
  │    └── Public Subnet
  │         └── EC2 Instance (Ubuntu 22.04, t3.micro)
  │              └── Docker Runtime
  │                   └── Node.js Application (Port 3000)
  |
  └── Internet Gateway
        |
        v
Public Internet
        |
        v
User Browser
  http://<EC2-PUBLIC-IP>:3000
```

## Steps to Run the Application Locally
```bash
# Clone the Repository
git clone <repository-url>

# Move to project directory
cd 8byte-intern-assignment

# Install Node.js dependencies
npm install

# Run the application locally
node app.js

# Acces the application through 
 http://localhost:3000
```
## Steps to Build and Run Docker Image
```bash
# build docker image 
docker build -t 8byte-intern-app .

# Run Docker Container
docker run -p 3000:3000 8byte-intern-app

# Verification
http://localhost:3000
```

# Steps to Provision Infrastructure Using Terraform
 ```text
# Terraform Directory Structure
terraform/
│── provider.tf
│── main.tf
│── variables.tf
│── outputs.tf
│── terraform.tfvars

```
# Terrafrom Commands
```bash
terraform init
terraform validate
terraform plan
terraform apply
```

## Steps to Deploy Application on EC2
```bash
# SSH into EC2 Instance
ssh -i <key-pair.pem> ubuntu@<EC2-PUBLIC-IP>

# Verify Docker Installation
docker --version

# Clone Repository on EC2
git clone <repository-url>
cd 8byte-intern-assignment

# Build and Run Docker Container
docker build -t 8byte-intern-app .
docker run -d -p 3000:3000 8byte-intern-app

# Access the Application
http://<EC2-PUBLIC-IP>:3000

```
