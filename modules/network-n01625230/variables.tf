variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}

variable "common_tags" {
  description = "A map of common tags to apply to all resources."
  type        = map(string)
}

