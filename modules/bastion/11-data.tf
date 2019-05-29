# data

data "aws_availability_zones" "azs" {
}

data "template_file" "setup" {
  template = file("${path.module}/template/setup.sh")

  vars = {
    HOSTNAME = local.lower_name
  }
}

