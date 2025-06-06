output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "webserver_dns" {
  value = aws_lb.webserver_lb.dns_name
}
