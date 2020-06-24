resource "aws_s3_bucket" "kaique-bucket" {
  bucket = "kaique-bucket"
  acl    = "private"

  tags = {
    Name        = "kaique-bucket"
    Environment = "dev"
  }
}

# adding jenkins config
resource "aws_s3_bucket_object" "config-jenkins-xml" {
  bucket = aws_s3_bucket.kaique-bucket.id
  key    = "static/config.xml"
  source = "static/config.xml"
}