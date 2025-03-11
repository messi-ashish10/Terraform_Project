variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "The name of the Log Analytics Workspace."
  type        = string
}

variable "recovery_services_vault_name" {
  description = "The name of the Recovery Services Vault."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the Storage Account."
  type        = string
}

variable "common_tags" {
  description = "A map of common tags to apply to all resources."
  type        = map(string)
}
