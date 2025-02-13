variable "create_resource_group" {
  description = "Indica se um grupo de recursos deve ser criado"
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "Nome do grupo de recursos onde a VNet será criada"
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
  validation {
    condition     = can(regex("^[a-zA-Z0-9][a-zA-Z0-9-._]{2,64}[a-zA-Z0-9_]$", var.vnet_name))
    error_message = "--> Virtual network name must start with letter or number, contain letters, numbers, dashes, undescore and popints and must be between 2 and 64 characters."
  }
}
variable "subnets" {
  description = "Mapa de configurações de subnets contendo nome, prefixos de endereço e configurações opcionais"
  type = map(object({
    name             = string
    address_prefixes = list(string)
    nat_gateway = optional(object({
      id = string
    }))
  }))
  default = {}
  validation {
    condition = alltrue(flatten([
      for subnet in var.subnets : [
        for prefix in subnet.address_prefixes :
        can(regex("^[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}/[0-9]{1,2}$", prefix)) &&
        (subnet.name != "AzureBastionSubnet" || tonumber(split("/", prefix)[1]) <= 26)
      ]
    ]))
    error_message = "--> Configuração Invalida. A sub-rede deve ser /26 ou maior (por exemplo, /26, /25 ou /24) para acomodar os recursos disponíveis com o SKU padrão"
  }
}

variable "vnet_address_space" {
  description = "Espaço de endereços da VNet"
  type        = list(string)
}
