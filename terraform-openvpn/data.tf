data "aws_ami" "ami-ubuntu22-server" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "template_file" "openvpn-server-config" {
  template = file("./openvpn-server-config.yaml")
  
}

data "aws_availability_zones" "available" {
  state = "available"
}