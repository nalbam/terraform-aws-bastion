# bastion

terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket = "terraform-nalbam-seoul"
    key    = "bastion.tfstate"
  }
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.region
}

module "bastion" {
  source = "../../modules/bastion"

  name = var.name

  vpc_id = var.vpc_id

  subnet_id = var.subnet_id

  administrator = var.administrator

  allow_ip_address = var.allow_ip_address

  user_data = data.template_file.setup.rendered

  key_name = var.key_name
}
