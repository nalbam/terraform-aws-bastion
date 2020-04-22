# variable

variable "region" {
  default = "ap-northeast-2"
}

variable "name" {
  default = "dev-demo-bastion"
}

variable "administrator" {
  default = true
}

variable "allow_ip_address" {
  type = list(string)
  default = [
    "0.0.0.0/0",
    # "106.244.127.8/32", # echo "$(curl -sL icanhazip.com)/32"
  ]
}

variable "key_name" {
  default = "nalbam-seoul"
}

data "template_file" "setup" {
  template = file("template/setup.sh")

  vars = {
    HOSTNAME = var.name
  }
}
