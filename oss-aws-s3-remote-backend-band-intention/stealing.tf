data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "yulei-terraform-remote-state-storage-s3-demo"
    key    = "oss-aws-s3-remote-backend"
    region = "ap-southeast-2"
  }
}

