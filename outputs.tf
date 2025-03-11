# Resource Group
output "resource_group_name" {
  value = module.rgroup_n01625230.resource_group_name
}

# Networking
output "vnet_name" {
  value = module.network_n01625230.vnet_name
}

output "subnet_name" {
  value = module.network_n01625230.subnet_name
}

# Common Services
output "log_analytics_workspace_name" {
  value = module.common_n01625230.log_analytics_workspace_name
}

output "recovery_services_vault_name" {
  value = module.common_n01625230.recovery_services_vault_name
}

output "storage_account_name" {
  value = module.common_n01625230.storage_account_name
}

# Linux VMs
output "linux_vm_hostnames" {
  value = module.vmlinux_n01625230.linux_vm_hostnames
}

output "linux_vm_fqdns" {
  value = module.vmlinux_n01625230.linux_vm_fqdns
}

output "linux_vm_private_ips" {
  value = module.vmlinux_n01625230.linux_vm_private_ips
}

output "linux_vm_public_ips" {
  value = module.vmlinux_n01625230.linux_vm_public_ips
}

# Windows VM
output "windows_vm_hostname" {
  value = module.vmwindows_n01625230.windows_vm_hostname
}

output "windows_vm_fqdn" {
  value = module.vmwindows_n01625230.windows_vm_fqdn
}

output "windows_vm_private_ip" {
  value = module.vmwindows_n01625230.windows_vm_private_ip
}

output "windows_vm_public_ip" {
  value = module.vmwindows_n01625230.windows_vm_public_ip
}

# Load Balancer
output "load_balancer_name" {
  value = module.loadbalancer_n01625230.load_balancer_name
}

output "load_balancer_backend_pool_name" {
  value = module.loadbalancer_n01625230.load_balancer_backend_pool_name
}

output "load_balancer_probe_name" {
  value = module.loadbalancer_n01625230.load_balancer_probe_name
}

output "load_balancer_rule_name" {
  value = module.loadbalancer_n01625230.load_balancer_rule_name
}

# Database
output "db_instance_name" {
  value = module.database_n01625230.db_instance_name
}
