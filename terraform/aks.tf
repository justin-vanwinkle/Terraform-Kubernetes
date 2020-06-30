resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = var.node_pool_name
    min_count   = var.min_node_count
    max_count   = var.max_node_count
    vm_size    = var.node_pool_vm_size
    enable_auto_scaling = true
  }

  role_based_access_control {
    enabled = true
  }
  
  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}