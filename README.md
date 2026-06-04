# AWS Scalable Web Application using Terraform

## Project Description

This project is a simple web application hosted on AWS using Terraform to set up all the cloud resources automatically.

The main idea of this project is to deploy a website in the cloud in a way that it can handle more users if traffic increases, without any manual changes. Instead of creating resources like servers and networks manually in AWS, everything is created using Terraform code.

In this setup, AWS provides the cloud environment, and Terraform is used to build and manage that environment in an automated way. This makes the whole infrastructure easy to create, update, and delete whenever needed.

The application runs on an EC2 instance, which acts like a virtual server in the cloud. Basic networking is handled using VPC, subnets, and security groups to make sure the application is both accessible and secure.

Overall, this project shows how a normal web application can be deployed in a cloud environment in an automated and scalable way using DevOps tools like Terraform and AWS services.
## Architecture Components

* Custom VPC
* Internet Gateway
* Public and Private Subnets across multiple Availability Zones
* NAT Gateways for private subnet internet access
* Route Tables and Route Table Associations
* Bastion Host for secure administration
* Security Groups
* Application Load Balancer (ALB)
* Launch Template
* Auto Scaling Group (ASG)
* EC2 Instances deployed in private subnets

## Features

* High Availability across multiple Availability Zones
* Automatic Scaling based on workload
* Secure architecture using private subnets
* Centralized traffic management using ALB
* Infrastructure provisioning using Terraform modules
* Bastion Host for secure SSH access

## Project Structure

```text
Scalable-Web-Application/
│
├── modules/
│   ├── networking/
│   ├── security/
│   ├── bastion/
│   ├── alb/
│   └── autoscaling/
│
├── main.tf
├── variables.tf
├── terraform.tfvars
├── provider.tf
├── userdata.sh
└── outputs.tf
```

## Deployment Steps

1. Clone the repository.
2. Configure AWS credentials.
3. Initialize Terraform.

```bash
terraform init
```

4. Validate the configuration.

```bash
terraform validate
```

5. Review the execution plan.

```bash
terraform plan
```

6. Deploy the infrastructure.

```bash
terraform apply
```

## Technologies Used

* AWS
* Terraform
* EC2
* VPC
* Application Load Balancer
* Auto Scaling Group
* Git & GitHub

## Outcome

Successfully deployed a scalable and highly available web application architecture on AWS using Terraform with modular infrastructure design.
