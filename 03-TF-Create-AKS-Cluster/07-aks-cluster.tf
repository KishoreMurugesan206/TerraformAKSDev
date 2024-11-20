# Provision AKS Cluster
/*
1. Add Basic Cluster Settings
  - Get Latest Kubernetes Version from datasource (kubernetes_version)
  - Add Node Resource Group (node_resource_group)
2. Add Default Node Pool Settings
  - orchestrator_version (latest kubernetes version using datasource)
  - availability_zones
  - enable_auto_scaling
  - max_count, min_count
  - os_disk_size_gb
  - type
  - node_labels
  - tags
3. Enable MSI
4. Add On Profiles 
  - Azure Policy
  - Azure Monitor (Reference Log Analytics Workspace id)
5. RBAC & Azure AD Integration
6. Admin Profiles
  - Windows Admin Profile
  - Linux Profile
7. Network Profile
8. Cluster Tags  
*/

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "${azurerm_resource_group.aks-rg1.name}-cluster"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "${azurerm_resource_group.aks-rg1.name}-cluster"
  kubernetes_version = data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group = "${azurerm_resource_group.aks-rg1.name}-nrg"

  default_node_pool {
    name       = "systempool"
    # node_count = 1
    vm_size    = "Standard_DS2_v2"
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    availability_zones = 
    enable_auto_scaling = true
    max_count = 3
    min_count = 1
    os_disk_size_gb = 30
    type = "VirtualMachineScaleSets"
    node_labels = {
        "nodepool" = "system"
        "environment" = "dev"
        "nodepools" = "linux"
        "app" = "system-apps"
    }
    tags = {
        "nodepool" = "system"
        "environment" = "dev"
        "nodepools" = "linux"
        "app" = "system-apps"
        }
  }

  identity {
    type = "SystemAssigned"
  }

# Add on Profiles
  add_profile {
    azure_policy {enabled = true}
    oms_agent {
        enabled = true
        log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics_workspace.id
    }
  }
  
# RBAC and Azure AD Integration Block
  
  


  tags = {
    Environment = "dev"
  }
}