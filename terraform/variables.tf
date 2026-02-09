variable "region" {
  description = "AWS region"
  type        = string
}

variable "instance_type" {
  description = "Instance Type "
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

