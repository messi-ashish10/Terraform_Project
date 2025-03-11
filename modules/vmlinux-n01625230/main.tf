# Create Availability Set
resource "azurerm_availability_set" "linux_n01625230_avset" {
  name                         = "n01625230-avset"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  managed                      = true

  tags = var.common_tags
}

# Create Public IPs for VMs
resource "azurerm_public_ip" "vmlinux_pip" {
  for_each            = var.vm_names
  name                = "pip-5230-${each.value}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  domain_name_label   = "fqdn-5230-${each.key}"
  sku                 = "Standard"
  tags = var.common_tags
}

# Create Network Interfaces for VMs
resource "azurerm_network_interface" "vmlinux_nic" {
  for_each            = var.vm_names
  name                = "nic-5230-${each.value}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vmlinux_pip[each.key].id
  }

  tags = var.common_tags
}

# Create Linux VMs
resource "azurerm_linux_virtual_machine" "vmlinux" {
  for_each              = var.vm_names
  name                  = each.value
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.vmlinux_nic[each.key].id]
  size                  = "Standard_B1s"
  availability_set_id   = azurerm_availability_set.linux_n01625230_avset.id

  depends_on = [azurerm_public_ip.vmlinux_pip]

  os_disk {
    name                 = "osdisk-${each.value}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }

  computer_name  = each.value
  admin_username = var.admin_username

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  disable_password_authentication = true

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }
		
  tags = var.common_tags
}

# Install Network Watcher and Azure Monitor Extensions
resource "azurerm_virtual_machine_extension" "network_watcher" {
  for_each            = var.vm_names
  name                = "NetworkWatcherAgent-${each.key}"
  virtual_machine_id  = azurerm_linux_virtual_machine.vmlinux[each.key].id
  publisher           = "Microsoft.Azure.NetworkWatcher"
  type                = "NetworkWatcherAgentLinux"
  type_handler_version = "1.4"
}

resource "azurerm_virtual_machine_extension" "azure_monitor" {
  for_each            = var.vm_names
  name                = "AzureMonitorAgent-${each.key}"
  virtual_machine_id  = azurerm_linux_virtual_machine.vmlinux[each.key].id
  publisher           = "Microsoft.Azure.Monitor"
  type                = "AzureMonitorLinuxAgent"
  type_handler_version = "1.19"
}
