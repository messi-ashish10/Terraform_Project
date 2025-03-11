output "vnet_name" {
  description = "The name of the virtual network."
  value       = azurerm_virtual_network.n01625230_vnet.name
}

output "subnet_name" {
  description = "The name of the subnet."
  value       = azurerm_subnet.n01625230_subnet.name
}

output "subnet_id" {
  description = "The ID of the subnet."
  value       = azurerm_subnet.n01625230_subnet.id
}

output "nsg_id" {
  value = azurerm_network_security_group.n01625230_nsg.id
}

