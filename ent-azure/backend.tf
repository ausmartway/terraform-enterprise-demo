terraform {
  cloud {
    organization = "yulei"
    hostname = "app.terraform.io" # Optional; defaults to app.terraform.io
    workspaces {
      tags = ["azure", "hashicat","customerfacing"]
    }
  }
}