resource "aws_instance" "ec2-ansible-server" {
  ami                  = data.aws_ami.ami-ubuntu22-server.id
  instance_type        = "t2.micro"
  key_name             = var.SSH_KEY_NAME
  subnet_id            = var.PUBLIC_SUBNET_A_ID
  user_data            = data.template_file.ansible-server-config.rendered
  iam_instance_profile = aws_iam_instance_profile.iam-instance-profile-ec2-ansible-server.name

  vpc_security_group_ids = [
    var.ALLOW_SSH_SG,    
    var.ALLOW_ICMP_SG
  ]

  tags = {
    Name = "Ansible-Server"
  }
  
  depends_on = [ 
    aws_s3_bucket.ansible-files,
    aws_s3_object.ansible-files-base-conf
  ]
}