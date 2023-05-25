terraform {
  backend "s3" {
    bucket = "yulei-terraform-remote-state-storage-s3-demo"
    key    = "oss-github-actions-remote-backend"
    region = "ap-southeast-2"
  }
}