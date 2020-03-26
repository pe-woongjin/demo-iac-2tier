# ######################
# COMMON
# ######################
variable "team_name" {
  description = "Team name of DevOps"
  type = string
  default = "Automation"
}

variable "service_name" {
  description = "Service name"
  type = string
  default = "demo"
}

variable "environment" {
  description = "Runtime Environment such as default, develop, stage, production"
  type = string
  default = "prod"
}

variable "aws_region" {
  description = "Region for the Comp"
  type = string
  default = "ap-northeast-2"
}

variable "aws_region_alias" {
  description = "Region name for the Comp"
  type = string
  default = "apne2"
}


# ######################
# VPC
# ######################
# cidr block
variable "vpc_cidr_block" {
  description = "cidr block of vpc"
  type = string
}


# ######################
# Subnet
# ######################
# subnet
variable "pub_sn_list" {
  description = "public subnets"
  type = list(map(string))
}

# subnet
variable "ui_sn_list" {
  description = "private subnets"
  type = list(map(string))
}

# subnet
variable "api_sn_list" {
  description = "private subnets"
  type = list(map(string))
}


# ######################
# Internet Gateway
# Elastic IP
# NAT
# ######################


# ######################
# Route Table
# ######################
# route table
variable "public_rt_tag_names" {
  description = "tag name for public route table"
  type = list(map(string))
}

# route table
variable "private_rt_tag_names" {
  description = "tag name for private route table"
  type = list(map(string))
}


# ######################
# Security Group
# ######################
# sg cidr block
variable "sg_cidr_block" {
  description = "sg cidr block"
  type = list(string)
}


# ######################
# Launch Configuration
# AutoScaling Group
# ######################
variable "ui_image_id" {
  description = "image id used in ui"
  type = string
}

# instance type ui
variable "ui_instance_type" {
  description = "instance type used in ui"
  type = string
}

# image id api
variable "api_image_id" {
  description = "image id used in api"
  type = string
}

# instance type api
variable "api_instance_type" {
  description = "instance type used in api"
  type = string
}

# autoscaling min size
variable "min_size" {
  description = "autoscaling min size"
  type = number
}

# autoscaling max size
variable "max_size" {
  description = "autoscaling max size"
  type = number
}


# ######################
# ACM
# Route 53
# ######################
# acm
variable "acm_demo" {
  description = "prefix resource name"
  type = string
}