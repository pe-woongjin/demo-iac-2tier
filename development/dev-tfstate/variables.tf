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