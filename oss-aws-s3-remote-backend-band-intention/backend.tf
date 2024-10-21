terraform {
  backend "s3" {
    bucket = "yulei-terraform-remote-state-storage-s3-demo"
    key    = "oss-aws-s3-remote-backend-bad-intention"
    region = "ap-southeast-2"
  }
}