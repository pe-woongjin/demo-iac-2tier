resource "aws_launch_configuration" "api-lc" {
  name            = "${var.resrc_prefix_nm}-api-lc"
  image_id        = var.api_lc.id
  instance_type   = var.api_lc.type
  key_name        = var.api_lc.key_name
  security_groups = [ aws_security_group.api-sg.id ]

  user_data = <<USER_DATA
#!/bin/bash
java -jar /home/ubuntu/backend-demo-1.0.0-SNAPSHOT.jar &
  USER_DATA

  lifecycle { create_before_destroy = true }
}

resource "aws_autoscaling_group" "api-asg" {
  name                  = "${var.resrc_prefix_nm}-api-asg"
  launch_configuration  = aws_launch_configuration.api-lc.id
  vpc_zone_identifier   = [ aws_subnet.api-sn[0].id, aws_subnet.api-sn[1].id ]

  target_group_arns     = [ aws_alb_target_group.api-tg8080-a.arn ]
  health_check_type     = "ELB"

  min_size              = var.api_lc.min_size
  max_size              = var.api_lc.max_size

  tag {
    key                 = "Name"
    value               = "${var.resrc_prefix_nm}-api-asg"
    propagate_at_launch = true
  }
}