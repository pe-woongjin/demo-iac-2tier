resource "aws_launch_template" "api-lt" {
  name                    = "${var.resrc_prefix_nm}-api-lt"
  image_id                = var.api_lt.id
  key_name                = var.api_lt.key_name
  instance_type           = var.api_lt.type
  vpc_security_group_ids  = [ aws_security_group.api-sg.id ]

  user_data = base64encode(templatefile("./services/api/api-userdata.tpl", {}))

  tag_specifications {
    resource_type = "instance"
    tags = {
      "Name" = "${var.resrc_prefix_nm}-api-lt"
    }
  }
}

resource "aws_autoscaling_group" "api-asg" {
  name                  = "${var.resrc_prefix_nm}-api-asg"
  vpc_zone_identifier   = [ aws_subnet.api-sn[0].id, aws_subnet.api-sn[1].id ]

  launch_template {
    id      = aws_launch_template.api-lt.id
    version = "$Latest"
  }

  target_group_arns     = [ aws_alb_target_group.api-tg8080-a.arn ]
  health_check_type     = "ELB"

  min_size              = var.api_lt.min_size
  max_size              = var.api_lt.max_size

  tag {
    key                 = "Name"
    value               = "${var.resrc_prefix_nm}-api-asg"
    propagate_at_launch = true
  }
}