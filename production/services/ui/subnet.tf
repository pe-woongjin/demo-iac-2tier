resource "aws_subnet" "ui-sn" {
  vpc_id                    = var.vpc_id
  count                     = length(var.ui_sn_list)
  cidr_block                = lookup(var.ui_sn_list[count.index], "cidr_block")
  availability_zone         = lookup(var.ui_sn_list[count.index], "availability_zone")

  map_public_ip_on_launch   = false

  tags = {
    Name        = "${var.resrc_prefix_nm}-${lookup(var.ui_sn_list[count.index], "Name")}"
    Environment = var.environment
  }
}