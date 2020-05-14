resource "aws_launch_template" "ui-lt" {
  name                    = "${var.resrc_prefix_nm}-ui-lt"
  image_id                = var.ui_lt.id
  key_name                = var.ui_lt.key_name
  instance_type           = var.ui_lt.type
  vpc_security_group_ids  = [ aws_security_group.ui-sg.id ]

  iam_instance_profile {
    name = "comp-codedeploy-ec2-role"
  }

  user_data = base64encode(templatefile("./services/api/ud-startup-health.tpl", {}))

  tag_specifications {
    resource_type = "instance"
    tags = {
      "Name" = "${var.resrc_prefix_nm}-ui-lt"
    }
  }
}