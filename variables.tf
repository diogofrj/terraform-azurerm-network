variable "create_resource_group" {
  description = "Controla se o grupo de recursos deve ser criado (true) ou usar um existente (false)"
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "Nome do grupo de recursos"
  type        = string
}

variable "location" {
  description = "Localização do Azure onde os recursos serão criados"
  type        = string
}

variable "tags" {
  description = "Tags a serem aplicadas aos recursos"
  type        = map(string)
  default     = {}
}

variable "vnet_name" {
  description = "Nome da VNet"
  type        = string
}

variable "vnet_address_space" {
  description = "Espaço de endereços da VNet"
  type        = list(string)
}
