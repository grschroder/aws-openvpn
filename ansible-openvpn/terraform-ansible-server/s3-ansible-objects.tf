resource "aws_s3_object" "ansible-files-base-conf" {
  bucket = aws_s3_bucket.ansible-files.bucket
  key    = "base.conf"
  source = "../ansible-files/base.conf"

  etag = filemd5("../ansible-files/base.conf")
}

resource "aws_s3_object" "ansible-files-add-client-playbook" {
  bucket = aws_s3_bucket.ansible-files.bucket
  key    = "add-client.yml"
  source = "../ansible-files/add-client.yml"

  etag = filemd5("../ansible-files/add-client.yml")
}

resource "aws_s3_object" "ansible-files-make_config-script" {
  bucket = aws_s3_bucket.ansible-files.bucket
  key    = "make_config.sh"
  source = "../ansible-files/make_config.sh"

  etag = filemd5("../ansible-files/make_config.sh")
}

resource "aws_s3_object" "ansible-files-config-server-playbook" {
  bucket = aws_s3_bucket.ansible-files.bucket
  key    = "config-server.yml"
  source = "../ansible-files/config-server.yml"

  etag = filemd5("../ansible-files/config-server.yml")
}

resource "aws_s3_object" "ansible-files-config-inventory-playbook" {
  bucket = aws_s3_bucket.ansible-files.bucket
  key    = "config-inventory.yml"
  source = "../ansible-files/config-inventory.yml"

  etag = filemd5("../ansible-files/config-inventory.yml")
}

resource "aws_s3_object" "ansible-files-add-subnet-playbook" {
  bucket = aws_s3_bucket.ansible-files.bucket
  key    = "add-subnet.yml"
  source = "../ansible-files/add-subnet.yml"

  etag = filemd5("../ansible-files/add-subnet.yml")
}

resource "aws_s3_object" "ansible-files-remove-client-playbook" {
  bucket = aws_s3_bucket.ansible-files.bucket
  key    = "remove-client.yml"
  source = "../ansible-files/remove-client.yml"

  etag = filemd5("../ansible-files/remove-client.yml")
}