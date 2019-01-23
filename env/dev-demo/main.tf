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

  subnet_ids = [
    "subnet-0129594eaab11fe40",
    "subnet-02bb4b949fb9937e3",
  ]

  ami_id = ""
  type   = "t2.nano"

  key_name = "nalbam-seoul"

  base_domain = "nalbam.com"

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

output "domain" {
  value = "${module.bastion.domain}"
}

output "public_ip" {
  value = "${module.bastion.public_ip}"
}
