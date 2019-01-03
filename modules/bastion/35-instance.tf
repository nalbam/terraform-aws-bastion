data "template_file" "setup" {
  template = "${file("${path.module}/files/setup.sh")}"

  vars {
    HOSTNAME = "${lower(local.simple_name)}"
  }
}

resource "aws_key_pair" "default" {
  count      = "${var.public_key_path != "" ? 1 : 0}"
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}

resource "aws_instance" "default" {
  ami                     = "${var.ami_id != "" ? var.ami_id : data.aws_ami.default.id}"
  instance_type           = "${var.type != "" ? var.type : "t2.micro"}"
  subnet_id               = "${element(aws_subnet.default.*.id, 0)}"
  iam_instance_profile    = "${aws_iam_instance_profile.default.id}"
  user_data               = "${data.template_file.setup.rendered}"

  vpc_security_group_ids = [
    "${aws_security_group.vpc.id}",
    "${aws_security_group.egress.id}",
    "${aws_security_group.ingress.id}",
  ]

  key_name = "${var.key_name}"

  tags = {
    Name = "${var.city}-${upper(element(split("", data.aws_availability_zones.azs.names[count.index]), length(data.aws_availability_zones.azs.names[count.index])-1))}-${local.name}-${var.suffix}"
  }
}

resource "aws_eip" "default" {
  instance   = "${aws_instance.default.id}"
  vpc        = true
  depends_on = ["aws_route_table.default"]

  tags = {
    Name = "${var.city}-${upper(element(split("", data.aws_availability_zones.azs.names[count.index]), length(data.aws_availability_zones.azs.names[count.index])-1))}-${local.name}-${var.suffix}"
  }
}
