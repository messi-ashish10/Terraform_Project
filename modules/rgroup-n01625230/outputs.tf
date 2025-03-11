output "resource_group_name" {
  description = "The name of the resource group."
  value       = azurerm_resource_group.n01625230_rg.name
}

output "location" {
  description = "The location of the resource group."
  value       = azurerm_resource_group.n01625230_rg.location
}
