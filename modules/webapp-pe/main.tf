data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_private_endpoint" "webapp_pe" {
  name                = var.private_endpoint_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = var.private_connection_name
    private_connection_resource_id = var.webapp_id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }

  tags = var.tags
}



