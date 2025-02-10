variable "resource_group_name" {
  default = "skaf-test-rg" ## inserted value
  type    = string
}
variable "resource_group_location" {
  default = "eastus" ## inserted value
  type    = string
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)

  default = {
    tag1 = ""
    tag2 = ""
  }
}

variable "create_resource_group" {
  description = "Whether to create a new resource group or use an existing one."
  type        = bool
  default     = true
}

