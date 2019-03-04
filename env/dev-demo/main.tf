# bastion

terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket = "terraform-nalbam-seoul"
    key    = "bastion.tfstate"
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

  vpc_id = "vpc-061dc55df85dea9f1"

  subnet_id = "subnet-0129594eaab11fe40"

  # ami_id = ""
  type = "t2.nano"

  key_name = "nalbam-seoul"

  allow_ip_address = [
    "58.151.93.9/32", # 강남 echo "$(curl -sL icanhazip.com)/32"
  ]
}

output "name" {
  value = "${module.bastion.name}"
}

output "key_name" {
  value = "${module.bastion.key_name}"
}

output "public_ip" {
  value = "${module.bastion.public_ip}"
}