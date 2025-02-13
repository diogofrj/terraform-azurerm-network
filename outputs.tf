output "vnet_id" {
  description = "ID da VNet"
  value       = azurerm_virtual_network.vnet[0].id
}

output "vnet_name" {
  description = "Nome da VNet"
  value       = azurerm_virtual_network.vnet[0].name
}

output "vnet_address_space" {
  value       = { for vnet in azurerm_virtual_network.vnet : vnet.name => vnet.address_space }
  description = "Espaço de endereço da VNet"
}


output "vnet_subnets" {
  value       = { for subnet in azurerm_subnet.subnet : subnet.name => subnet.address_prefixes }
  description = "Subnets da VNet"
}
