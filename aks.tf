terraform {
  required_version = ">= 0.13"
}

provider "azurerm" {
  features {
  
   }
  
}

data "azurerm_subnet" "akssubnet" {
  name                 = var.aks_subnet_name
  virtual_network_name = var.aks_vnet_name
  resource_group_name  = var.aks_vnet_resource_group_name
}

data "azurerm_resource_group" "aks_rg" {
  name = var.resource_group_name
}
data "azurerm_key_vault" "example" {
  name                = "example-keyvault12"
  resource_group_name = "example-resources"
}

data "azurerm_key_vault_key" "key" {
  provider = azurerm.hub
  name = local.secretKeyName
  key_vault_id = data.azurerm_key_vault.hubkv.id

}

resource "azurerm_disk_encryption_set" "example" {
  name                = "disc_encryptionaks"
  resource_group_name = data.azurerm_resource_group.aks_rg.name
  location            = data.azurerm_resource_group.aks_rg.location
  key_vault_key_id     = data.azurerm_key_vault.example.id
  # Add more encryption settings as needed

  identity {
    type = "SystemAssigned"
  }
}
resource "azurerm_log_analytics_workspace" "aks_workspace" {
  name                = var.workspace
  location            = data.azurerm_resource_group.aks_rg.location
  resource_group_name = data.azurerm_resource_group.aks_rg.name

}

resource "azurerm_kubernetes_cluster" "aks" {
  name                                = var.cluster_name
  kubernetes_version                  = var.kubernetes_version
  location                            = var.location
  resource_group_name                 = data.azurerm_resource_group.aks_rg.name
  dns_prefix                          = var.cluster_name
  private_cluster_enabled             = true
  http_application_routing_enabled    = false
  azure_policy_enabled                = true
  private_cluster_public_fqdn_enabled = var.private_cluster_public_fqdn_enabled

  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.aks_workspace.id
  }

  #disk_encryption_set_id = var.encryption_id

  default_node_pool {
    name                = var.node_pool_name
    node_count          = var.system_node_count
    vm_size             = var.vm_size
    type                = var.aks_node_pool_type
    enable_auto_scaling = var.enable_auto_scaling
    os_disk_size_gb     = var.os_disk_size_gb
    vnet_subnet_id      = data.azurerm_subnet.akssubnet.id
  }

  azure_active_directory_role_based_access_control {
    managed            = true
    azure_rbac_enabled = true
  }

  identity {
    type = var.identity_type
  }

  network_profile {
    network_plugin    = var.network_plugin
    load_balancer_sku = var.loadbalancer_sku
    network_policy    = var.network_policy
  }

  depends_on = [
    data.azurerm_subnet.akssubnet,
  ]
}

resource "azurerm_log_analytics_solution" "container_insights" {
  solution_name         = var.container_insights
  location              = data.azurerm_resource_group.aks_rg.location
  resource_group_name   = data.azurerm_resource_group.aks_rg.name
  workspace_resource_id = azurerm_log_analytics_workspace.aks_workspace.id
  workspace_name        = azurerm_log_analytics_workspace.aks_workspace.name

  plan {
    publisher = var.aks_publisher
    product   = var.aks_product
  }
}

