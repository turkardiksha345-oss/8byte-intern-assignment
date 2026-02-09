# 8byte DevOps Intern Assignment

## Project Overview
This project is part of the **8byte DevOps Intern Technical Assignment**.  
The objective is to deploy a simple Node.js application on AWS using modern DevOps practices such as containerization, Infrastructure as Code, and CI/CD automation.

The application is built using Node.js (Express).
Containerized using Docker.
Deployed on an AWS EC2 instance provisioned via Terraform.
Integrated with a GitHub Actions CI pipeline.

## Tech Stack used to create resources 

- Cloud Provider: AWS
- Infrastructure as Code: Terraform
- Containerization: Docker
- CI/CD: GitHub Actions
- Backend: Node.js (Express)
- Operating System: Ubuntu 22.04

## Application Details
The application exposes a single HTTP endpoint:

- Port: `3000`
- Response:
 `8byte Intern Assignment Successfully Deployed`


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
# Steps to Build and Run Docker Image
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
