# locals

locals {
  name = "${var.stage}-${var.name}"

  full_name = "${var.city}-${var.stage}-${var.name}-${var.suffix}"

  upper_name = "${upper(local.full_name)}"

  lower_name = "${lower(local.full_name)}"

  az_names = "${data.aws_availability_zones.azs.names}"

  az_length = "${length(data.aws_availability_zones.azs.names[0])}"
}
