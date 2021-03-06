resource "azurerm_kubernetes_cluster_node_pool" "spot" {
  name                  = "spot"
  priority              = "Spot"
  eviction_policy       = "Delete"
  spot_max_price        = 1
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = "Standard_D2_V4"
  node_count            = 1
}