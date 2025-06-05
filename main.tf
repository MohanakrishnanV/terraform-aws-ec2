module "vpc" {
  source               = "./module/vpc"
  vpc_cidr_block       = var.vpc_cidr_block
  public_subnet_count  = var.public_subnet_count
  private_subnet_count = var.private_subnet_count
}

module "webserver" {
  source                         = "./module/ec2"
  launch_template_name           = var.launch_template_name
  ec2_instance_type              = var.ec2_instance_type
  webserver_asg_desired_capacity = var.webserver_asg_desired_capacity
  webserver_asg_max_size         = var.webserver_asg_max_size
  webserver_asg_min_size         = var.webserver_asg_min_size
}