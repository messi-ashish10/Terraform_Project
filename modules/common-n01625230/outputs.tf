output "log_analytics_workspace_name" {
  description = "The name of the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.n01625230_law.name
}

output "recovery_services_vault_name" {
  description = "The name of the Recovery Services Vault."
  value       = azurerm_recovery_services_vault.n01625230_rsv.name
}

output "storage_account_name" {
  description = "The name of the Storage Account."
  value       = azurerm_storage_account.n01625230_sa.name
}

output "storage_account_uri" {
  description = "The URI of the Storage Account."
  value       = azurerm_storage_account.n01625230_sa.primary_blob_endpoint
}
