terraform {
 backend "azurerm" {
   resource_group_name = "blog"
   storage_account_name = "stkubernet"
   container_name       = "tfstate"
   key                  = "aks.tfstate"
 }
 required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.55.0"
    }
  }
}

provider "azurerm" {
  features {}
}