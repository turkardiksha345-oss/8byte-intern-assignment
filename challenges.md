# Challenges Faced and Resolutions

## 1. Local Dependency Setup Issues
**Challenge:**  
While setting up the Node.js application locally, dependency installation initially failed due to the absence of the `package.json` file in the working directory.

**Resolution:**  
Verified the project directory structure and ensured that `package.json` was correctly created and placed in the root directory.
After correcting the structure, dependencies were successfully installed using `npm install`.


## 2. Docker Build and Container Execution
**Challenge:**  
During Docker image creation, understanding how application ports inside the container map to host ports was critical to ensure accessibility.

**Resolution:**  
Used explicit port mapping (`-p 3000:3000`) while running the container and verified the application using the browser. 
This ensured the application was accessible both locally and inside the container environment.


## 3. Docker Installation on EC2
**Challenge:**  
Manually installing Docker on EC2 can lead to inconsistent environments and configuration drift.

**Resolution:**  
Docker was installed automatically using Terraform `user_data`, ensuring that the EC2 instance was fully configured at launch time without manual intervention. 
This improved automation and reliability.


## 4. Terraform Networking Configuration
**Challenge:**  
Configuring networking components such as VPC, subnet, Internet Gateway, and route tables required careful ordering to ensure proper internet access for the EC2 instance.

**Resolution:**  
Defined Terraform resources with clear dependencies and verified routing rules to ensure the EC2 instance could access the internet and be publicly reachable.


## 5. Security Group Configuration
**Challenge:**  
Ensuring the application was accessible publicly while maintaining minimal exposure was an important consideration.

**Resolution:**  
Restricted Security Group rules to only required ports—SSH (22) and application port (3000)—following the principle of least privilege.



## 6. CI/CD Pipeline Validation
**Challenge:**  
Ensuring that the CI pipeline correctly validated Docker builds without deploying artifacts required careful workflow configuration.

**Resolution:**  
Configured GitHub Actions to trigger on pushes to the `main` branch and focused the workflow on Docker image build validation, ensuring early detection of build issues.



## 7. End-to-End Verification
**Challenge:**  
Validating that all components—from application code to cloud infrastructure—worked together seamlessly required thorough testing.

**Resolution:**  
Performed step-by-step validation at each stage:
- Local application run
- Docker container execution
- EC2 deployment
- Public access verification using EC2 Public IP
- CI pipeline success confirmation


## Conclusion
Each challenge encountered during this assignment provided valuable insights into real-world DevOps workflows. 
By addressing issues through automation, structured configuration, and systematic testing, the final solution achieved a reliable and reproducible deployment.
