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
  validation {
    condition     = can(regex("^[a-zA-Z0-9][a-zA-Z0-9-._]{2,64}[a-zA-Z0-9_]$", var.vnet_name))
    error_message = "--> Virtual network name must start with letter or number, contain letters, numbers, dashes, undescore and popints and must be between 2 and 64 characters."
  }
}

variable "vnet_address_space" {
  description = "Espaço de endereços da VNet"
  type        = list(string)
}
