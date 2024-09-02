#terraform {
#  required_version = ">= 0.14"
#
#  required_providers {
#    azurerm = {
#      source  = "hashicorp/azurerm"
#      version = ">= 2.0"
#    }
#  }
#  backend "azurerm" {
#    resource_group_name = "teraformDemo"
#    storage_account_name = "tfstract"
#    container_name = "tfcontainer"
#    key="teraform.tfstate"
#  }
#}
provider "azurerm" {
  features {}
  tenant_id = "00f80d0c-aac1-4ef7-b535-18de0600df3c"
  client_id = "6a43fd50-a2f8-4970-a6a5-096de1fb3cc2"
  client_secret = "Ess8Q~6UcWfsqQf2VmT~z3CMEAeNSBPjPG0S3bVK"
  subscription_id = "b6ab4036-6f78-4352-8509-74b8f3e9eef2"
}

resource "azurerm_resource_group" "rgsa" {
  name     = "aks-resource-group"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-cluster"
  location            = azurerm_resource_group.rgsa.location
  resource_group_name = azurerm_resource_group.rgsa.name
  dns_prefix          = "akscluster"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Development"
  }
}

output "kubeconfig" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
