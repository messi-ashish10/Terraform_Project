terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01625230RG"
    storage_account_name = "tfstaten01625230sa"
    container_name       = "tfstatefiles"
    key                  = "assignment1.tfstate"
  }
}
