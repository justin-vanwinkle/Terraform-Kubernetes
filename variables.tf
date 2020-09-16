variable "resource_group_name" {
  type    = string
  default = "rg-aks-eastus-prod"
}
variable "location" {
  type    = string
  default = "eastus"
}
variable "cluster_name" {
  type    = string
  default = "aks-eastus-prod"
}
variable "dns_prefix" {
  type    = string
  default = "selfhub"
}

variable "node_pool_name" {
  type    = string
  default = "default"
}
variable "min_node_count" {
  type    = number
  default = 1
}
variable "max_node_count" {
  type    = number
  default = 2
}
variable "node_pool_vm_size" {
  type    = string
  default = "Standard_B2s"
}

variable "tags" {
  type = map
  default = {
    "Environment" : "Production"
  }
}