resource "aws_instance" "ec2-openvpn-server" {
  ami               = data.aws_ami.ami-ubuntu22-server.id
  instance_type     = "t2.micro"
  key_name          = var.SSH_KEY_NAME
  subnet_id         = aws_subnet.public-openvpn-subnet-a.id
  user_data         = data.template_file.openvpn-server-config.rendered
  source_dest_check = false

  vpc_security_group_ids = [
    var.ALLOW_SSH_SG,
    aws_security_group.allow-openvpn-connection.id,
    aws_security_group.allow-icmp.id
  ]

  tags = {
    Name = "OpenVPN-Server"
  }
  

}