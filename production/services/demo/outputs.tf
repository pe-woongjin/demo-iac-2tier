output "pub_sn_ids" {
  value = aws_subnet.pub-sn.*.id
}

output "pri_rt_ids" {
  value = aws_route_table.pri-rt.*.id
}

output "mgmt_sg_id" {
  value = aws_security_group.mgmt-alb-sg.id
}