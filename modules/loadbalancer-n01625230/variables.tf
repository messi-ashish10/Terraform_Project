variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "linux_vm_nic_ids" {
  description = "The IDs of the network interfaces of the Linux VMs."
  type        = list(string)
}

variable "common_tags" {
  description = "A map of common tags to apply to all resources."
  type        = map(string)
}
