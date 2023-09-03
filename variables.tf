# variable "azure_client_id" {
#   default = " "
# }
# variable "azure_client_secret" {
#   default = " "
# }
# variable "azure_tenant_id" {
#   default = " "
# }
# variable "azure_subscription_id" {
#   default = " "
# }
variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
  default     = "rg12"
}
variable "location" {
  type        = string
  description = "Resources location in Azure"
  default     = "WestUS"
}
variable "cluster_name" {
  type        = string
  description = "AKS name in Azure"
  default     = "rg-aks"
}
variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
  default     = "1.25.5"
}
variable "system_node_count" {
  type        = number
  description = "Number of AKS worker nodes"
  default     = 1
}

variable "vm_size" {
  type        = string
  description = "size of node pool"
  default     = "Standard_DS2_v2"
}

variable "node_pool_name" {
  type        = string
  description = "node pool name"
  default     = "dctvm"

}
# variable "tags" {
#   type = map(any)
#   }

variable "enable_auto_scaling" {
  type        = string
  description = "auto scaling node pool"
  default     = "false"

}
variable "aks_node_pool_type" {
  type        = string
  description = "aks_node_pool"
  default     = "VirtualMachineScaleSets"
}

variable "os_disk_size_gb" {
  type        = number
  description = "disk size in GB"
  default     = 30

}

variable "network_plugin" {
  type        = string
  description = "Network plugin "
  default     = "azure"

}
variable "network_policy" {
  type        = string
  description = "azure network policy "
  default     = "azure"

}
variable "loadbalancer_sku" {
  type        = string
  description = "specified loadbalancer sku type"
  default     = "standard"

}
variable "identity_type" {
  type        = string
  description = "identity type"
  default     = "SystemAssigned"

}
variable "workspace" {
  type        = string
  description = "The full name of the Log Analytics workspace with which the solution will be linked."
  default     = "aks-workspace"

}
variable "container_insights" {
  type        = string
  description = "name of the log analytics solution "
  default     = "AksContainerInsights"

}
variable "aks_publisher" {
  type        = string
  description = "The publisher of the solution.For example Microsoft.Changing this forces a new resource to be created."
  default     = "Microsoft"

}
variable "aks_product" {
  type        = string
  description = "The product name of the solution.For example OMSGallery/Containers.Changing this forces a new resource to be created."
  default     = "aksContainerInsights"

}

variable "aks_subnet_name" {
  description = "Name of AKS Subnet."
  type        = string
}

variable "aks_vnet_name" {
  description = "Name of AKS VNet."
  type        = string
}

variable "aks_vnet_resource_group_name" {
  description = "Name of the AKS Vnet resource group."
  type        = string
}

# variable "aks_admin_group_object_ids" {
#   description = "aks admin group ids"
#   type        = list(string)
# }

variable "private_cluster_public_fqdn_enabled" {
  type        = bool
  description = "Disable a public FQDN on a new AKS cluster"
  default     = false
}

# variable "application_gateway_name" {
#   type        = string
#   description = "name of the application gateway needs to be attached with aks"
# }

# variable "application_gateway_subnet_name" {
#   type        = string
#   description = "name of the subnet where application gateway resides"
# }

