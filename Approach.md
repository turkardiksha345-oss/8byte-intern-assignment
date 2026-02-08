# Approach – DevOps Intern Assignment

## Overview
The goal of this assignment was to deploy a backend application using modern DevOps practices, focusing on automation, consistency, and reproducibility.
The overall approach was to validate the application locally, containerize it, provision cloud infrastructure using Infrastructure as Code, and automate the build process using CI/CD.

---

## Application Design
A simple Node.js application was chosen to keep the focus on DevOps concepts rather than application complexity.
The application exposes a single HTTP endpoint and runs on port 3000, which makes validation straightforward at each stage of deployment.

---

## Containerization Strategy
Docker was used to containerize the application to ensure a consistent runtime environment across local development and cloud deployment.

**Approach:**
- Used an official Node.js base image to ensure stability and security
- Installed dependencies inside the container to avoid host dependency issues
- Exposed port 3000 to match application requirements
- Used a simple and readable Dockerfile to improve maintainability

This approach ensures that the application behaves identically in local, testing, and production environments.

---

## Infrastructure as Code (Terraform) 
Terraform was used to provision AWS infrastructure to ensure repeatable and automated resource creation.

**Infrastructure decisions:**
- Created a custom VPC with a public subnet to allow internet access
- Attached an Internet Gateway and route table for outbound connectivity
- Configured a Security Group to allow:
  - SSH access on port 22
  - Application access on port 3000
- Deployed an EC2 instance using Ubuntu 22.04 and t3.micro instance type
- Installed Docker automatically using Terraform `user_data` to avoid manual configuration

Using Terraform ensures consistency, Easy to remove, and version-controlled infrastructure.

---

## Application Deployment on EC2
Once infrastructure provisioning was complete, the application was deployed using Docker on the EC2 instance.

**Deployment steps:**
- SSH into the EC2 instance
- Verify Docker installation
- Clone the GitHub repository
- Build the Docker image on the EC2 instance
- Run the container with appropriate port mapping

This method closely resembles real-world production deployment workflows.

---

## CI/CD Automation with GitHub Actions
GitHub Actions was used to automate the Docker build process.

**CI/CD workflow design:**
- Triggered on every push to the `main` branch
- Automatically checks out the source code
- Builds the Docker image to validate container configuration
- Ensures early detection of build issues

This pipeline improves reliability and reduces manual effort during development.

---

## Security Considerations
- Security Group rules were limited to only required ports (22 and 3000)
- Docker installation was automated using `user_data` to reduce configuration drift
- Application access is restricted to the defined exposed port

---

## Conclusion
This approach demonstrates an end-to-end DevOps workflow that includes application validation, containerization, infrastructure automation, 
CI/CD integration, and deployment on cloud infrastructure. The solution emphasizes simplicity, automation, and clarity, aligning with real-world DevOps best practices.
