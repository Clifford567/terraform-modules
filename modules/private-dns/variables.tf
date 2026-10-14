variable "zone_name" {
 description = "Private DNS zone name (e.g. privatelink.blob.core.windows.net)"
 type        = string
}
variable "rg_name" {
 description = "Resource group name where Private DNS zone will be created"
 type        = string
}
variable "vnet_id" {
 description = "Virtual Network ID to link with Private DNS zone"
 type        = string
}