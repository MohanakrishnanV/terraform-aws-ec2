module "vpc" {
  source = "./module/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  public_subnet = module.vpc.public_subnet_ids
}