data "aws_security_group" "default-ops-sg" {
  id = var.comp-apne2-prod-default-ops-sg_id
}

data "aws_security_group" "mgmt-alb-sg" {
  id = var.comp-apne2-prod-mgmt-alb-sg_id
}