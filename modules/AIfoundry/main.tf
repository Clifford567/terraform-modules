resource "random_string" "subdomain_suffix" {
  length  = 6
  upper   = false
  numeric = true
  special = false
}

locals {
  unique_subdomain = "${var.ai_custom_subdomain}-${random_string.subdomain_suffix.result}"
}

data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

resource "azapi_resource" "openai_account" {
  type      = "Microsoft.CognitiveServices/accounts@2024-06-01-preview"
  name      = "my-aifoundry-${local.unique_subdomain}"
  location  = var.location
  parent_id = data.azurerm_resource_group.rg.id

  schema_validation_enabled = false

  body = jsonencode({
    sku = {
      name = var.aifoundry_sku_name
    }
    kind = "OpenAI"
    properties = {
      publicNetworkAccess = "Disabled"
      customSubDomainName = local.unique_subdomain
    }
  })

  tags = var.tags
}
