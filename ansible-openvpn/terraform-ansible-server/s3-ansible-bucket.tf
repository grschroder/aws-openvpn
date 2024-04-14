resource "aws_s3_bucket" "ansible-files" {
  bucket = "openvpn-ansible-files-042024"

  tags = {
    Name = "openvpn-ansible-files-042024"
  }
}

resource "aws_s3_bucket_policy" "policy-openvpn-ansible-files" {
  bucket = aws_s3_bucket.ansible-files.bucket

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${aws_iam_role.iam-role-ec2-ansible-server.name}"
        },
        "Action": [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        "Resource": [
          "${aws_s3_bucket.ansible-files.arn}",
          "${aws_s3_bucket.ansible-files.arn}/*"
        ]
      }
    ]
  })

  depends_on = [ aws_s3_bucket.ansible-files ]

}