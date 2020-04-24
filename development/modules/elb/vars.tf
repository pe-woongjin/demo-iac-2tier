# ######################
# Target Group
# ######################
# target group of ui
variable "ui-a-tg80" {
  description = "target group of ui"
}

variable "ui-b-tg80" {
  description = "target group of ui"
}

# target group of api
variable "api-a-tg8080" {
  description = "target group of api"
}

variable "api-b-tg8080" {
  description = "target group of api"
}


# ######################
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