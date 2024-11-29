# Create Azure AD Group in Active Directory for AKS Admins
/*
resource "azurerm_active_directory_group" "aks_admins" {
    name = "${azurerm_resource_group.aks_rg1.name}-cluster-administrators"
    description = "AKS Admin for the ${azurerm_resource_group.aks_rg1.name}-cluster"
}   
*/

data "azuread_client_config" "current" {}

resource "azuread_group" "aks_admins" {
    display_name = "${azurerm_resource_group.aks-rg1.id}-cluster-administrators"
    owners = [data.azuread_client_config.current.object_id]
    security_enabled = true    
}