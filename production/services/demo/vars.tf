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
# public subnet
variable "pub_sn_list" {
  description = "public subnets"
  type = list(map(string))
}


# ######################
# Route Table
# ######################
# public route table
variable "public_rt_tag_names" {
  description = "tag name for public route table"
  type = list(map(string))
}

# private route table
variable "private_rt_tag_names" {
  description = "tag name for private route table"
  type = list(map(string))
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
# Data
# ######################
variable "comp-apne2-prod-eip_id" {
  description = "comp-apne2-prod-eip_id"
  type = string
}

variable "comp-apne2-prod-igw_id" {
  description = "comp-apne2-prod-igw_id"
  type = string
}

variable "comp-apne2-prod-nat_id" {
  description = "comp-apne2-prod-nat_id"
  type = string
}

variable "comp-apne2-prod-default-ops-sg_id" {
  description = "comp-apne2-prod-default-ops-sg_id"
  type = string
}

variable "comp-apne2-prod-mgmt-alb-sg_id" {
  description = "comp-apne2-prod-mgmt-alb-sg_id"
  type = string
}

variable "comp-apne2-prod-pub-1a-sn_id" {
  description = "comp-apne2-prod-pub-1a-sn_id"
  type = string
}

variable "comp-apne2-prod-pub-1c-sn_id" {
  description = "comp-apne2-prod-pub-1c-sn_id"
  type = string
}