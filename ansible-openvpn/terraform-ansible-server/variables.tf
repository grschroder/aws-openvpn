variable "AWS_REGION" {
  description = "The AWS region"
  default     = "us-east-1"
}

variable "AWS_ACCESS_KEY" {
  description = "The AWS access"
  default     = "access-key"
}

variable "AWS_SECRET_KEY" {
  description = "The AWS secret key"
  default     = "key"
}

variable "VPC_ID" {
  description = "VPC ID to deploy the OpenVPN server"

}

variable "ALLOW_SSH_SG" {
  description = "Allow SSH connection security group ID"
}

variable "SSH_KEY_NAME" {
  description = "SSH key name"
  
}

variable "PUBLIC_SUBNET_A_ID" {
  description = "Public subnet A ID"
  
}

variable "ALLOW_ICMP_SG" {
  description = "Allow ICMP connection security group ID"
  
}