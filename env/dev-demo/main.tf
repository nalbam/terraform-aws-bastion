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
  region = "ap-northeast-2"
}

module "bastion" {
  source = "../../modules/bastion"

  region = "ap-northeast-2"
  city   = "seoul"
  stage  = "dev"
  name   = "demo"
  suffix = "bastion"

  vpc_id = "vpc-00c644066e3a8d97d"

  subnet_id = "subnet-0c29ad66d2500c8a1"

  # ami_id = ""
  # type   = "t2.nano"

  key_name = "nalbam-seoul"

  allow_ip_address = [
    "1.1.1.1/32", # 강남 echo "$(curl -sL icanhazip.com)/32"
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
