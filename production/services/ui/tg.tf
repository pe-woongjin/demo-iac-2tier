resource "aws_alb_target_group" "ui-tg80-a"  {
  name          = "${var.resrc_prefix_nm}-ui-tg80-a"
  protocol      = "HTTP"
  port          = 80
  target_type   = "instance"
  vpc_id        = var.vpc_id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    matcher             = "200"
    path                = "/"
  }

  tags = {
    Name        = "${var.resrc_prefix_nm}-ui-tg80-a"
    Environment = var.environment
  }
}

resource "aws_alb_target_group" "ui-tg80-b"  {
  name          = "${var.resrc_prefix_nm}-ui-tg80-b"
  protocol      = "HTTP"
  port          = 8080
  target_type   = "instance"
  vpc_id        = var.vpc_id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    matcher             = "200"
    path                = "/"
  }

  tags = {
    Name        = "${var.resrc_prefix_nm}-ui-tg80-b"
    Environment = var.environment
  }
}