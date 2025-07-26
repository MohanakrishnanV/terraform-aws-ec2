module "vpc" {
  source               = "./module/vpc"
  vpc_cidr_block       = var.vpc_cidr_block
  public_subnet_count  = var.public_subnet_count
  private_subnet_count = var.private_subnet_count
}

module "webserver" {
  source                         = "./module/ec2"
  webserver_launch_template_name = var.webserver_launch_template_name
  webserver_ec2_instance_type    = var.webserver_ec2_instance_type
  webserver_asg_desired_capacity = var.webserver_asg_desired_capacity
  webserver_asg_max_size         = var.webserver_asg_max_size
  webserver_asg_min_size         = var.webserver_asg_min_size
  public_subnet_ids              = module.vpc.public_subnet_ids
  app_port                       = var.app_port
  vpc_id                         = module.vpc.vpc_id
  webserver_tg_name              = var.webserver_tg_name
  websever_lb_sg_name            = var.websever_lb_sg_name
}