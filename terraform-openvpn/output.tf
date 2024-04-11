output "ec2-openvpn-server-public-ip" {
  description = "Public IP address of the EC2 OpenVPN server"
  value       = aws_instance.ec2-openvpn-server.public_ip
}

output "ec2-serverclient-private-ip" {
  description = "Private IP address of the EC2 ServerClient"
  value       = aws_instance.ec2-serverclient.private_ip
}