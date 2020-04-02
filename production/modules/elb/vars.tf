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
# Subnet
# ######################
# public subnet
variable "pub_sn_ids" {
  description = "public subnets id"
  type = list(string)
}


# ######################
# Security Group
# ######################
# mgmt sg id
variable "mgmt_sg_id" {
  description = "mgmt sg id"
  type = string
}


# ######################
# Target Group
# ######################
# target group of ui
variable "ui-tg8080" {
  description = "target group of ui"
}

# target group of api
variable "api-tg8080" {
  description = "target group of api"
}


# ######################
# ACM
# Route 53
# ######################
# acm
variable "acm_arn" {
  description = "acm arn"
  type = string
}


# ######################
# Data
# ######################
# import data
variable "import_data" {
  description = "import data"
  type = map(string)
}