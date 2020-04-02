resource "aws_route_table" "pri-rt" {
  vpc_id        = var.vpc_id
  count         = length(var.private_rt_tag_names)
  depends_on    = [ data.aws_nat_gateway.nat ]

  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id  = data.aws_internet_gateway.igw.id
  }

  tags = {
    Name        = "${var.resrc_prefix_nm}-${lookup(var.private_rt_tag_names[count.index], "Name")}"
    Environment = var.environment
  }
}