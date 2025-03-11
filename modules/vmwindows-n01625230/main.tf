# Create Availability Set
resource "azurerm_availability_set" "n01625230_avset" {
  name                         = "n01625230-win-avset"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  managed                      = true

  tags = var.common_tags
}

# Create Public IP for VM
resource "azurerm_public_ip" "vmwindows_pip" {
  count               = var.vm_count
  name                = "pip-n01625230-win-vm-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = "n01625230-w-vm-${count.index}"
  tags = var.common_tags
}

# Create Network Interface for VM
resource "azurerm_network_interface" "vmwindows_nic" {
  count               = var.vm_count
  name                = "nic-n01625230-win-vm-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vmwindows_pip[count.index].id
  }

  tags = var.common_tags
}

# Create Windows VM
resource "azurerm_windows_virtual_machine" "vmwindows" {
  count                 = var.vm_count
  name                  = "n01625230-win-vm-${count.index}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.vmwindows_nic[count.index].id]
  size                  = "Standard_B1s"
  availability_set_id   = azurerm_availability_set.n01625230_avset.id

  os_disk {
    name                 = "osdisk-n01625230-win-vm-${count.index}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  computer_name  = "n01625230-w-vm${count.index}"
  admin_username = var.admin_username
  admin_password = var.admin_password

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }

  tags = var.common_tags
}

resource "azurerm_virtual_machine_extension" "antimalware" {
  count                = var.vm_count
  name                 = "AntimalwareExtension"
  virtual_machine_id   = azurerm_windows_virtual_machine.vmwindows[count.index].id
  publisher            = "Microsoft.Azure.Security"
  type                 = "IaaSAntimalware"
  type_handler_version = "1.3"

  settings = <<SETTINGS
  {
    "AntimalwareEnabled": true
  }
  SETTINGS
}
