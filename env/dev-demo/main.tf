# bastion

terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket = "terraform-nalbam-seoul"
    key = "bastion.tfstate"
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

module "bastion" {
  source = "../../modules/bastion"

  region = "ap-northeast-2"
  city   = "SEOUL"
  stage  = "DEV"
  name   = "DEMO"
  suffix = "BASTION"

  ami_id = ""
  type   = "t2.nano"

  vpc_id   = ""
  vpc_cidr = "10.99.0.0/16"
  subnets  = "85" # 10.99.85.x/24

  key_name = "nalbam-seoul"

  base_domain = "nalbam.com"
}

output "name" {
  value = "${module.bastion.name}"
}

output "domain" {
  value = "${module.bastion.domain}"
}

output "public_ip" {
  value = "${module.bastion.public_ip}"
}

output "vpc_id" {
  value = "${module.bastion.vpc_id}"
}

output "subnet_ids" {
  value = "${module.bastion.subnet_ids}"
}
