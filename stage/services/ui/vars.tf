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


# ######################
# Subnet
# ######################
# ui subnet
variable "ui_sn_list" {
  description = "private ui subnets"
  type = list(map(string))
}


# ######################
# Route Table
# ######################
# router table ids
variable "pri_rt_ids" {
  description = "pivate route table result ids"
  type = list(string)
}


# ######################
# Launch Template
# ######################
# ui launch template
variable "ui_lt" {
  description = "ui launch template"
  type = map(string)
}