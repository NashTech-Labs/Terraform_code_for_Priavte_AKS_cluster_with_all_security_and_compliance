output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "http_application_routing_enabled" {
  value = azurerm_kubernetes_cluster.aks.http_application_routing_zone_name
}

output "identitytype" {
  value = azurerm_kubernetes_cluster.aks.identity
}

output "networkprofile" {
  value = azurerm_kubernetes_cluster.aks.network_profile
}

output "private_cluster_enabled" {
  value = azurerm_kubernetes_cluster.aks.private_cluster_enabled
}

output "role_based_access_control_enabled" {
  value = azurerm_kubernetes_cluster.aks.role_based_access_control_enabled
}
output "azurerm_log_analytics_workspace" {
  value = azurerm_log_analytics_workspace.aks_workspace.name
}
output "azurerm_log_analytics_solution" {
  value = azurerm_log_analytics_solution.container_insights.solution_name
}


resource "local_file" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.aks]
  filename   = "kubeconfig"
  content    = azurerm_kubernetes_cluster.aks.kube_config_raw
}

