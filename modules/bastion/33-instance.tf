data "template_file" "setup" {
  template = "${file("${path.module}/files/setup.sh")}"

  vars {
    HOSTNAME = "${local.lower_name}"
  }
}

resource "aws_key_pair" "this" {
  count      = "${var.public_key_path != "" ? 1 : 0}"
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}

resource "aws_instance" "this" {
  ami                  = "${var.ami_id != "" ? var.ami_id : data.aws_ami.this.id}"
  instance_type        = "${var.type != "" ? var.type : "t2.micro"}"
  subnet_id            = "${element(var.subnet_ids, var.subnet_index)}"
  iam_instance_profile = "${aws_iam_instance_profile.this.id}"
  user_data            = "${data.template_file.setup.rendered}"

  vpc_security_group_ids = [
    "${aws_security_group.this.id}",
  ]

  key_name = "${var.key_name}"

  tags = {
    Name = "${var.city}-${upper(element(split("", local.az_names[var.subnet_index]), (local.az_length - 1)))}-${local.name}-${var.suffix}"
  }
}

resource "aws_eip" "this" {
  instance = "${aws_instance.this.id}"

  vpc = true

  # depends_on = ["aws_route_table.public"]

  tags = {
    Name = "${var.city}-${upper(element(split("", local.az_names[var.subnet_index]), (local.az_length - 1)))}-${local.name}-${var.suffix}"
  }
}
