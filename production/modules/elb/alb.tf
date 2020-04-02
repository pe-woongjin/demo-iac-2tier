data "aws_alb_listener" "mgmt-alb-listener443" {
  arn = var.import_data.alb_arn
}

resource "aws_alb_listener_rule" "mgmt-alb-listener443-ui-rule" {
  listener_arn        = data.aws_alb_listener.mgmt-alb-listener443.arn
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
  listener_arn        = data.aws_alb_listener.mgmt-alb-listener443.arn
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