resource "azurerm_cosmosdb_account" "this" {
 name                = var.account_name
 location            = var.location
 resource_group_name = var.rg_name
 kind       = "GlobalDocumentDB"
 offer_type = "Standard"
 public_network_access_enabled = false
 consistency_policy {
   consistency_level = var.consistency_level
 }
 geo_location {
   location          = var.location
   failover_priority = 0
 }
 tags = var.tags
}
resource "azurerm_cosmosdb_sql_database" "db" {
 name                = var.database_name
 resource_group_name = var.rg_name
 account_name        = azurerm_cosmosdb_account.this.name
}
resource "azurerm_cosmosdb_sql_container" "container" {
 name                = var.container_name
 resource_group_name = var.rg_name
 account_name        = azurerm_cosmosdb_account.this.name
 database_name       = azurerm_cosmosdb_sql_database.db.name
 partition_key_path  = var.partition_key
}