resource "aws_launch_template" "ui-lt" {
  name                    = "${var.resrc_prefix_nm}-ui-lt"
  image_id                = var.ui_lt.id
  key_name                = var.ui_lt.key_name
  instance_type           = var.ui_lt.type
  vpc_security_group_ids  = [ aws_security_group.ui-sg.id ]

  tag_specifications {
    resource_type = "instance"
    tags = {
      "Name" = "${var.resrc_prefix_nm}-ui-lt"
    }
  }
}

resource "aws_autoscaling_group" "ui-asg" {
  name                  = "${var.resrc_prefix_nm}-ui-asg"
  vpc_zone_identifier   = [ aws_subnet.ui-sn[0].id, aws_subnet.ui-sn[1].id ]

  launch_template {
    id      = aws_launch_template.ui-lt.id
    version = "$Latest"
  }
  
  target_group_arns     = [ aws_alb_target_group.ui-tg80-a.arn ]
  health_check_type     = "ELB"

  min_size              = var.ui_lt.min_size
  max_size              = var.ui_lt.max_size

  tag {
    key                 = "Name"
    value               = "${var.resrc_prefix_nm}-ui-asg"
    propagate_at_launch = true
  }
}