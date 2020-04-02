data "aws_eip" "eip" {
  id = var.import_data.eip_id
}