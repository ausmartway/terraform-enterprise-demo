##Add your terraform core and provider version constrains here.
terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.41.0"
    }
  }

}
