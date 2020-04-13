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