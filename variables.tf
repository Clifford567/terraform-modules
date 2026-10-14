# Backend
variable "backend_rg" {}
variable "storage_account_name" {
  type        = string
  description = "Existing storage account used for backend + function app + logic app"
}

variable "backend_container" {}
variable "backend_key" {}
# Common
variable "location" {}
variable "tags" {}
# Resource Group
variable "rg_name" {}
# Network
variable "vnet_name" {}
variable "vnet_address_space" {}
variable "subnets" {}
# Cosmos DB
variable "cosmos_account_name" {
 type = string
}
variable "cosmos_database_name" {
 type = string
}
variable "cosmos_container_name" {
 type = string
}
variable "cosmos_partition_key" {
 type = string
}
variable "cosmos_consistency_level" {
 type = string
}
# Data Factory
variable "adf_name" {}
# AI Foundry
variable "ai_name" {}
variable "aifoundry_sku_name" {
 type = string
}

variable "openai_pe_name" {
 description = "Private Endpoint name for OpenAI"
 type        = string
}
variable "openai_pe_connection_name" {
 description = "Private service connection name for OpenAI PE"
 type        = string
}
variable "subresource_names" {
 description = "Subresource names for the OpenAI Private Endpoint"
 type        = list(string)
}
# Private Endpoint
variable "private_endpoint_name" {}
variable "cosmos_pe_subresources" {
 description = "Cosmos DB private endpoint subresources"
 type        = list(string)
}
# Function App
variable "functionapp_name" {}
variable "app_service_plan_name" {}
variable "runtime_stack" {}
variable "runtime_version" {}

# Logic App
variable "logicapp_name" {}
variable "logicapp_service_plan_id" {
 description = "Service plan ID for Logic App"
 type        = string
}
variable "subscription_id" {
 type = string
}
variable "logicapp_workflow_json" { type = string }

# New for Private Endpoints
variable "pe_subnet_id" {
  description = "Subnet ID used for private endpoints"
}

variable "private_dns_zone_id" {
  description = "Private DNS Zone ID for web apps (optional)"
  default     = null
}

variable "openai_pe_subresources" {
 type        = list(string)
 description = "OpenAI PE subresource types"
 default     = ["account"]   # or keep empty
}
variable "functionapp_pe_name" {
 type = string
}
variable "functionapp_pe_connection_name" {
 type = string
}
variable "logicapp_pe_name" {
 type = string
}
variable "logicapp_pe_connection_name" {
 type = string
}
variable "ai_custom_subdomain" {
 type = string
}

variable "aifoundry_name" {
  type = string
  default = "my-aifoundry"
}

variable "aifoundry_tags" {
  type = map(string)
  default = {
    env = "dev"
    project = "apei"
  }
}

variable "aifoundry_subdomain_name" {
  type = string
  default = "mycustomsubdomain"
}

# WebApp
variable "webapp_plan_name" {
  type        = string
  description = "App Service Plan name for Web App"
}


variable "webapp_plan_sku" {
  type = string
}

variable "webapp_name" {
  type = string
}

variable "os_type" {
  type = string
}

variable "dotnet_version" {
  type = string
}
