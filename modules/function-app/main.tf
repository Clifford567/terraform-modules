resource "azurerm_service_plan" "this" {
 name                = "${var.name}-plan"
 location            = var.location
 resource_group_name = var.rg_name
 os_type  = "Windows"
 sku_name = var.sku_name
}
resource "azurerm_windows_function_app" "this" {
 name                = var.name
 location            = var.location
 resource_group_name = var.rg_name
 service_plan_id     = azurerm_service_plan.this.id
 storage_account_name = var.storage_account_name
 storage_account_access_key = var.storage_account_key
 site_config {
   always_on = false
   ip_restriction_default_action = "Deny"
 }
 app_settings = var.app_settings
 identity {
   type = "SystemAssigned"
 }

 tags = var.tags
}
