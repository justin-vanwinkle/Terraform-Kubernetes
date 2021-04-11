terraform {
 backend "azurerm" {
   resource_group_name = "blog"
   storage_account_name = "stkubernet"
   container_name       = "tfstate"
   key                  = "aks.tfstate"
 }
}

provider "azurerm" {
  version = "~> 2.16.0"
  features {}
}