# ######################
# COMMON
# ######################
# team
team_name = "Automation"

# service name
service_name = "demo"

# env
environment = "prod"

# region
aws_region = "ap-northeast-2"
aws_region_alias = "apne2"


# ######################
# VPC
# ######################
# cidr block
vpc_cidr_block = "10.50.0.0/16"


# ######################
# Subnet
# ######################
# subnet public
pub_sn_list = [
  {
    cidr_block = "10.50.10.0/24",
    availability_zone = "ap-northeast-2a",
    Name = "pub-1a-sn"
  },
  {
    cidr_block = "10.50.11.0/24",
    availability_zone = "ap-northeast-2c",
    Name = "pub-1c-sn"
  }
]

# subnet ui
ui_sn_list = [
  {
    cidr_block = "10.50.20.0/24",
    availability_zone = "ap-northeast-2a",
    Name = "ui-1a-sn"
  },
  {
    cidr_block = "10.50.21.0/24",
    availability_zone = "ap-northeast-2c",
    Name = "ui-1c-sn"
  }
]

# subnet api
api_sn_list = [
  {
    cidr_block = "10.50.30.0/24",
    availability_zone = "ap-northeast-2a",
    Name = "api-1a-sn"
  },
  {
    cidr_block = "10.50.31.0/24",
    availability_zone = "ap-northeast-2c",
    Name = "api-1c-sn"
  }
]


# ######################
# Internet Gateway
# Elastic IP
# NAT
# ######################


# ######################
# Route Table
# ######################
# route table
public_rt_tag_names = [
  {
    Name = "pub-rt"
  }
]

# route table
private_rt_tag_names = [
  {
    Name = "pri-rt"
  }
]


# ######################
# Security Group
# ######################
sg_cidr_block = ["58.151.93.9/32", "58.151.93.2/32"]


# ######################
# Launch Configuration
# AutoScaling Group
# ######################
# image id ui
ui_image_id = "ami-0ecd78c22823e02ef"

# instance type ui
ui_instance_type = "t2.micro"

# image id api
api_image_id = "ami-0ecd78c22823e02ef"

# instance type api
api_instance_type = "t2.micro"

# autoscaling min size
min_size = 0

# autoscaling max size
max_size = 0


# ######################
# ACM
# Route 53
# ######################
# acm
acm_demo = "arn:aws:acm:ap-northeast-2:144149479695:certificate/efc7a467-526d-4476-b91f-ef69f146c6a6"