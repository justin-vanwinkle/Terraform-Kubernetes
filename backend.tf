terraform {
  backend "azurerm" {
    storage_account_name = "sttfstate1"
    container_name       = "tfstate"
    key                  = "aks.tfstate"
  }
}