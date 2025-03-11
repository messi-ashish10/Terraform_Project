output "data_disk_ids" {
  description = "The IDs of the data disks."
  value       = [for disk in azurerm_managed_disk.datadisk : disk.id]
}
