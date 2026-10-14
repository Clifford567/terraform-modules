resource "azurerm_private_endpoint" "openai_pe" {
  name                = "pe-openai"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "openai-connection"
    private_connection_resource_id = var.cognitive_account_id
    subresource_names              = ["OpenAI"]
    is_manual_connection           = false
  }

}