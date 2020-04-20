terraform {
  required_version = "~> 0.12.20"

  backend "local" {}
}

provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region = var.region_name
  version = "~> 2.51"
}

module "s3" {
  source = "./s3"

  # common
  environment = var.environment
  svc_prefix_nm = "${var.service_name}-${var.environment}"
  resrc_prefix_nm = "${var.service_name}-${var.region_nm}-${var.environment}"
}