output "linux_vm_ids" {
  value = { for k, vm in azurerm_linux_virtual_machine.vmlinux : k => vm.id }
}

output "linux_vm_nic_ids" {
  value = { for k, nic in azurerm_network_interface.vmlinux_nic : k => nic.id }
}

output "linux_vm_hostnames" {
  description = "The hostnames of the Linux VMs."
  value       = { for k, v in azurerm_linux_virtual_machine.vmlinux : k => v.computer_name }
}

output "linux_vm_public_ips" {
  description = "The public IP addresses of the Linux VMs."
  value       = { for k, v in azurerm_public_ip.vmlinux_pip : k => v.ip_address }
}

output "linux_vm_fqdns" {
  value = { for k, pip in azurerm_public_ip.vmlinux_pip : k => pip.fqdn }
}

output "linux_vm_private_ips" {
  description = "The private IP addresses of the Linux VMs."
  value       = { for k, v in azurerm_network_interface.vmlinux_nic : k => v.private_ip_address }
}

