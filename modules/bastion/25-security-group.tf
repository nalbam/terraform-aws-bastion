resource "aws_security_group" "vpc" {
  name        = "${local.simple_name}-VPC"
  description = "Default security group that allows all instances in the VPC."
  vpc_id      = "${data.aws_vpc.default.id}"

  ingress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }

  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }

  tags = {
    Name = "${local.simple_name}-VPC"
  }
}

resource "aws_security_group" "egress" {
  name        = "${local.simple_name}-EGRESS"
  description = "Security group that allows egress."
  vpc_id      = "${data.aws_vpc.default.id}"

  // ALL
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.simple_name}-EGRESS"
  }
}

resource "aws_security_group" "ingress" {
  name        = "${local.simple_name}-INGRESS"
  description = "Security group that allows ingress."
  vpc_id      = "${data.aws_vpc.default.id}"

  // SSH
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.simple_name}-INGRESS"
  }
}
