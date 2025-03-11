# Call the Resource Group Module
module "rgroup_n01625230" {
  source              = "./modules/rgroup-n01625230"
  resource_group_name = var.resource_group_name
  location            = var.location
  common_tags         = local.common_tags
}

# Call the Networking Module
module "network_n01625230" {
  source              = "./modules/network-n01625230"
  resource_group_name = module.rgroup_n01625230.resource_group_name
  location            = module.rgroup_n01625230.location
  vnet_name           = var.vnet_name

  subnet_name         = var.subnet_name
  common_tags         = local.common_tags
}

# Call the Common Services Module
module "common_n01625230" {
  source                      = "./modules/common-n01625230"
  resource_group_name         = module.rgroup_n01625230.resource_group_name
  location                    = module.rgroup_n01625230.location
  log_analytics_workspace_name = "n01625230-LAW"
  recovery_services_vault_name = "n01625230-RSV"
  storage_account_name        = "n01625230sa" # Must be globally unique
  common_tags         = local.common_tags
}

# Call the Linux VMs Module
module "vmlinux_n01625230" {
  source              = "./modules/vmlinux-n01625230"
  resource_group_name = module.rgroup_n01625230.resource_group_name
  location            = module.rgroup_n01625230.location
  vm_names            = var.linux_vm_names
  subnet_id           = module.network_n01625230.subnet_id
  nsg_id              = module.network_n01625230.nsg_id
  storage_account_uri = module.common_n01625230.storage_account_uri
  admin_username      = var.linux_admin_username
  ssh_public_key      = file(var.ssh_public_key_path)
  ssh_private_key     = file(var.ssh_private_key_path)
  common_tags         = local.common_tags
}

# Call the Windows VM Module
module "vmwindows_n01625230" {
  source              = "./modules/vmwindows-n01625230"
  resource_group_name = module.rgroup_n01625230.resource_group_name
  location            = module.rgroup_n01625230.location
  vm_count            = var.windows_vm_count
  subnet_id           = module.network_n01625230.subnet_id
  storage_account_uri = module.common_n01625230.storage_account_uri
  admin_username      = var.windows_admin_username
  admin_password      = var.windows_admin_password
  common_tags         = local.common_tags
}

# Call the Data Disks Module
module "datadisk_n01625230" {
  source              = "./modules/datadisk-n01625230"
  resource_group_name = module.rgroup_n01625230.resource_group_name
  location            = module.rgroup_n01625230.location
  vm_count            = 4 # Total number of data disks (3 for Linux VMs + 1 for Windows VM)
  linux_vm_count      = 3 # Number of Linux VMs
  windows_vm_count    = 1 # Number of Windows VMs
  linux_vm_ids        = [for vm in module.vmlinux_n01625230.linux_vm_ids : vm]
  windows_vm_ids      = [for vm in module.vmwindows_n01625230.windows_vm_ids : vm]
  common_tags         = local.common_tags
}

# Call the Load Balancer Module
module "loadbalancer_n01625230" {
  source              = "./modules/loadbalancer-n01625230"
  resource_group_name = module.rgroup_n01625230.resource_group_name
  location            = module.rgroup_n01625230.location
  linux_vm_nic_ids    = [for nic in module.vmlinux_n01625230.linux_vm_nic_ids : nic]
  common_tags         = local.common_tags
}

# Call the Database Module
module "database_n01625230" {
  source              = "./modules/database-n01625230"
  resource_group_name = module.rgroup_n01625230.resource_group_name
  location            = module.rgroup_n01625230.location
  db_name             = var.db_name
  db_admin_username   = var.db_admin_username
  db_admin_password   = var.db_admin_password
  common_tags         = local.common_tags
}
