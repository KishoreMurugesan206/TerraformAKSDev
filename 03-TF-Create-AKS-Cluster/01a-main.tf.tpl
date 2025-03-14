terraform {
    required_providers{
        azurerm = {
            source = "hashicorp/azurerm"
            version = "${azurerm_version}
        }
        random = {
            source = "hashicorp/random"
            version = "${random_version}
        }
    }
}

provider "azurerm" {
    features{}
}