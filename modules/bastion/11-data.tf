# data

data "aws_availability_zones" "azs" {}

data "template_file" "setup" {
  template = "${file("${path.module}/files/setup.sh")}"

  vars {
    HOSTNAME = "${local.lower_name}"
  }
}
