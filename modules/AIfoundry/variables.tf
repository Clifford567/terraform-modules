variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "aifoundry_sku_name" {
  type = string
  description = "OpenAI SKU (e.g., 'Standard')"
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "ai_custom_subdomain" {
  type        = string
  description = "Unique suffix for AI Foundry account name"
}

