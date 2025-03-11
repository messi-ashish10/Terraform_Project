variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "vm_count" {
  description = "The number of Windows VMs to create."
  type        = number
}

variable "subnet_id" {
  description = "The ID of the subnet."
  type        = string
}

variable "storage_account_uri" {
  description = "The URI of the storage account for boot diagnostics."
  type        = string
}

variable "admin_username" {
  description = "The admin username for the Windows VM."
  type        = string
}

variable "admin_password" {
  description = "The admin password for the Windows VM."
  type        = string
  sensitive   = true
}

variable "common_tags" {
  description = "A map of common tags to apply to all resources."
  type        = map(string)
}
