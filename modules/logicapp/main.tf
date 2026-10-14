resource "azurerm_logic_app_workflow" "logic_app" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.tags
}