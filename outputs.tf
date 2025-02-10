output "vnet_id" {
  description = "ID da VNet"
  value       = azurerm_virtual_network.vnet[0].id
}
