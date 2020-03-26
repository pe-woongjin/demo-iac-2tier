# ######################
# COMMON
# ######################
variable "service_name" {
  description = "name of service"
  type = string
}

variable "environment" {
  description = "Runtime Environment such as default, develop, stage, production"
  type = string
}

variable "aws_region" {
  description = "Region for the OpsFlex"
  type = string
}

variable "aws_region_alias" {
  description = "aws region alias of prefix"
  type = string
}



# ######################
# VPC
# ######################
# vpc id
variable "vpc_id" {
  type        = string
  description = "count of loop"
}

variable "vpc_cidr_block" {
  description = "cidr block of vpc"
  type = string
}


# ######################
# Subnet
# ######################
# subnet
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
# image id api
variable "ui_image_id" {
  description = "image id used in ui"
  type = string
}

# instance type api
variable "ui_instance_type" {
  description = "instance type used in ui"
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

# target group arns for ui
variable "ui_target_group_arns" {
  description = "target group arns for ui"
  type = list(string)
}