# ######################
# COMMON
# ######################
# team
team_name = "Automation"

# service name
service_name = "demo"

# service version
service_version = "0.1"

# env
environment = "prod"

# region
region_name = "ap-northeast-2"
region_nm = "apne2"


# ######################
# VPC
# ######################
# vpc cidr block
vpc_cidr_block = "10.40.0.0/16"


# ######################
# Subnet
# ######################
# public subnet
pub_sn_list = [
  {
    cidr_block = "10.40.10.0/24",
    availability_zone = "ap-northeast-2a",
    Name = "pub-1a-sn"
  },
  {
    cidr_block = "10.40.11.0/24",
    availability_zone = "ap-northeast-2c",
    Name = "pub-1c-sn"
  }
]

# private ui subnet
ui_sn_list = [
  {
    cidr_block = "10.40.30.0/24",
    availability_zone = "ap-northeast-2a",
    Name = "ui-1a-sn"
  },
  {
    cidr_block = "10.40.31.0/24",
    availability_zone = "ap-northeast-2c",
    Name = "ui-1c-sn"
  }
]

# private api subnet
api_sn_list = [
  {
    cidr_block = "10.40.40.0/24",
    availability_zone = "ap-northeast-2a",
    Name = "api-1a-sn"
  },
  {
    cidr_block = "10.40.41.0/24",
    availability_zone = "ap-northeast-2c",
    Name = "api-1c-sn"
  }
]


# ######################
# Route Table
# ######################
# public route table
public_rt_tag_names = [
  {
    Name = "pub-rt"
  }
]

# private route table
private_rt_tag_names = [
  {
    Name = "pri-rt"
  }
]


# ######################
# Security Group
# ######################
# sg cidr block
sg_cidr_block = ["58.151.93.9/32", "58.151.93.2/32"]


# ######################
# Launch Configuration
# AutoScaling Group
# ######################
# ui launch configuration
ui_lc = {
    "id" = "ami-0d69d26d777db7c18"
    "type" = "t3.medium"
    "key_name" = "comp-prod-keypair"
    "min_size" = 1
    "max_size" = 3
}

# api launch configuration
api_lc = {
  "id" = "ami-036d0b92069714dd9"
  "type" = "t3.medium"
  "key_name" = "comp-prod-keypair"
  "min_size" = 1
  "max_size" = 3
}


# ######################
# ACM
# Route 53
# ######################
# acm
acm_arn = "arn:aws:acm:ap-northeast-2:144149479695:certificate/efc7a467-526d-4476-b91f-ef69f146c6a6"

# route 53 host name
hosts = {
  "ui" = "ui.mingming.shop"
  "api" = "api.mingming.shop"
}


# ######################
# Data
# ######################
comp-apne2-prod-mgmt-alb_id = "arn:aws:elasticloadbalancing:ap-northeast-2:144149479695:listener/app/comp-apne2-prod-mgmt-alb/a1b6243e9868516a/544e2ed54ee9a24b"
comp-apne2-prod-vpc_id = "vpc-00c322b7318b414b6"
comp-apne2-prod-nat_id = "nat-0dab6362059ceac32"