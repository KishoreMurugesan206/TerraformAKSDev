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



backend "azurerm" {
    resource_group_name = "terraform-storage-rg"
    storage_account_name = "tfstateaks01"
    container_name = "tfstatefiles"
    key = "terraform.tfstate"
  }
}

# 2. Terraform Provider Block for AzureRM

provider "azurerm" {
    subscription_id = "d8833827-93d1-4ee9-b65f-56278fc7ddca"
    features {

    } 
}
# 3. Terraform Resource Block: Define a Random Pet Resource
resource "random_pet" "aksrandom" {
  
}