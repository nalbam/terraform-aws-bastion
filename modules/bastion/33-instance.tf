resource "aws_key_pair" "this" {
  count      = var.public_key_path != "" ? 1 : 0
  key_name   = local.key_name
  public_key = file(var.public_key_path)
}

resource "aws_instance" "this" {
  ami                  = var.ami_id != "" ? var.ami_id : data.aws_ami.this.id
  instance_type        = var.type
  subnet_id            = var.subnet_id
  iam_instance_profile = aws_iam_instance_profile.this.id
  user_data            = data.template_file.setup.rendered

  vpc_security_group_ids = [
    aws_security_group.this.id,
  ]

  key_name = local.key_name

  tags = {
    Name = local.full_name
    Type = "bastion"
  }
}

resource "aws_eip" "this" {
  instance = aws_instance.this.id

  vpc = true

  tags = {
    Name = local.full_name
  }
}
