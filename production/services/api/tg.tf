resource "aws_alb_target_group" "api-tg8080"  {
  name          = "${var.resrc_prefix_nm}-api-tg8080"
  protocol      = "HTTP"
  port          = 8080
  target_type   = "instance"
  vpc_id        = var.vpc_id

  tags = {
    Name        = "${var.resrc_prefix_nm}-api-tg8080"
    Environment = var.environment
  }
}