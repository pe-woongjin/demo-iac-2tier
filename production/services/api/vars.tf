# ######################
# COMMON
# ######################
variable "environment" {
  description = "Runtime Environment such as default, develop, stage, production"
  type = string
}

variable "svc_prefix_nm" {
  description = "svc prefix name"
  type = string
}

variable "resrc_prefix_nm" {
  description = "resource prefix name"
  type = string
}


# ######################
# VPC
# ######################
# vpc id
variable "vpc_id" {
  type        = string
  description = "vpc id"
}

# vpc cidr block
variable "vpc_cidr_block" {
  description = "cidr block of vpc"
  type = string
}


# ######################
# Subnet
# ######################
# api subnet
variable "api_sn_list" {
  description = "private api subnets"
  type = list(map(string))
}


# ######################
# Route Table
# ######################
# pivate router table ids
variable "pri_rt_ids" {
  description = "pivate route table result ids"
  type = list(string)
}


# ######################
# Security Group
# ######################
# sg cidr block
variable "sg_cidr_block" {
  description = "cidr block of sg"
  type = list(string)
}


# ######################
# Launch Configuration
# AutoScaling Group
# ######################
# api launch configuration
variable "api_lc" {
  description = "api launch configuration"
  type = map(string)
}