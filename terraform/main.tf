provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "aks-demo-rg"
  location = "Central India"
}

# AKS Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-demo-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aksdemo"

  default_node_pool {
    name       = "nodepool1"
    node_count = 2
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Demo"
  }
}