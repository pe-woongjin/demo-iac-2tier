# ######################
# COMMON
# ######################
variable "team_name" {
  description = "team name of DevOps"
  type = string
}

variable "service_name" {
  description = "name of service"
  type = string
}

variable "service_version" {
  description = "version of service"
  type = string
}

variable "environment" {
  description = "Runtime Environment such as default, develop, stage, production"
  type = string
}

variable "region_name" {
  description = "aws region"
  type = string
}

variable "region_nm" {
  description = "aws region alias"
  type = string
}


# ######################
# VPC
# ######################
# vpc cidr block
variable "vpc_cidr_block" {
  description = "cidr block of vpc"
  type = string
}


# ######################
# Subnet
# ######################
# ui subnet
variable "ui_sn_list" {
  description = "private subnets"
  type = list(map(string))
}

# api subnet
variable "api_sn_list" {
  description = "private subnets"
  type = list(map(string))
}


# ######################
# Route Table
# ######################
# private route table
variable "private_rt_tag_names" {
  description = "tag name for private route table"
  type = list(map(string))
}


# ######################
# Launch Template
# ######################
# ui launch template
variable "ui_lt" {
  description = "ui launch template"
  type = map(string)
}

# api launch template
variable "api_lt" {
  description = "api launch template"
  type = map(string)
}


# ######################
# Route 53
# ######################
# route 53 host name
variable "hosts" {
  description = "route 53 host name"
  type = map(string)
}


# ######################
# Data
# ######################
variable "comp-apne2-prod-mgmt-alb_id" {
  description = "comp-apne2-prod-mgmt-alb_id"
  type = string
}

variable "comp-apne2-prod-vpc_id" {
  description = "comp-apne2-prod-vpc_id"
  type = string
}

variable "comp-apne2-prod-nat_id" {
  description = "comp-apne2-prod-nat_id"
  type = string
}