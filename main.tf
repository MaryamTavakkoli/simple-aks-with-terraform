resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = var.resource_group
}

resource "azurerm_virtual_network" "simple-aks-vnet" {
  address_space       = ["10.52.0.0/24"]
  location            = azurerm_resource_group.rg.location
  name                = var.virtual_network_name
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "simple-aks-subnet" {
  address_prefixes                               = ["10.52.0.0/24"]
  name                                           = var.subnet_name
  resource_group_name                            = local.resource_group.name
  virtual_network_name                           = azurerm_virtual_network.simple-aks-vnet.name
}

resource "azurerm_kubernetes_cluster" "k8s" {
  location            = azurerm_resource_group.rg.location
  name                = var.cluster_name
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name           = "agentpool"
    vm_size        = "Standard_B2pls_v2"
    node_count     = var.node_count
    vnet_subnet_id = azurerm_subnet.simple-aks-subnet.id
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }
}