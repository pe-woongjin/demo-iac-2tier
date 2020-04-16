resource "aws_launch_configuration" "app-lc" {
  name            = "${var.resrc_prefix_nm}-app-lc"
  image_id        = var.app_lc.id
  instance_type   = var.app_lc.type
  key_name        = var.app_lc.key_name
  security_groups = [ aws_security_group.app-sg.id ]

  user_data = <<USER_DATA
#!/bin/bash
java -jar /home/ubuntu/backend-demo-1.0.0-SNAPSHOT.jar &
  USER_DATA

  lifecycle { create_before_destroy = true }
}

resource "aws_autoscaling_group" "app-asg" {
  name                  = "${var.resrc_prefix_nm}-app-asg"
  launch_configuration  = aws_launch_configuration.app-lc.id
  vpc_zone_identifier   = [ aws_subnet.app-sn[0].id, aws_subnet.app-sn[1].id ]

  target_group_arns     = [ aws_alb_target_group.app-tg6060-a.arn ]
  health_check_type     = "ELB"

  min_size              = var.app_lc.min_size
  max_size              = var.app_lc.max_size

  tag {
    key                 = "Name"
    value               = "${var.resrc_prefix_nm}-app-asg"
    propagate_at_launch = true
  }
}