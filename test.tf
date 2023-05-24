provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

module "hashicat" {
  source  = "app.terraform.io/yulei/hashicat/azure"
  version = "0.0.16"
  prefix  = "yuleiliu"
}
