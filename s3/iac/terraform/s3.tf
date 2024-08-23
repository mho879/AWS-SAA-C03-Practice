resource "aws_s3_bucket" "my-s3-bucket" {
  bucket = "my-tf-test-bucket-mho"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}