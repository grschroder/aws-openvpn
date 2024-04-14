resource "aws_iam_role" "iam-role-ec2-ansible-server" {
  name = "iam-role-ec2-ansible-server"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "iam-role-attachment-ec2-ansible-server" {
  role       = aws_iam_role.iam-role-ec2-ansible-server.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_instance_profile" "iam-instance-profile-ec2-ansible-server" {
  name = "iam-instance-profile-ec2-ansible-server"
  role = aws_iam_role.iam-role-ec2-ansible-server.name
}