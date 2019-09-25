# output

output "name" {
  value = module.bastion.name
}

output "private_ip" {
  value = module.bastion.private_ip
}

output "public_ip" {
  value = module.bastion.public_ip
}
