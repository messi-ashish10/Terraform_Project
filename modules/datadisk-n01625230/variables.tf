variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "vm_count" {
  description = "The total number of data disks to create."
  type        = number
}

variable "linux_vm_count" {
  description = "The number of Linux VMs."
  type        = number
}

variable "windows_vm_count" {
  description = "The number of Windows VMs."
  type        = number
}

variable "linux_vm_ids" {
  description = "The IDs of the Linux VMs."
  type        = list(string)
}

variable "windows_vm_ids" {
  description = "The IDs of the Windows VMs."
  type        = list(string)
}

variable "common_tags" {
  description = "A map of common tags to apply to all resources."
  type        = map(string)
}
