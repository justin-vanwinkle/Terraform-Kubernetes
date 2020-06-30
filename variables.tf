variable "resource_group_name" {
  type    = string
  default = "rg-my-aks"
}
variable "location" {
  type    = string
  default = "eastus"
}
variable "cluster_name" {
  type    = string
  default = "aks-my-cluster"
}
variable "dns_prefix" {
  type    = string
  default = "myaksdns"
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
  default = "Standard_D2_v2"
}

variable "tags" {
  type = map
  default = {
    "Environment" : "Production"
  }
}