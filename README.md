# EKS Cluster Deployment Using Jenkins Pipeline

## Overview
This guide outlines the process for deploying an EKS (Elastic Kubernetes Service) cluster using Jenkins Pipelines. It includes two main Jenkins pipeline jobs: one for deploying S3 and DynamoDB resources and another for deploying the EKS cluster. These resources are managed using Terraform.

## Prerequisites
Before setting up the Jenkins pipelines, ensure you have the following prerequisites:
- **Jenkins** installed and running.
- **AWS Account** with necessary permissions to create EKS, S3, and DynamoDB resources.
- **Terraform** installed on the Jenkins server.
- **AWS CLI** installed and configured on the Jenkins server.
- **Jenkins credentials** for AWS access and secret keys stored in Jenkins credentials store.

## Jenkins Pipeline Jobs

### 1. Deploying S3 and DynamoDB

#### Parameters
- `aws_region`: AWS region where the resources will be created (default: `us-east-1`).
- `project`: Name of the Terraform project (default: `test`).
- `s3_bucket`: Name of the S3 bucket (default: `terraform-eks-s3-bucket`).
- `dynamodb_table`: Name of the DynamoDB table (default: `eks-dynamodb-lock-table`).
- `aws_key_pair`: AWS Key pair (default: `eks-terraform-key`).
- `action`: Action to perform with Terraform (`plan`, `apply`, `destroy`).

#### Stages
1. **Terraform Setup/init**:
   - Initialize Terraform configuration with backend settings for S3 and DynamoDB.
   
2. **Terraform dry-run**:
   - Run `terraform plan` to create an execution plan without making any changes.

3. **Deploying Infra**:
   - Execute the specified action (`plan`, `apply`, or `destroy`) to manage the infrastructure.

### 2. Deploying EKS Cluster

#### Parameters
- `aws_region`: AWS region where the resources will be created (default: `us-east-1`).
- `project`: Name of the Terraform project (default: `test`).
- `s3_bucket`: Name of the S3 bucket (default: `terraform-eks-s3-bucket`).
- `dynamodb_table`: Name of the DynamoDB table (default: `eks-dynamodb-lock-table`).
- `aws_key_pair`: AWS Key pair (default: `eks-terraform-key`).
- `action`: Action to perform with Terraform (`plan`, `apply`, `destroy`).

#### Stages
1. **Terraform Setup/init**:
   - Initialize Terraform configuration with backend settings for S3 and DynamoDB.
   
2. **Terraform dry-run**:
   - Run `terraform plan` to create an execution plan without making any changes.

3. **Deploying Infra**:
   - Execute the specified action (`plan`, `apply`, or `destroy`) to manage the EKS cluster.

## Running the Pipelines
1. **Configure Jenkins Credentials**:
   - Add AWS access and secret keys to Jenkins credentials store. Use IDs `aws_access_key` and `aws_secret_key`.

2. **Create Jenkins Jobs**:
   - Create two Jenkins jobs using the provided pipeline scripts: one for S3 and DynamoDB and another for the EKS cluster.

3. **Execute the Pipelines**:
   - Run the S3 and DynamoDB pipeline job to set up the backend infrastructure.
   - After the successful completion, run the EKS cluster pipeline job to deploy the EKS cluster.

## Notes
- Ensure the S3 and DynamoDB resources are created successfully before running the EKS cluster deployment.
- Always review the Terraform plan output before applying changes to understand the modifications being made.
- Use the `destroy` action with caution as it will remove all created resources.

This setup ensures a structured and automated approach to managing infrastructure deployments using Terraform and Jenkins, providing a robust CI/CD pipeline for AWS resources.
