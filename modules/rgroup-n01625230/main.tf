resource "azurerm_resource_group" "n01625230_rg" {
  name     = var.resource_group_name
  location = var.location

  tags = var.common_tags
}
