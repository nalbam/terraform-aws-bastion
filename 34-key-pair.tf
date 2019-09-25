# key pair

resource "aws_key_pair" "this" {
  count = var.key_path != "" ? 1 : 0

  key_name   = var.key_name != "" ? var.key_name : var.name
  public_key = file(var.key_path)
}
