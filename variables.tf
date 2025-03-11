# Resource Group
variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "n01625230-RG"
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
  default     = "East US"
}

# Networking
variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
  default     = "n01625230-VNET"
}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
  default     = "n01625230-SUBNET"
}

# Linux VMs
variable "linux_vm_names" {
  description = "A map of Linux VM names."
  type        = map(string)
  default     = {
    "vm1" = "n01625230-vm1",
    "vm2" = "n01625230-vm2",
    "vm3" = "n01625230-vm3"
  }
}

variable "linux_admin_username" {
  description = "The admin username for the Linux VMs."
  type        = string
  default     = "adminuser"
}

variable "ssh_public_key_path" {
  description = "The path to the SSH public key file for Linux VM authentication."
  type        = string
  default     = "~/.ssh/id_rsa.pub" 
}

variable "ssh_private_key_path" {
  description = "The path to the SSH private key file for connecting to Linux VMs."
  type        = string
  default     = "~/.ssh/id_rsa"  
  sensitive   = true
}

# Windows VM
variable "windows_vm_count" {
  description = "The number of Windows VMs to create."
  type        = number
  default     = 1
}

variable "windows_admin_username" {
  description = "The admin username for the Windows VM."
  type        = string
  default     = "adminuser"
}

variable "windows_admin_password" {
  description = "The admin password for the Windows VM."
  type        = string
  default     = "Password1234!"  # Replace with a secure password
  sensitive   = true
}

# Database
variable "db_name" {
  description = "The name of the PostgreSQL database server."
  type        = string
  default     = "n01625230-db"
}

variable "db_admin_username" {
  description = "The admin username for the PostgreSQL database."
  type        = string
  default     = "n01625230admin"
}

variable "db_admin_password" {
  description = "The admin password for the PostgreSQL database."
  type        = string
  default     = "Password1234!"  # Replace with a secure password
  sensitive   = true
}
