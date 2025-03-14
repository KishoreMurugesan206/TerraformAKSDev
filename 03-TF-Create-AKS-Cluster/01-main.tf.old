# We will define 
# 1. Terraform Settings Block
    # 1. Required Version Terraform
    # 2. Required Terraform Providers
    # 3. Terraform Remote State Storage with Azure Storage Account (last step of this section)
# 2. Terraform Provider Block for AzureRM
# 3. Terraform Resource Block: Define a Random Pet Resource

# 1. Terraform Settings Block
terraform {
    # 1. Required Version Terraform 
    required_version = ">= 1.1.0"
    # 2. Required Terraform Providers
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = ">= 4.0.0"
            }
        azuread = {
            source  = "hashicorp/azuread"
            version = ">= 3.0.0"
        }
        random = {
            source  = "hashicorp/random"
            version = ">= 3.0.0"
        }
    }
    # 3. Terraform Remote State Storage with Azure Storage Account
    backend "azurerm" {
      resource_group_name = "terraform-storage-rg"
      storage_account_name = "tfstateaks01"
      container_name = "tfstatefiles"
      key = "terraform.tfstate"
    }
}

# 2. Terraform Provider Block for AzureRM

provider "azurerm" {
    subscription_id = "3a194d6c-2d4d-42d4-b1c5-7ffcf8788cfc"
    features {

    } 
}
# 3. Terraform Resource Block: Define a Random Pet Resource
resource "random_pet" "aksrandom" {
  
}