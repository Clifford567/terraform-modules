variable "name" { type = string }
variable "location" { type = string }
variable "data_factory_id" {
 description = "ADF ID"
 type = string
}
variable "ir_name" {
 description = "Managed Integration Runtime name"
 type        = string
}
variable "target_resource_id" {
 description = "ID of resource ADF connects privately to"
 type        = string
}
variable "subresource_name" {
 description = "Single subresource (blob, sql, https, etc.)"
 type        = string
}