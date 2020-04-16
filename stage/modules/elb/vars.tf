# ######################
# Target Group
# ######################
# target group of app
variable "app-tg6060-a" {
  description = "target group of app"
}

variable "app-tg6060-b" {
  description = "target group of app"
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