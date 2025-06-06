resource "aws_launch_template" "webserver" {
  name_prefix   = var.webserver_launch_template_name
  image_id      = data.aws_ami.ubuntu.image_id
  instance_type = var.webserver_ec2_instance_type
  user_data     = base64encode(file("${path.module}/user-data.sh"))
  vpc_security_group_ids = [aws_security_group.webserver_lb_sg.id]
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "webserver_asg" {
  desired_capacity    = var.webserver_asg_desired_capacity
  max_size            = var.webserver_asg_max_size
  min_size            = var.webserver_asg_min_size
  vpc_zone_identifier = var.public_subnet_ids
  launch_template {
    id = aws_launch_template.webserver.id
  }
  target_group_arns         = [aws_lb_target_group.webserver_tg.arn]
  health_check_type         = "EC2"
  health_check_grace_period = 300
  depends_on = [ aws_lb_listener.webserver_listener ]
}

resource "aws_lb" "webserver_lb" {
  load_balancer_type = "application"
  internal           = false
  subnets            = var.public_subnet_ids
  security_groups    = [aws_security_group.webserver_lb_sg.id]

}

resource "aws_lb_target_group" "webserver_tg" {
  name        = var.webserver_tg_name
  port        = var.app_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    path = "/"
  }
}

resource "aws_lb_listener" "webserver_listener" {
  load_balancer_arn = aws_lb.webserver_lb.arn
  port              = var.app_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webserver_tg.arn
  }
}

resource "aws_security_group" "webserver_lb_sg" {
  name        = var.websever_lb_sg_name
  description = "Allow HTTP access"
  vpc_id      = var.vpc_id

}

resource "aws_vpc_security_group_ingress_rule" "webserver_port" {
  security_group_id = aws_security_group.webserver_lb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = var.app_port
  to_port           = var.app_port
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "webserver_out" {
  security_group_id = aws_security_group.webserver_lb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}