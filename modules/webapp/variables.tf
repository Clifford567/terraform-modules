variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "app_service_plan_name" {
  type = string
}

variable "app_service_plan_sku" {
  type = string
}

variable "webapp_name" {
  type = string
}
variable "dotnet_version" {
  type        = string
  description = "Dotnet runtime version for WebApp"
}
variable "os_type" {
  type        = string
  description = "Dotnet runtime version for WebApp"
}


variable "tags" {
  type    = map(string)
  default = {}
}
