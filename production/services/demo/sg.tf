/* default management security group for ec2 instances. It helps monitoring, access operationg works like that. */
data "aws_security_group" "default-ops-sg" {
  id = "sg-06d73665b82d333be"
}

data "aws_security_group" "mgmt-alb-sg" {
  id = "sg-0d6079940fc891b6b"
}