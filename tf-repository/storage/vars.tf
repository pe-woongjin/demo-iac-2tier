# ######################
# COMMON
# ######################
variable "environment" {
  description = "Runtime Environment such as default, develop, stage, production"
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