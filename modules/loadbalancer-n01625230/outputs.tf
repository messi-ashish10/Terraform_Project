output "load_balancer_name" {
  value = azurerm_lb.n01625230_lb.name
}

output "load_balancer_backend_pool_name" {
  value = azurerm_lb_backend_address_pool.n01625230_lb_backend.name
}

output "load_balancer_probe_name" {
  value = azurerm_lb_probe.n01625230_lb_probe.name
}

output "load_balancer_rule_name" {
  value = azurerm_lb_rule.n01625230_lb_rule.name
}
