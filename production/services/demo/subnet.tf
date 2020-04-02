data "aws_subnet" "pub-sn-a" {
  id = var.import_data.sn_pub_a_id
}

data "aws_subnet" "pub-sn-c" {
  id = var.import_data.sn_pub_c_id
}