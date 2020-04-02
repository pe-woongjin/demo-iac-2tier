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

  # common
  team_name = var.team_name
  service_name = var.service_name
  service_version = var.service_version
  environment = var.environment
  svc_prefix_nm = "${var.service_name}-${var.environment}"
  resrc_prefix_nm = "${var.service_name}-${var.region_nm}-${var.environment}"

  # vpc
  vpc_cidr_block = var.vpc_cidr_block

  # import data
  import_data = var.import_data
}

module "elb" {
  source = "./modules/elb"

  # common
  environment = var.environment
  svc_prefix_nm = "${var.service_name}-${var.environment}"
  resrc_prefix_nm = "${var.service_name}-${var.region_nm}-${var.environment}"

  # subnets
  pub_sn_ids = module.demo.pub_sn_ids

  # sg
  mgmt_sg_id = module.demo.mgmt_sg_id

  # tg
  ui-tg8080 = module.ui.ui-tg8080
  api-tg8080 = module.api.api-tg8080

  # acm
  acm_arn = var.acm_arn

  # import data
  import_data = var.import_data
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

  # subnets
  pub_sn_list = var.pub_sn_list

  # route table
  public_rt_tag_names = var.public_rt_tag_names
  private_rt_tag_names = var.private_rt_tag_names

  # sg
  sg_cidr_block = var.sg_cidr_block

  # import data
  import_data = var.import_data
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