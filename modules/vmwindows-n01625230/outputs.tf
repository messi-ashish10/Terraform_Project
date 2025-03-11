output "windows_vm_ids" {
  value = [for vm in azurerm_windows_virtual_machine.vmwindows : vm.id]
}

output "windows_vm_nic_ids" {
  value = [for nic in azurerm_network_interface.vmwindows_nic : nic.id]
}

output "windows_vm_hostname" {
  description = "The hostname of the Windows VM."
  value       = azurerm_windows_virtual_machine.vmwindows[0].computer_name
}

output "windows_vm_public_ip" {
  description = "The public IP address of the Windows VM."
  value       = azurerm_public_ip.vmwindows_pip[0].ip_address
}

output "windows_vm_fqdn" {
  value = azurerm_public_ip.vmwindows_pip[0].fqdn
}

output "windows_vm_private_ip" {
  description = "The private IP address of the Windows VM."
  value       = azurerm_network_interface.vmwindows_nic[0].private_ip_address
}

