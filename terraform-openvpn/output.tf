output "ec2-openvpn-server-public-ip" {
  description = "Public IP address of the EC2 OpenVPN server"
  value       = aws_instance.ec2-openvpn-server.public_ip
}

output "ec2-serverclient-private-ip" {
  description = "Private IP address of the EC2 ServerClient"
  value       = aws_instance.ec2-serverclient.private_ip
}

output ec2-openvpn-server-private-ip {
  description = "Private IP address of the EC2 OpenVPN server"
  value       = aws_instance.ec2-openvpn-server.private_ip
}

output sg-allow-icmp-id {
  description = "ID of the security group that allows ICMP"
  value       = aws_security_group.allow-icmp.id
}

output "eip-openvpn-server" {
  description = "Elastic IP address of the EC2 OpenVPN server"
  value       = aws_eip.eip-openvpn-server.public_ip
  
}