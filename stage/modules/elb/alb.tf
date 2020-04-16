data "aws_alb_listener" "mgmt-alb-listener443" {
  arn = var.comp-apne2-prod-mgmt-alb_id
}

resource "aws_alb_listener_rule" "mgmt-alb-listener443-ui-rule" {
  listener_arn        = data.aws_alb_listener.mgmt-alb-listener443.arn
  depends_on          = [ var.ui-tg80-a ]

  action {
    target_group_arn  = var.ui-tg80-a.arn
    type              = "forward"
  }

  condition {
    host_header {
      values = [ var.hosts.ui ]
    }
  }
}

resource "aws_alb_listener_rule" "mgmt-alb-listener443-api-rule" {
  listener_arn        = data.aws_alb_listener.mgmt-alb-listener443.arn
  depends_on          = [ var.api-tg8080-a ]

  action {
    target_group_arn  = var.api-tg8080-a.arn
    type              = "forward"
  }

  condition {
    host_header {
      values = [ var.hosts.api ]
    }
  }
}