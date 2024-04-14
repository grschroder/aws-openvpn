output "ec2-ansible-server-public-ip" {
  description = "Public IP address of the EC2 OpenVPN server"
  value       = aws_instance.ec2-ansible-server.public_ip
}
