resource "aws_security_group" "ui-sg" {
  name          = "${var.service_name}-${var.aws_region_alias}-${var.environment}-ui-sg"
  vpc_id        = var.vpc_id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle { create_before_destroy = true }

  tags = {
    Name        = "${var.service_name}-${var.aws_region_alias}-${var.environment}-ui-sg"
    Environment = var.environment
  }
}

resource "aws_launch_configuration" "ui-lc" {
  name            = "${var.service_name}-${var.aws_region_alias}-${var.environment}-ui-lc"
  image_id        = var.ui_image_id
  instance_type   = var.ui_instance_type
  security_groups = [aws_security_group.ui-sg.id]

  lifecycle { create_before_destroy = true }
}

resource "aws_autoscaling_group" "ui-asg" {
  name                  = "${var.service_name}-${var.aws_region_alias}-${var.environment}-ui-asg"
  launch_configuration  = aws_launch_configuration.ui-lc.id
  vpc_zone_identifier   = [aws_subnet.ui-sn[0].id, aws_subnet.ui-sn[1].id]

  target_group_arns     = var.ui_target_group_arns
  health_check_type     = "ELB"

  min_size              = var.min_size
  max_size              = var.max_size

  tag {
    key                 = "Name"
    value               = "${var.service_name}-${var.aws_region_alias}-${var.environment}-ui-asg"
    propagate_at_launch = true
  }
}