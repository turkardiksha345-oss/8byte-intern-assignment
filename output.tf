# Output EC2 Public IP

output "ec2_public_ip" {
  value = aws_instance.app_ec2.public_ip
}
