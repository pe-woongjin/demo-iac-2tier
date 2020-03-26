terraform {
  required_version = "~> 0.12.20"
  backend "local" {}
}

provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region = var.aws_region
  version = "~> 2.51"
}

module "vpc" {
  source = "./vpc"

  team_name = var.team_name
  environment = var.environment
  aws_region_alias = var.aws_region_alias

  service_name = var.service_name
  vpc_cidr_block = var.vpc_cidr_block
}

module "demo" {
  source = "./services/demo"

  # service name
  service_name = var.service_name

  # runtime environment
  environment = var.environment

  # region name
  aws_region_alias = var.aws_region_alias

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

  # acm
  acm_demo = var.acm_demo
}

module "ui" {
  source = "./services/ui"

  # service name
  service_name = var.service_name

  # runtime environment
  environment = var.environment

  # region name
  aws_region = var.aws_region
  aws_region_alias = var.aws_region_alias

  # vpc
  vpc_id = module.vpc.id
  vpc_cidr_block = var.vpc_cidr_block

  # for subnet
  ui_sn_list = var.ui_sn_list

  # for router table
  pri_rt_ids = module.demo.pri_rt_ids

  # for sg
  sg_cidr_block = var.sg_cidr_block

  # for lc
  ui_image_id = var.ui_image_id
  ui_instance_type = var.ui_instance_type

  # for asg
  min_size = var.min_size
  max_size = var.max_size
  ui_target_group_arns = module.demo.ui_target_group_arns
}

module "api" {
  source = "./services/api"

  # service name
  service_name = var.service_name

  # runtime environment
  environment = var.environment

  # region name
  aws_region = var.aws_region
  aws_region_alias = var.aws_region_alias

  # vpc
  vpc_id = module.vpc.id
  vpc_cidr_block = var.vpc_cidr_block

  # for subnet
  api_sn_list = var.api_sn_list

  # for router table
  pri_rt_ids = module.demo.pri_rt_ids

  # for sg
  sg_cidr_block = var.sg_cidr_block

  # for lc
  api_image_id = var.api_image_id
  api_instance_type = var.api_instance_type

  # for asg
  min_size = var.min_size
  max_size = var.max_size
  api_target_group_arns = module.demo.api_target_group_arns
}