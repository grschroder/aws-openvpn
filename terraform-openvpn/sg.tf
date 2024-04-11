resource "aws_security_group" "allow-openvpn-connection" {
  name        = "allow-openvpn-connection"
  description = "Allow OpenVPN inbound traffic"
  vpc_id      = var.VPC_ID

  ingress {
    description      = "OpenVPN from ALL"
    from_port        = 1194
    to_port          = 1194
    protocol         = "udp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-openvpn-connection"
  }
}

resource "aws_security_group" "allow-icmp" {
  name        = "allow-icmp"
  description = "Allow ICMP inbound traffic"
  vpc_id      = var.VPC_ID

  ingress {
    description      = "Allow ICMP from ALL" 
    to_port          = 0
    from_port        = 8
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 8
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-icmp"
  }
}