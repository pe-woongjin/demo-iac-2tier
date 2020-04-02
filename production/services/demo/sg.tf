data "aws_security_group" "default-ops-sg" {
  id = var.import_data.sg_def_id
}

data "aws_security_group" "mgmt-alb-sg" {
  id = var.import_data.sg_alb_id
}