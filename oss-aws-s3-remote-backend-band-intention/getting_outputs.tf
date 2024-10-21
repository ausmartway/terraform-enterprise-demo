#below data can read all outputs from a terraform statefile that is stored in the same s3 bucket. Change the value of "key" to the name of the terraform statefile you want to read outputs from.
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "yulei-terraform-remote-state-storage-s3-demo"
    key    = "oss-aws-s3-remote-backend"
    region = "ap-southeast-2"
  }
}

