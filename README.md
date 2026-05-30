# AWS Scalable Web Application using Terraform

## Project Overview

This project demonstrates the deployment of a scalable and highly available web application on AWS using Terraform Infrastructure as Code (IaC).

The infrastructure is designed following AWS best practices and includes networking, security, load balancing, and auto scaling components.

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
