resource_group_name                 = "aks_rg"
location                            = "centralus"
cluster_name                        = "aks-test"
kubernetes_version                  = "1.26.6"
system_node_count                   = 1
vm_size                             = "Standard_DS2_v2"
node_pool_name                      = "vm12"
enable_auto_scaling                 = false
aks_node_pool_type                  = "VirtualMachineScaleSets"
os_disk_size_gb                     = 30
network_plugin                      = "azure"
network_policy                      = "azure"
loadbalancer_sku                    = "standard"
identity_type                       = "SystemAssigned"
workspace                           = "aks-workspace"
container_insights                  = "AksContainerInsights"
aks_publisher                       = "Microsoft"
aks_product                         = "aksContainerInsights"
private_cluster_public_fqdn_enabled = false
aks_subnet_name                     = "aks1"
aks_vnet_name                       = "vnetiac1"
aks_vnet_resource_group_name        = "vnet-rg-iac"




