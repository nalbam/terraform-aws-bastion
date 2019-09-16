variable "region" {
  default = "ap-northeast-2"
}

variable "name" {
  default = "seoul-dev-demo-bastion"
}

variable "vpc_id" {
  default = "vpc-075279b4e48b983ff"
}

variable "subnet_id" {
  default = "subnet-08a5b599722126606"
}

variable "administrator" {
  default = true
}

variable "allow_ip_address" {
  type = list(string)
  default = [
    "221.148.35.250/32", # echo "$(curl -sL icanhazip.com)/32"
  ]
}

variable "key_name" {
  default = "nalbam-seoul"
}

locals {
  full_name = "${var.city}-${var.stage}-${var.name}-${var.suffix}"
}

data "template_file" "setup" {
  template = file("template/setup.sh")

  vars = {
    HOSTNAME = local.full_name
  }
}
