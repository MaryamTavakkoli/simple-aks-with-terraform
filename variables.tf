variable "subscription_id" {
  type        = string
  description = "The Azure subscription ID."
  default = "c3e62f24-f4c9-469f-b924-a9bd4c7a72f7"
  
}
variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group" {
  type        = string
  default     = "simple-rg"
  description = "Resource group name."
}

variable "cluster_name" {
  type = string
  default = "simple-aks"
  description = "The name of the Kubernetes cluster."
}

variable "dns_prefix" {
  type        = string
  description = "The DNS prefix specified when creating the managed cluster."
  default     = "k8s" 
}

variable "node_count" {
  type        = number
  description = "The initial quantity of nodes for the node pool."
  default     = 1
}

variable "username" {
  type        = string
  description = "The admin username for the new cluster."
  default     = "ubuntu"
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network."
  default     = "simple-aks-vnet"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet."
  default     = "simple-aks-subnet"
}

variable "kubernetes_version" {
  type        = string
  description = "The version of Kubernetes."
  default     = "1.29" 
}

variable "auto_scaling_enabled" {
  type        = bool
  description = "Enable auto-scaling for the node pool."
  default     = false
}

variable "min_count" {
  type        = number
  description = "The minimum number of nodes for the node pool."
  default     = 1
}

variable "max_count" {
  type        = number
  description = "The maximum number of nodes for the node pool."
  default     = 3
}