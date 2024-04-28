resource "aws_s3_bucket" "kk-bucket-create-2" {
  bucket = "kk-bucket-create-2"
  tags = {
    Name        = "kk-bucket-create-2"
    Environment = "Demo"
  }

}