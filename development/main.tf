terraform {
  required_version = "~> 0.12.20"
  backend "local" {}
}

provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region = var.region_name
  version = "~> 2.51"
}

module "vpc" {
  source = "./modules/vpc"

  # import data
  comp-apne2-prod-vpc_id = var.comp-apne2-prod-vpc_id
}

module "elb" {
  source = "./modules/elb"

  # tg
  app-tg8080-a = module.app.app-tg8080-a
  app-tg8080-b = module.app.app-tg8080-b

  # host
  hosts = var.hosts

  # import data
  comp-apne2-prod-mgmt-alb_id = var.comp-apne2-prod-mgmt-alb_id
}

module "demo" {
  source = "./services/demo"

  # common
  environment = var.environment
  svc_prefix_nm = "${var.service_name}-${var.environment}"
  resrc_prefix_nm = "${var.service_name}-${var.region_nm}-${var.environment}"

  # vpc
  vpc_id = module.vpc.id

  # route table
  private_rt_tag_names = var.private_rt_tag_names

  # sg
  sg_cidr_block = var.sg_cidr_block

  # import data
  comp-apne2-prod-nat_id = var.comp-apne2-prod-nat_id
}

module "app" {
  source = "./services/app"

  # common
  environment = var.environment
  svc_prefix_nm = "${var.service_name}-${var.environment}"
  resrc_prefix_nm = "${var.service_name}-${var.region_nm}-${var.environment}"

  # vpc
  vpc_id = module.vpc.id

  # subnet
  app_sn_list = var.app_sn_list

  # router table
  pri_rt_ids = module.demo.pri_rt_ids

  # sg
  sg_cidr_block = var.sg_cidr_block

  # lc
  app_lc = var.app_lc
}