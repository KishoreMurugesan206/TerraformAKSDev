# Create Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "insights" {
    name = "log-${azurerm_resource_group.aks-rg1.location}-prod01"
    location = azurerm_resource_group.aks-rg1.location
    resource_group_name = azurerm_resource_group.aks-rg1.name
    sku = "PerGB2018"
    retention_in_days = 30
}