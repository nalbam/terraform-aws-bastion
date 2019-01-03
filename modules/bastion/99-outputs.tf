// Output some useful variables for quick SSH access etc.

output "name" {
  value = "${var.city}-${var.stage}-${var.name}-${var.suffix}"
}

output "domain" {
  value = "${element(concat(aws_route53_record.default.*.name, list("")), 0)}"
}

output "public_ip" {
  value = "${aws_eip.default.public_ip}"
}

output "vpc_id" {
  value = "${data.aws_vpc.default.id}"
}

output "subnet_ids" {
  value = "${aws_subnet.default.*.id}"
}
