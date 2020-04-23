resource "aws_route_table_association" "demo-rt-as-private" {
  count           = length(aws_subnet.api-sn)

  subnet_id       = aws_subnet.api-sn.*.id[count.index]
  route_table_id  = var.pri_rt_ids[0]
}