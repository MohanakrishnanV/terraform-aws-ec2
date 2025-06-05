module "vpc" {
  source              = "./module/vpc"
  vpc_cidr_block      = var.vpc_cidr_block
  public_subnet_count = var.public_subnet_count
  private_subnet_count = var.private_subnet_count
}