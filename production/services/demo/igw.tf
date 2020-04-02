data "aws_internet_gateway" "igw" {
  internet_gateway_id = var.import_data.igw_id
}