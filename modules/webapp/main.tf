data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

resource "azurerm_service_plan" "asp" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  os_type             = var.os_type
  sku_name            = var.app_service_plan_sku
  tags                = var.tags
}

resource "azurerm_windows_web_app" "webapp" {
  name                = var.webapp_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    application_stack {
      dotnet_version = var.dotnet_version
    }
  }

  https_only = true
  tags       = var.tags
}


