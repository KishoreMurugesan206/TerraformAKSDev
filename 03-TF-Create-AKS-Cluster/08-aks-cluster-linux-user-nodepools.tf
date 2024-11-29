# Create Linux User Node pool
resource "azurerm_kubernetes_cluster_node_pool" "linux01" {
  zones = [ 1, 2, 3 ]
  auto_scaling_enabled = true
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  max_count = 3
  min_count = 1
  mode = "User"
  name = "linux01"
  orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
  vm_size               = "Standard_DS2_v2"
  os_disk_size_gb       = 30
  os_type               = "Linux"
  priority = "Regular"
  node_labels = {
    "nodepool-type" = "user"
    "environment" = var.environment
    "nodepools" = "linux"
  }
  
  tags = {
    "nodepool-type" = "user"
    "environment" = var.environment
    "nodepools" = "linux"
  }
}