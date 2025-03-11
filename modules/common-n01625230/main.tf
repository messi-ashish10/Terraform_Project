# Create Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "n01625230_law" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = var.common_tags
}

# Create Recovery Services Vault
resource "azurerm_recovery_services_vault" "n01625230_rsv" {
  name                = var.recovery_services_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  tags = var.common_tags
}

# Create Storage Account
resource "azurerm_storage_account" "n01625230_sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.common_tags
}
