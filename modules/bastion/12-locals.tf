# locals

locals {
  name = "${var.city}-${var.stage}-${var.name}-${var.suffix}"

  upper_name = upper(local.name)

  lower_name = lower(local.name)

  key_name = var.key_name == "" ? local.upper_name : var.key_name
}

