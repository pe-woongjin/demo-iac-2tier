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