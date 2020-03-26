resource "aws_alb" "mgmt-alb" {
  name               = "${var.service_name}-${var.aws_region_alias}-${var.environment}-mgmt-alb"
  load_balancer_type = "application"
  internal           = false
  subnets            = [ aws_subnet.pub-sn[0].id, aws_subnet.pub-sn[1].id ]

  security_groups    = [ aws_security_group.mgmt-alb-sg.id ]

  // NOTE there is a bug in terraform - it can't remove the lb and the whole destroy fails
  enable_deletion_protection = false

  tags = {
    Name        = "${var.service_name}-${var.aws_region_alias}-${var.environment}-mgmt-alb"
    Environment = var.environment
  }
}

resource "aws_alb_target_group" "ui-tg8080"  {
  name        = "${var.service_name}-${var.aws_region_alias}-${var.environment}-ui-tg8080"
  protocol    = "HTTP"
  port        = 8080
  target_type = "instance"
  vpc_id      = var.vpc_id
  depends_on  = [ aws_alb.mgmt-alb ]

  tags = {
    Name        = "${var.service_name}-${var.aws_region_alias}-${var.environment}-ui-tg8080"
    Environment = var.environment
  }
}

resource "aws_alb_target_group" "api-tg8080"  {
  name          = "${var.service_name}-${var.aws_region_alias}-${var.environment}-api-tg8080"
  protocol      = "HTTP"
  port          = 8080
  target_type   = "instance"
  vpc_id        = var.vpc_id
  depends_on    = [ aws_alb.mgmt-alb ]

  tags = {
    Name        = "${var.service_name}-${var.aws_region_alias}-${var.environment}-api-tg8080"
    Environment = var.environment
  }
}

resource "aws_alb_listener" "mgmt-alb-listener443" {
  load_balancer_arn = aws_alb.mgmt-alb.arn
  port              = 443
  protocol          = "HTTPS"
  certificate_arn   = var.acm_demo
  depends_on        = [ aws_alb.mgmt-alb, aws_alb_target_group.ui-tg8080, aws_alb_target_group.api-tg8080 ]

  default_action {
    target_group_arn = aws_alb_target_group.api-tg8080.arn
    type             = "forward"
  }
}

resource "aws_alb_listener_rule" "mgmt-alb-listener443-ui-rule" {
  listener_arn        = aws_alb_listener.mgmt-alb-listener443.arn
  depends_on          = [ aws_alb_target_group.ui-tg8080 ]

  action {
    target_group_arn  = aws_alb_target_group.ui-tg8080.arn
    type              = "forward"
  }

  condition {
    path_pattern {
      values = [ "/ui/*" ]
    }
  }
}

resource "aws_alb_listener_rule" "mgmt-alb-listener443-api-rule" {
  listener_arn        = aws_alb_listener.mgmt-alb-listener443.arn
  depends_on          = [ aws_alb_target_group.api-tg8080 ]

  action {
    target_group_arn  = aws_alb_target_group.api-tg8080.arn
    type              = "forward"
  }

  condition {
    path_pattern {
      values = [ "/api/*" ]
    }
  }
}