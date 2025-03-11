variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "vm_names" {
  description = "A map of Linux VM names."
  type        = map(string)
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
  description = "The admin username for the Linux VMs."
  type        = string
}

variable "ssh_public_key" {
  description = "The SSH public key for Linux VM authentication."
  type        = string
}

variable "ssh_private_key" {
  description   = "The SSH Private key for Linux VM authentication."
  type		= string
}

variable "common_tags" {
  description = "A map of common tags to apply to all resources."
  type        = map(string)
}

variable "nsg_id" {
  description = "ID of the Network Security Group"
  type        = string
}
