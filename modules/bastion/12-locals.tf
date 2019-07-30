# locals

locals {
  full_name = "${var.city}-${var.stage}-${var.name}-${var.suffix}"

  key_name = var.key_name == "" ? local.full_name : var.key_name
}
