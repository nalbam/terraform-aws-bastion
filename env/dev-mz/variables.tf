variable "region" {
  default = "ap-northeast-2"
}

variable "city" {
  default = "seoul"
}

variable "stage" {
  default = "dev"
}

variable "name" {
  default = "demo"
}

variable "suffix" {
  default = "bastion"
}

variable "vpc_id" {
  default = "vpc-025ad1e9d1cb3c27d"
}

variable "subnet_ids" {
  default = [
    "subnet-007a2bd91c7939e85",
    "subnet-0477597c240b95aa8",
    "subnet-0c91c5cd95b319b76",
  ]
}

locals {
  full_name = "${var.city}-${var.stage}-${var.name}-${var.suffix}"
}
