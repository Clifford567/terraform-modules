resource "azurerm_data_factory" "this" {
 name                = var.name
 location            = var.location
 resource_group_name = var.rg_name
 public_network_enabled = false
 identity {
   type = "SystemAssigned"
 }
 tags = var.tags
}