output "vnet_id" {
  value       = try(azurerm_virtual_network.vnet.id, null)
  description = "ID da VNet criada"
}

output "vnet_name" {
  value       = try(azurerm_virtual_network.vnet.name, null)
  description = "Nome da VNet criada"
}

output "vnet_address_space" {
  value       = try(azurerm_virtual_network.vnet.address_space, [])
  description = "Espaço de endereços da VNet"
}
output "vnet_subnets" {
  value       = try([for subnet in azurerm_subnet.subnet : subnet.name], [])
  description = "Subnets da VNet"
}

output "vnet_subnets_ids" {
  value       = { for subnet in azurerm_subnet.subnet : subnet.name => subnet.id }
  description = "Mapa de IDs das subnets da VNet"
}
