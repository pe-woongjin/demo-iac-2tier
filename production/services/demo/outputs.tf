output "pub_sn_ids" {
  value = [ data.aws_subnet.pub-sn-a.id, data.aws_subnet.pub-sn-c.id ]
}

output "pri_rt_ids" {
  value = aws_route_table.pri-rt.*.id
}

output "mgmt_sg_id" {
  value = data.aws_security_group.mgmt-alb-sg.id
}