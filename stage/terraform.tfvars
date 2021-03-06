# ######################
# COMMON
# ######################
# team
team_name = "PE"

# service name
service_name = "demo"

# service version
service_version = "0.2"

# env
environment = "stg"

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
# private ui subnet
ui_sn_list = [
  {
    cidr_block = "10.40.70.0/24",
    availability_zone = "ap-northeast-2a",
    Name = "ui-1a-sn"
  },
  {
    cidr_block = "10.40.71.0/24",
    availability_zone = "ap-northeast-2c",
    Name = "ui-1c-sn"
  }
]

# private api subnet
api_sn_list = [
  {
    cidr_block = "10.40.80.0/24",
    availability_zone = "ap-northeast-2a",
    Name = "api-1a-sn"
  },
  {
    cidr_block = "10.40.81.0/24",
    availability_zone = "ap-northeast-2c",
    Name = "api-1c-sn"
  }
]


# ######################
# Route Table
# ######################
# private route table
private_rt_tag_names = [
  {
    Name = "pri-rt"
  }
]


# ######################
# Launch Template
# ######################
# ui launch template
ui_lt = {
    "id" = "ami-0cd7b0de75f5a35d1" // "ami-0740ca5a912ab5be6" (ui stg img)
    "type" = "t3.small"
    "key_name" = "comp-prod-keypair"
    "min_size" = 0
    "max_size" = 0
}

# api launch template
api_lt = {
  "id" = "ami-0cd7b0de75f5a35d1" // "ami-00e46f0632d32c625" (api stg img)
  "type" = "t3.small"
  "key_name" = "comp-prod-keypair"
  "min_size" = 0
  "max_size" = 0
}


# ######################
# Route 53
# ######################
# route 53 host name
hosts = {
  "ui" = "stg.ui.mingming.shop"
  "api" = "stg.api.mingming.shop"
}


# ######################
# Data
# ######################
comp-apne2-prod-mgmt-alb_id = "arn:aws:elasticloadbalancing:ap-northeast-2:144149479695:listener/app/comp-apne2-prod-mgmt-alb/d76ec25af38db29c/d15a5636f3b71341"
comp-apne2-prod-vpc_id = "vpc-091d246902d0878c4"
comp-apne2-prod-nat_id = "nat-0e8e686b449ec58f8"