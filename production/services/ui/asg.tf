resource "aws_launch_configuration" "ui-lc" {
  name            = "${var.resrc_prefix_nm}-ui-lc"
  image_id        = var.ui_lc.id
  instance_type   = var.ui_lc.type
  security_groups = [ aws_security_group.ui-sg.id ]

  lifecycle { create_before_destroy = true }
}

resource "aws_autoscaling_group" "ui-asg" {
  name                  = "${var.resrc_prefix_nm}-ui-asg"
  launch_configuration  = aws_launch_configuration.ui-lc.id
  vpc_zone_identifier   = [ aws_subnet.ui-sn[0].id, aws_subnet.ui-sn[1].id ]

  target_group_arns     = [ aws_alb_target_group.ui-tg8080.arn ]
  health_check_type     = "ELB"

  min_size              = var.ui_lc.min_size
  max_size              = var.ui_lc.max_size

  tag {
    key                 = "Name"
    value               = "${var.resrc_prefix_nm}-ui-asg"
    propagate_at_launch = true
  }
}