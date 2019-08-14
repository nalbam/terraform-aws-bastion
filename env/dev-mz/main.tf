# bastion

terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket = "terraform-mz-seoul"
    key    = "bastion.tfstate"
  }
  required_version = ">= 0.12"
}

provider "aws" {
  region = "ap-northeast-2"
}

module "bastion" {
  source = "../../modules/bastion"

  region = "ap-northeast-2"
  city   = "seoul"
  stage  = "dev"
  name   = "demo"
  suffix = "bastion"

  vpc_id = "vpc-025ad1e9d1cb3c27d"

  subnet_id = "subnet-007a2bd91c7939e85"

  # ami_id = ""
  # type   = "t2.nano"

  key_name = "nalbam-seoul"

  allow_ip_address = [
    "106.244.127.5/32", # echo "$(curl -sL icanhazip.com)/32"
  ]
}

output "name" {
  value = module.bastion.name
}

output "key_name" {
  value = module.bastion.key_name
}

output "public_ip" {
  value = module.bastion.public_ip
}
