variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "db_name" {
  description = "The name of the PostgreSQL database server."
  type        = string
}

variable "db_admin_username" {
  description = "The admin username for the PostgreSQL database."
  type        = string
}

variable "db_admin_password" {
  description = "The admin password for the PostgreSQL database."
  type        = string
  sensitive   = true
}

variable "common_tags" {
  description = "A map of common tags to apply to all resources."
  type        = map(string)
}
