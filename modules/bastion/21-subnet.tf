// Create a route table allowing.
resource "aws_route_table" "default" {
  vpc_id = "${data.aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${data.aws_internet_gateway.default.id}"
  }

  tags = {
    Name = "${local.full_name}"
  }
}

// Create a Subnet.
resource "aws_subnet" "default" {
  count = "${local.az_count}"

  vpc_id = "${data.aws_vpc.default.id}"

  cidr_block = "${cidrsubnet(data.aws_vpc.default.cidr_block, 8, var.subnets + count.index)}"
  availability_zone = "${data.aws_availability_zones.azs.names[count.index]}"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.city}-${upper(element(split("", data.aws_availability_zones.azs.names[count.index]), length(data.aws_availability_zones.azs.names[count.index])-1))}-${local.name}-${var.suffix}"
  }
}

// Now associate the route table with the default subnet
// - giving all default subnet instances access to the internet.
resource "aws_route_table_association" "default" {
  count = "${local.az_count}"
  subnet_id = "${element(aws_subnet.default.*.id, count.index)}"
  route_table_id = "${aws_route_table.default.id}"
}
