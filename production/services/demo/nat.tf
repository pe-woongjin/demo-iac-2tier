data "aws_nat_gateway" "nat" {
  id = var.import_data.nat_id
}