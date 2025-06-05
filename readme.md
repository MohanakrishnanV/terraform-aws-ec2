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
3. Install and Configure AWS CLI with a profile `aws configure --profile terraform-user`
4. Manually create the **S3 bucket** and update these details in `backend.tf` file 
5. create a file `terraform.tfvars` in the Project root directory
#### Update Variables on terraform.tfvars
```shell
region                  = "YOUR_REGION"
iam_profile             = "terraform-user"
cidr_block              = ""
public_subnet_count     = ""
private_subnet_count    = ""
```

### Initiate Terraform
```shell
export AWS_PROFILE=terraform-user
terraform init
terraform plan
terraform apply
```
