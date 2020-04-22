# output

output "id" {
  value = aws_instance.this.id
}

output "key_name" {
  value = aws_instance.this.key_name
}

output "private_ip" {
  value = aws_instance.this.private_ip
}

output "public_ip" {
  value = aws_eip.this.public_ip
}

output "security_group_id" {
  value = aws_security_group.this.id
}
