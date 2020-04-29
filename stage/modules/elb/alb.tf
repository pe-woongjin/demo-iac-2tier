data "aws_alb_listener" "mgmt-alb-listener443" {
  arn = var.comp-apne2-prod-mgmt-alb_id
}

resource "aws_alb_listener_rule" "mgmt-alb-listener443-ui-rule" {
  listener_arn  = data.aws_alb_listener.mgmt-alb-listener443.arn
  depends_on    = [ var.ui-a-tg80 ]

  action {
    target_group_arn  = var.ui-a-tg80.arn
    type              = "forward"
  }

  condition {
    host_header {
      values = [ var.hosts.ui ]
    }
  }
}

resource "aws_alb_listener_rule" "mgmt-alb-listener443-api-rule" {
  listener_arn  = data.aws_alb_listener.mgmt-alb-listener443.arn
  depends_on    = [ var.api-a-tg8080 ]

  action {
    target_group_arn  = var.api-a-tg8080.arn
    type              = "forward"
  }

  condition {
    host_header {
      values = [ var.hosts.api ]
    }
  }
}