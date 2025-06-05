resource "aws_launch_template" "webserver" {
    name_prefix = var.launch_template_name
    image_id = data.aws_ami.ubuntu.image_id
    instance_type = var.ec2_instance_type
    user_data = file(user-data.sh)

    lifecycle {
      create_before_destroy = true
    }  
}

resource "aws_autoscaling_group" "webserver_asg" {
  desired_capacity = var.webserver_asg_desired_capacity
  max_size = var.webserver_asg_max_size
  min_size = var.webserver_asg_min_size
}