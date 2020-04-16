data "aws_alb_listener" "mgmt-alb-listener443" {
  arn = var.comp-apne2-prod-mgmt-alb_id
}

resource "aws_alb_listener_rule" "mgmt-alb-listener443-app-rule" {
  listener_arn        = data.aws_alb_listener.mgmt-alb-listener443.arn
  depends_on          = [ var.app-tg6060-a ]

  action {
    target_group_arn  = var.app-tg6060-a.arn
    type              = "forward"
  }

  condition {
    host_header {
      values = [ var.hosts.app ]
    }
  }
}