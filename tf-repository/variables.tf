# ######################
# COMMON
# ######################
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
# S3
# ######################
variable "s3_log" {
  description = "s3 log bucket name"
  type = string
}

variable "s3_mgmt" {
  description = "s3 mgmt bucket name"
  type = string
}


# ######################
# Dynamo DB
# ######################
variable "dynamodb_tbl" {
  description = "dynamo db table name"
  type = string
}