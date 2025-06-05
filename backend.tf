terraform {
  backend "s3" {
    bucket         = "mohan-terraform-tfstate-file"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    use_lockfile   = true

  }
}