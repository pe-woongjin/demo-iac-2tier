output "pri_rt_ids" {
  value = aws_route_table.pri-rt.*.id
}

output "api_target_group_arns" {
  value = [aws_alb_target_group.api-tg8080.arn]
}

output "ui_target_group_arns" {
  value = [aws_alb_target_group.ui-tg8080.arn]
}