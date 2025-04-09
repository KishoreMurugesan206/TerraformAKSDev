terraform {
    required_providers{
        azurerm = {
            source = "hashicorp/azurerm"
            version = "${AZURERM}"
        }
        random = {
            source = "hashicorp/random"
            version = "${RANDOM}"
        }
    }
    backend "azurerm" {}
}


# 2. Terraform Provider Block for AzureRM

provider "azurerm" {
    subscription_id = "cd3f1171-3766-4a29-a798-63f025df8f5d"
    features {

    } 
}
# 3. Terraform Resource Block: Define a Random Pet Resource
resource "random_pet" "aksrandom" {
  
}