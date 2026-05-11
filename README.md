Multi-Cloud Computing Project: 

AWS & Azure Integration
This project demonstrates a functional multi-cloud architecture by deploying a web application on Azure Container Instances that securely communicates with storage and database services hosted on AWS (S3 and DynamoDB).

Architecture Overview
The infrastructure was provisioned using Terraform (Infrastructure as Code) to ensure consistency, scalability, and to prevent cloud vendor lock-in.

Component Selection:
Web Application: Hosted on Azure Container Instances (ACI), providing a lightweight, serverless container environment.

Object Storage: AWS S3, chosen for its full S3 API compatibility and robust global replication features.

NoSQL Database: AWS DynamoDB, utilized for high-performance metadata storage.

SQL Database: Azure SQL Database, leveraging Microsoft's native compatibility for .NET applications.

Technical Justification: AWS DynamoDB
We selected AWS DynamoDB for this multi-cloud architecture because it provides a fully managed, serverless NoSQL database with consistent single-digit millisecond latency at any scale. Its "on-demand" capacity mode offers superior cost-efficiency for this project compared to other solutions, as it eliminates the need to pay for idle resources. Furthermore, DynamoDB’s global availability and seamless API integration allow our Azure-hosted application to access data performantly across cloud providers without managing complex server clusters or persistent connections. This choice aligns with the project's requirements for a highly scalable, cost-effective, and decoupled data strategy.

Getting Started
Prerequisites
Terraform installed.

Access to AWS CloudShell and Azure Cloud Shell.

Project repository cloned in both environments.

Deployment Steps
AWS Infrastructure:

Navigate to starter/aws/.

Run terraform init.

Run terraform apply.

Azure Infrastructure:

Navigate to starter/azure/.

Run terraform init.

Run terraform apply.

Note: Ensure the environment variables in main.tf match your specific resource names.

Verification:

Access the application via the FQDN provided by the Azure output on port 3000.

Cleanup and Governance
To adhere to cloud cost-control best practices, all resources must be destroyed immediately after validation.

Azure Cleanup:


cd starter/azure
terraform destroy -auto-approve
AWS Cleanup:


cd starter/aws
terraform destroy -auto-approve

License
This project is licensed under the MIT License.
