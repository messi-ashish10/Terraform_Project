# Create Data Disks
resource "azurerm_managed_disk" "datadisk" {
  count                = var.vm_count
  name                 = "datadisk-${count.index}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10

  tags = var.common_tags
}

# Attach Data Disks to Linux VMs
resource "azurerm_virtual_machine_data_disk_attachment" "linux_vm_disk_attachment" {
  count              = var.linux_vm_count
  managed_disk_id    = azurerm_managed_disk.datadisk[count.index].id
  virtual_machine_id = var.linux_vm_ids[count.index]
  lun                = 10 + count.index
  caching            = "ReadWrite"
}

# Attach Data Disks to Windows VM
resource "azurerm_virtual_machine_data_disk_attachment" "windows_vm_disk_attachment" {
  count              = var.windows_vm_count
  managed_disk_id    = azurerm_managed_disk.datadisk[var.linux_vm_count + count.index].id
  virtual_machine_id = var.windows_vm_ids[count.index]
  lun                = 10 + var.linux_vm_count + count.index
  caching            = "ReadWrite"
}
