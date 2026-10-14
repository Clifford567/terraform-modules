#############################################
# EXISTING RESOURCE GROUP (DATA SOURCE)
#############################################
data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

#############################################
# STORAGE ACCOUNT LOOKUP
#############################################
data "azurerm_storage_account" "shared_sa" {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

#############################################
# NETWORK
#############################################
module "network" {
  source        = "./modules/network"
  rg_name       = data.azurerm_resource_group.rg.name
  location      = data.azurerm_resource_group.rg.location
  vnet_name     = var.vnet_name
  address_space = var.vnet_address_space
  subnets       = var.subnets
}

#############################################
# WINDOWS FUNCTION APP
#############################################
module "functionapp" {
  source   = "./modules/function-app"
  name     = var.functionapp_name
  location = data.azurerm_resource_group.rg.location
  rg_name  = data.azurerm_resource_group.rg.name

  subnet_id            = module.network.subnet_ids["private"]
  sku_name             = "EP1"
  storage_account_name = data.azurerm_storage_account.shared_sa.name
  storage_account_key  = data.azurerm_storage_account.shared_sa.primary_access_key

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "dotnet"
    WEBSITE_RUN_FROM_PACKAGE = "1"
  }
}

#############################################
# FUNCTION APP PRIVATE ENDPOINT
#############################################
module "functionapp_pe" {
  source                  = "./modules/functionapp-pe"
  rg_name                 = data.azurerm_resource_group.rg.name
  location                = data.azurerm_resource_group.rg.location
  subnet_id               = module.network.subnet_ids["private"]
  target_resource_id      = module.functionapp.id
  private_connection_name = "functionapp-connection"
  subresource_names       = ["sites"]
   # optional
}

#############################################
# LOGIC APP
#############################################
module "logicapp" {
  source   = "./modules/logicapp"
  name     = var.logicapp_name
  location = data.azurerm_resource_group.rg.location
  rg_name  = data.azurerm_resource_group.rg.name
  tags     = var.tags
}

#############################################
# PRIVATE DNS – LOGIC APP
#############################################
module "dns_logicapp" {
  source    = "./modules/private-dns"
  rg_name   = data.azurerm_resource_group.rg.name
  vnet_id   = module.network.vnet_id
  zone_name = "privatelink.logic.azure.com"
}

#############################################
# COSMOS DB
#############################################
module "cosmosdb" {
  source            = "./modules/cosmosDB"
  rg_name           = data.azurerm_resource_group.rg.name
  location          = data.azurerm_resource_group.rg.location
  account_name      = var.cosmos_account_name
  database_name     = var.cosmos_database_name
  container_name    = var.cosmos_container_name
  partition_key     = var.cosmos_partition_key
  consistency_level = var.cosmos_consistency_level
  tags              = var.tags
}

#############################################
# COSMOS PRIVATE ENDPOINT
#############################################
module "cosmos_pe" {
  source                  = "./modules/privateendpoint"
  name                    = "pe-cosmos"
  location                = data.azurerm_resource_group.rg.location
  rg_name                 = data.azurerm_resource_group.rg.name
  subnet_id               = module.network.subnet_ids["private"]
  target_resource_id      = module.cosmosdb.id
  private_connection_name = "cosmos-conn"
  subresource_names       = ["Sql"]
}

#############################################
# AI FOUNDRY
#############################################
module "aifoundry" {
  source = "./modules/AIfoundry"

  # pass the unique subdomain from pipeline/variables
  ai_custom_subdomain = var.ai_custom_subdomain  

  # other existing variables
  name               = var.aifoundry_name
  location           = data.azurerm_resource_group.rg.location
  rg_name            = data.azurerm_resource_group.rg.name
  aifoundry_sku_name = var.aifoundry_sku_name
  tags               = var.aifoundry_tags
}




#############################################
# OPENAI PRIVATE ENDPOINT
#############################################
module "openai_pe" {
  source                  = "./modules/functionapp-pe"
  rg_name                 = data.azurerm_resource_group.rg.name
  location                = data.azurerm_resource_group.rg.location
  subnet_id               = module.network.subnet_ids["private"]
  target_resource_id      = module.aifoundry.id
  private_connection_name = "openai-connection"
  subresource_names       = ["account"]
 # optional
}
#############################################
# azure webapp
#############################################
module "webapp" {
  source                = "./modules/webapp"
  rg_name               = var.rg_name
  location              = var.location
  app_service_plan_name = var.webapp_plan_name
  app_service_plan_sku  = var.webapp_plan_sku
  webapp_name           = var.webapp_name
  dotnet_version        = var.dotnet_version
  os_type               = var.os_type
  tags                  = var.tags
}
#############################################
# azure webapp private endpoint
#############################################

module "webapp_pe" {
  source = "./modules/webapp-pe"

  private_endpoint_name    = "pe-${var.webapp_name}"
  private_connection_name  = "webapp-connection"
  resource_group_name      = var.rg_name
  location                 = var.location
  subnet_id                = module.network.subnet_ids["private"]
  webapp_id                = module.webapp.webapp_id
  tags                     = var.tags
}













