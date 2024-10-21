data "aws_s3_object" "entire_statefile" {
  bucket = "yulei-terraform-remote-state-storage-s3-demo"
  key    = "oss-aws-s3-remote-backend"
}
