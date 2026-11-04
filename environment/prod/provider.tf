terraform {
   required_providers {
     azurerm = {
        source = "hashicorp/azurerm"
        version = "5.2.0"
     }
   }
   backend "azurerm" {
    resource_group_name = "Axoin_system12"
    storage_account_name = "kuldeepkastorage123"
    container_name = "kuldeep"
    key = "kuldeep.tfstate"
   }
}

provider "azurerm" {
    features {}
}