# Create Azure Database for PostgreSQL Single Server
resource "azurerm_postgresql_server" "n01625230_db" {
  name                = var.db_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = "B_Gen5_1" # Basic tier, Gen5, 1 vCore

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = false

  administrator_login          = var.db_admin_username
  administrator_login_password = var.db_admin_password

  version                      = "11"
  ssl_enforcement_enabled      = true

  tags = var.common_tags
}

# Create a Database within the PostgreSQL Server
resource "azurerm_postgresql_database" "n01625230_db" {
  name                = "n01625230db"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.n01625230_db.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
