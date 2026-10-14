resource "azurerm_data_factory_integration_runtime_managed" "this" {
 name            = var.ir_name
 data_factory_id = var.data_factory_id
 location        = var.location
}
resource "azurerm_data_factory_managed_private_endpoint" "this" {
 name                       = var.name
 data_factory_id            = var.data_factory_id
 target_resource_id         = var.target_resource_id
 subresource_name           = var.subresource_name
 integration_runtime_name   = azurerm_data_factory_integration_runtime_managed.this.name
}