resource "aws_alb_target_group" "app-tg6060-a"  {
  name          = "${var.resrc_prefix_nm}-app-tg6060-a"
  protocol      = "HTTP"
  port          = 6060
  target_type   = "instance"
  vpc_id        = var.vpc_id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    matcher             = "200"
    path                = "/swagger-ui.html"
  }

  tags = {
    Name        = "${var.resrc_prefix_nm}-app-tg6060-a"
    Environment = var.environment
  }
}

resource "aws_alb_target_group" "app-tg6060-b"  {
  name          = "${var.resrc_prefix_nm}-app-tg6060-b"
  protocol      = "HTTP"
  port          = 6060
  target_type   = "instance"
  vpc_id        = var.vpc_id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    matcher             = "200"
    path                = "/swagger-ui.html"
  }

  tags = {
    Name        = "${var.resrc_prefix_nm}-app-tg6060-b"
    Environment = var.environment
  }
}