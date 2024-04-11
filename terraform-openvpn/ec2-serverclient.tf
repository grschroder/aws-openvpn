resource "aws_instance" "ec2-serverclient" {
  ami           = data.aws_ami.ami-ubuntu22-server.id
  instance_type = "t2.micro"
  key_name      = var.SSH_KEY_NAME
  subnet_id     = aws_subnet.private-client-subnet-a.id

  vpc_security_group_ids = [
    var.ALLOW_SSH_SG,
    aws_security_group.allow-icmp.id
  ]

  tags = {
    Name = "ServerClient"
  }
  

}