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
  ui-tg80-a = module.ui.ui-tg80-a
  ui-tg80-b = module.ui.ui-tg80-b
  api-tg8080-a = module.api.api-tg8080-a
  api-tg8080-b = module.api.api-tg8080-b

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
  vpc_cidr_block = var.vpc_cidr_block

  # route table
  private_rt_tag_names = var.private_rt_tag_names

  # sg
  sg_cidr_block = var.sg_cidr_block

  # import data
  comp-apne2-prod-nat_id = var.comp-apne2-prod-nat_id
}

module "ui" {
  source = "./services/ui"

  # common
  environment = var.environment
  svc_prefix_nm = "${var.service_name}-${var.environment}"
  resrc_prefix_nm = "${var.service_name}-${var.region_nm}-${var.environment}"

  # vpc
  vpc_id = module.vpc.id
  vpc_cidr_block = var.vpc_cidr_block

  # subnet
  ui_sn_list = var.ui_sn_list

  # router table
  pri_rt_ids = module.demo.pri_rt_ids

  # sg
  sg_cidr_block = var.sg_cidr_block

  # lc
  ui_lc = var.ui_lc
}

module "api" {
  source = "./services/api"

  # common
  environment = var.environment
  svc_prefix_nm = "${var.service_name}-${var.environment}"
  resrc_prefix_nm = "${var.service_name}-${var.region_nm}-${var.environment}"

  # vpc
  vpc_id = module.vpc.id
  vpc_cidr_block = var.vpc_cidr_block

  # subnet
  api_sn_list = var.api_sn_list

  # router table
  pri_rt_ids = module.demo.pri_rt_ids

  # sg
  sg_cidr_block = var.sg_cidr_block

  # lc
  api_lc = var.api_lc
}