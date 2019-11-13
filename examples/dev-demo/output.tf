# output

output "id" {
  value = module.bastion.id
}

output "key_name" {
  value = module.bastion.key_name
}

output "private_ip" {
  value = module.bastion.private_ip
}

output "public_ip" {
  value = module.bastion.public_ip
}
