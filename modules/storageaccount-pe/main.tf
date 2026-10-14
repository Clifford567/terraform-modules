module "pe_storage" {
 source = "./modules/privateendpoint"
 name                     = "${var.storage_account_name}-pe"
 location                 = var.location
 rg_name                  = module.resourcegroup.name
 subnet_id                = module.network.subnet_ids["private"]
 target_resource_id       = data.azurerm_storage_account.shared_sa.id
 private_connection_name  = "${var.storage_account_name}-connection"
 subresource_names        = ["blob"]
 private_dns_zone_ids     = [module.dns_storage.id]
 tags = var.tags
}

module "dns_storage" {
 source    = "./modules/private-dns"
 rg_name   = module.resourcegroup.name
 vnet_id   = module.network.vnet_id
 zone_name = "privatelink.blob.core.windows.net"
}