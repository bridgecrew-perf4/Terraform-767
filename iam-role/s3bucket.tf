resource "aws_s3_bucket" "ozw_s3bucket" {
  bucket = "ozw_s3bucket-20210222"
  acl    = "private"

  tags = {
    Name = "ozw_s3bucket-20210222"
  }
}
