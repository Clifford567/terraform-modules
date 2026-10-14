location = "eastus"
rg_name  = "apei-poc"

tags = {
  env = "dev"
}

# -------------------------
# Function App
# -------------------------
functionapp_name      = "ews-funcapp-dev"
functionapp_pe_name  = "ews-funcapp-pe-dev"
functionapp_pe_connection_name = "ews-funcapp-pe-conn"
storage_account_name  = "backendspoc"
app_service_plan_name = "ews-plan-dev"
runtime_stack         = "dotnet"
runtime_version       = "8"

# -------------------------
# Logic App
# -------------------------
logicapp_name = "ews-logicapp-dev"
logicapp_pe_connection_name = "ews-logicapp-pe-conn"
logicapp_pe_name = "ews-logicapp-pe-dev"

# Logic App workflow JSON
logicapp_service_plan_id = "YOUR_SERVICE_PLAN_ID_FROM_MODULE"

# -------------------------
# Backend Terraform State
# -------------------------
backend_rg        = "apei-poc"
backend_container = "state"
backend_key       = "dev.tfstate"

# -------------------------
# VNet & Subnet
# -------------------------
vnet_name           = "vnet-dev"
vnet_address_space  = ["10.0.0.0/20"]

subnets = {
  private = ["10.0.1.0/24"]
}

# Required for Private Endpoints
pe_subnet_id = "/subscriptions/.../resourceGroups/.../providers/Microsoft.Network/virtualNetworks/vnet-dev/subnets/pe-subnet"

# -------------------------
# Cosmos DB
# -------------------------
cosmos_account_name      = "cosmosapeipoc001"
cosmos_database_name     = "appdb"
cosmos_container_name    = "items"
cosmos_partition_key     = "/id"
cosmos_consistency_level = "Session"
cosmos_pe_subresources   = ["Sql"]

# -------------------------
# Data Factory
# -------------------------
adf_name = "adfapeipocdev"

# -------------------------
# Azure AI
# -------------------------
ai_name     = "ai-dev"
aifoundry_sku_name = "S0"

# -------------------------
# OpenAI
# -------------------------

openai_pe_name               = "pe-openai-dev"
openai_pe_connection_name    = "openai-conn-dev"
openai_pe_subresources       = ["account"]

# -------------------------
# Cosmos DNS Zone
# -------------------------
private_endpoint_name = "pe-cosmos"
private_dns_zone_id   = "/subscriptions/.../privatelink.documents.azure.com"

# -------------------------
# Function App & Logic App PE
# -------------------------
subresource_names = ["workflow"]

# If needed, override DNS zone for App Services:
# private_dns_zone_id = "/subscriptions/.../privateDnsZones/privatelink.azurewebsites.net"
logicapp_workflow_json = "{}"
subscription_id = "c3445c94-e383-4529-af5e-f575d47309bd"
ai_custom_subdomain = "ai-dev"

# -------------------------
# Web App
# -------------------------

webapp_plan_name = "ASP-rgrasdedupdev-bece"
webapp_plan_sku  = "B2"
webapp_name      = "apei-dev-webapp"
dotnet_version   = "v8.0"
os_type          = "Windows"