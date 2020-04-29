terraform {
  required_version = "~> 0.12.20"

  backend "s3" {
    bucket          = "terraform-tfstates-mgmt"
    key             = "demo/prod/terraform.tfstate"
    region          = "ap-northeast-2"
    dynamodb_table  = "terraform-lock-table"
    encrypt         = true
    acl             = "bucket-owner-full-control"
  }
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
  ui-a-tg80 = module.ui.ui-a-tg80
  ui-b-tg80 = module.ui.ui-b-tg80
  api-a-tg8080 = module.api.api-a-tg8080
  api-b-tg8080 = module.api.api-b-tg8080

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

  # subnet
  ui_sn_list = var.ui_sn_list

  # router table
  pri_rt_ids = module.demo.pri_rt_ids

  # lc
  ui_lt = var.ui_lt
}

module "api" {
  source = "./services/api"

  # common
  environment = var.environment
  svc_prefix_nm = "${var.service_name}-${var.environment}"
  resrc_prefix_nm = "${var.service_name}-${var.region_nm}-${var.environment}"

  # vpc
  vpc_id = module.vpc.id

  # subnet
  api_sn_list = var.api_sn_list

  # router table
  pri_rt_ids = module.demo.pri_rt_ids

  # lc
  api_lt = var.api_lt
}