resource "aws_alb" "mgmt-alb" {
  name               = "${var.resrc_prefix_nm}-mgmt-alb"
  load_balancer_type = "application"
  internal           = false
  subnets            = var.pub_sn_ids

  security_groups    = [ var.mgmt_sg_id ]

  // NOTE there is a bug in terraform - it can't remove the lb and the whole destroy fails
  enable_deletion_protection = false

  tags = {
    Name        = "${var.resrc_prefix_nm}-mgmt-alb"
    Environment = var.environment
  }
}

resource "aws_alb_listener" "mgmt-alb-listener443" {
  load_balancer_arn = aws_alb.mgmt-alb.arn
  port              = 443
  protocol          = "HTTPS"
  certificate_arn   = var.acm_arn
  depends_on        = [ aws_alb.mgmt-alb, var.ui-tg8080, var.api-tg8080 ]

  default_action {
    target_group_arn = var.api-tg8080.arn
    type             = "forward"
  }
}

resource "aws_alb_listener_rule" "mgmt-alb-listener443-ui-rule" {
  listener_arn        = aws_alb_listener.mgmt-alb-listener443.arn
  depends_on          = [ var.ui-tg8080 ]

  action {
    target_group_arn  = var.ui-tg8080.arn
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
  depends_on          = [ var.api-tg8080 ]

  action {
    target_group_arn  = var.api-tg8080.arn
    type              = "forward"
  }

  condition {
    path_pattern {
      values = [ "/api/*" ]
    }
  }
}