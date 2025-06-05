# Terraform AWS Cloud Project: VPC + EC2 + ALB + ASG
This project provisions a complete AWS infrastructure using Terraform, including:
- Remote state storage using S3 and DynamoDB
- A custom VPC with public and private subnets
- An EC2 Auto Scaling Group behind an Application Load Balancer

# Terraform AWS Setup Prerequisites
Before using Terraform to provision AWS infrastructure, you must set up an IAM user with the appropriate permissions and retrieve access credentials. Below are the required steps:

## 🚀 Prerequisites
1. Create and IAM user for Terraform (e.g., `terraform-user`) and attach the `AdministratorAccess` policy for managing the AWS resources your Terraform configuration requires (e.g., EC2, VPC, S3, etc.)
2. Create **Access Key ID** and **Secret Access Key** and save them in secured place
3. Manually create the **S3 bucket** and **DynamoDB table** (terraform-locks) with `LockID` as the primary key for Remote State Setup
4. create a file  `terraform.tfvars` in the Project root directory

## Update Variables on terraform.tfvars
```shell
region              = "YOUR_REGION"
access_key          = "YOUR_ACCESS_KEY"
secret_key          = "YOUR_SECRET_KEY"
tfstate_s3_bucket   = "your-tfstate_s3_bucket-name"
dynamodb_table      = "your-dynamodb_table-name"
tfstate_file        = "path/to/terraform.tfstate"
```