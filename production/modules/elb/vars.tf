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
# Target Group
# ######################
# target group of ui
variable "ui-tg80-a" {
  description = "target group of ui"
}

variable "ui-tg80-b" {
  description = "target group of ui"
}

# target group of api
variable "api-tg8080-a" {
  description = "target group of api"
}

variable "api-tg8080-b" {
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