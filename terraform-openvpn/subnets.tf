resource "aws_subnet" "public-openvpn-subnet-a" {
  vpc_id     = var.VPC_ID
  cidr_block = "10.0.20.0/24"
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "public-openvpn-subnet-a"
  }
}

resource "aws_subnet" "private-client-subnet-a" {
  vpc_id     = var.VPC_ID
  cidr_block = "10.0.21.0/24"  
  availability_zone = data.aws_availability_zones.available.names[0]


  tags = {
    Name = "private-client-subnet-a"
  }
}

resource "aws_route_table" "rt-private-client-subnet-a" {
  vpc_id = var.VPC_ID

  tags = {
    Name = "rt-private-client-subnet-a"
  }

}

resource "aws_route" "openvpn-route" {
    route_table_id         = aws_route_table.rt-private-client-subnet-a.id
    destination_cidr_block = "10.8.0.0/24"    
    network_interface_id   = aws_instance.ec2-openvpn-server.primary_network_interface_id
  
}

resource "aws_route_table_association" "priv-rtable-association-test-tf-a" {
  subnet_id      = aws_subnet.private-client-subnet-a.id
  route_table_id = aws_route_table.rt-private-client-subnet-a.id
  
}