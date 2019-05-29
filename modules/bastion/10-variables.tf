variable "region" {
  description = "The region to deploy the cluster in, e.g: us-east-1"
}

variable "city" {
  description = "City Name of the cluster, e.g: SEOUL"
}

variable "stage" {
  description = "Stage Name of the cluster, e.g: DEV"
}

variable "name" {
  description = "Name of the cluster, e.g: DEMO"
}

variable "suffix" {
  description = "Name of the cluster, e.g: BASTION"
}

variable "ami_id" {
  description = "AMI ID of the instance, e.g: ami-000000"
  default     = ""
}

variable "type" {
  description = "Type of the instance, e.g: t2.micro"
  default     = ""
}

variable "vpc_id" {
  description = "The VPC ID."
  default     = ""
}

variable "subnet_id" {
  description = "The Subnet ID."
  default     = ""
}

variable "az_zone" {
  description = "The AZ Zone."
  default     = "A"
}

variable "key_name" {
  description = "The name of the key to user for ssh access, e.g: demo"
  default     = ""
}

variable "public_key_path" {
  description = "The local public key path, e.g. ~/.ssh/id_rsa.pub"
  default     = ""
}

variable "base_domain" {
  description = "Base domain, e.g: opsnow.com"
  default     = ""
}

variable "allow_ip_address" {
  description = "List of IP Address to permit access"
  type        = list(string)
  default     = ["*"]
}

