output "db_instance_name" {
  description = "The name of the PostgreSQL database server."
  value       = azurerm_postgresql_server.n01625230_db.name
}
