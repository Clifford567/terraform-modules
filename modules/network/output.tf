output "vnet_id" {
 description = "Virtual Network ID"
 value       = azurerm_virtual_network.this.id
}

output "subnet_ids" {
 description = "Map of subnet IDs"
 value = {
   for k, s in azurerm_subnet.this : k => s.id
 }
}