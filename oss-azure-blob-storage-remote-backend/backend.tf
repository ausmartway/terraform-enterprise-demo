terraform {
  backend "azurerm" {
      resource_group_name  = "tfstate"
      storage_account_name = "tfstatef41x6"
      container_name       = "tfstate"
      key                  = "oss-azure-blob-storage-remote-backend"
  }
}