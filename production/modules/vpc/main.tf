data "aws_vpc" "comp" {
  id = var.import_data.vpc_id
}