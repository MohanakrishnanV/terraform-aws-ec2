terraform {
  backend "s3" {
    bucket         = var.tfstate_s3_bucket
    key            = var.tfstate_file
    region         = var.region
    dynamodb_table = var.dynamodb_table
    encrypt        = true
  }
}