# Create Virtual Network
resource "azurerm_virtual_network" "n01625230_vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.common_tags
}

# Create Subnet
resource "azurerm_subnet" "n01625230_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.n01625230_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create Network Security Group (NSG) with Rules
resource "azurerm_network_security_group" "n01625230_nsg" {
  name                = "${var.vnet_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "RDP"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "HTTP"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "WinRM"
    priority                   = 400
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = var.common_tags
}

# Associate NSG with Subnet
resource "azurerm_subnet_network_security_group_association" "n01625230_nsg_association" {
  subnet_id                 = azurerm_subnet.n01625230_subnet.id
  network_security_group_id = azurerm_network_security_group.n01625230_nsg.id
}
