variable "name" { type = string }
variable "location" { type = string }
variable "rg_name" { type = string }
variable "subnet_id" { type = string }
variable "sku_name" {
 type = string
 description = "App Service Plan SKU, e.g. Y1, WS1, etc."
}
variable "storage_account_name" { type = string }
variable "storage_account_key"  { type = string }
variable "app_settings" {
 type    = map(string)
 default = {}
}
variable "tags" {
 type    = map(string)
 default = {}
}