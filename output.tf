output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "webserver_lb_dns" {
  value = "http://${module.webserver.webserver_lb_dns}"
}