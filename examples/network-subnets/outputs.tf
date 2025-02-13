output "vnet_id" {
  description = "ID da VNet"
  value       = module.vnet.vnet_id
}

output "vnet_subnets" {
  description = "Mapa de IDs das subnets da VNet"
  value = {
    for subnet_key, subnet in module.vnet.vnet_subnets : subnet_key => subnet.id
  }
}
