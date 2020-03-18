# Create an autoscaling group for the NGINX Plus load balancer instances
resource "aws_autoscaling_group" "ngx_plus" {
  name                 = "nginxlab-ngx-plus-autoscaling"
  min_size             = 2
  max_size             = 2
  launch_configuration = aws_launch_configuration.ngx_plus.name
  vpc_zone_identifier = [
    aws_subnet.main.id,
  ]
  tags = [
    {
      key                 = "Name"
      value               = "ngx-plus"
      propagate_at_launch = true
    },
    {
      key                 = "Timestamp"
      value               = timestamp()
      propagate_at_launch = true
    },
  ]
  target_group_arns = [
    aws_lb_target_group.main.arn,
  ]
}

# Create an autoscaling group for the NGINX app 1 instances
resource "aws_autoscaling_group" "ngx_oss_one" {
  name                 = "nginxlab-ngx-oss-one-autoscaling"
  min_size             = 2
  max_size             = 10
  launch_configuration = aws_launch_configuration.ngx_oss_one.name
  vpc_zone_identifier = [
    aws_subnet.main.id,
  ]
  tags = [
    {
      key                 = "Name"
      value               = "ngx-oss-one"
      propagate_at_launch = true
    },
    {
      key                 = "Timestamp"
      value               = timestamp()
      propagate_at_launch = true
    },
  ]
}

# Create an autoscaling group for the NGINX app 2 instances
resource "aws_autoscaling_group" "ngx_oss_two" {
  name                 = "nginxlab-ngx-oss-two-autoscaling"
  min_size             = 2
  max_size             = 10
  launch_configuration = aws_launch_configuration.ngx_oss_two.name
  vpc_zone_identifier = [
    aws_subnet.main.id,
  ]
  tags = [
    {
      key                 = "Name"
      value               = "ngx-oss-two"
      propagate_at_launch = true
    },
    {
      key                 = "Timestamp"
      value               = timestamp()
      propagate_at_launch = true
    },
  ]
}

# Create an autoscaling group for the NGINX app 3 instances
resource "aws_autoscaling_group" "ngx_oss_three" {
  name                 = "nginxlab-ngx-oss-three-autoscaling"
  min_size             = 2
  max_size             = 10
  launch_configuration = aws_launch_configuration.ngx_oss_three.name
  vpc_zone_identifier = [
    aws_subnet.main.id,
  ]
  tags = [
    {
      key                 = "Name"
      value               = "ngx-oss-three"
      propagate_at_launch = true
    },
    {
      key                 = "Timestamp"
      value               = timestamp()
      propagate_at_launch = true
    },
  ]
}
