# Create Public IP for Load Balancer
resource "azurerm_public_ip" "n01625230_lb_pip" {
  name                = "n01625230-lb-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = var.common_tags
}

# Create Load Balancer
resource "azurerm_lb" "n01625230_lb" {
  name                = "n01625230-lb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "n01625230-lb-frontend"
    public_ip_address_id = azurerm_public_ip.n01625230_lb_pip.id
  }

  tags = var.common_tags
}

# Create Backend Address Pool
resource "azurerm_lb_backend_address_pool" "n01625230_lb_backend" {
  loadbalancer_id = azurerm_lb.n01625230_lb.id
  name            = "n01625230-lb-backend"
}

# Associate Linux VMs with Backend Pool
resource "azurerm_network_interface_backend_address_pool_association" "n01625230_lb_association" {
  count                   = length(var.linux_vm_nic_ids)
  network_interface_id    = var.linux_vm_nic_ids[count.index]
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.n01625230_lb_backend.id
}

# Create Health Probe
resource "azurerm_lb_probe" "n01625230_lb_probe" {
  loadbalancer_id = azurerm_lb.n01625230_lb.id
  name            = "n01625230-lb-probe"
  port            = 80
}

# Create Load Balancer Rule
resource "azurerm_lb_rule" "n01625230_lb_rule" {
  loadbalancer_id                = azurerm_lb.n01625230_lb.id
  name                           = "n01625230-lb-rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "n01625230-lb-frontend"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.n01625230_lb_backend.id]
  probe_id                       = azurerm_lb_probe.n01625230_lb_probe.id
}
