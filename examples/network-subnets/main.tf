module "labels" {
  source      = "git::https://github.com/diogofrj/terraform-template-modules.git//examples/azure/labels?ref=v0.0.1"
  project     = "module-vnet"
  environment = "dev"
  region      = "eastus2"
}


module "vnet" {
  source = "../../"
  # Resource Group
  create_resource_group = true
  resource_group_name   = module.labels.resource_group_name
  location              = "eastus2"
  vnet_name             = module.labels.vnet_name
  vnet_address_space    = ["10.1.0.0/16", "192.168.0.0/16"]

  subnets = {
    subnet_1 = {
      name             = "subnet1"
      address_prefixes = ["10.0.1.0/24"]
      # nat_gateway = {
      #   id = module.natgateway.resource_id
      # }
    }
    subnet_2 = {
      name             = "subnet2"
      address_prefixes = ["10.0.2.0/24"]
      # nat_gateway = {
      #   id = module.natgateway.resource_id
      # }
    }
    AzureBastionSubnet = {
      name             = "AzureBastionSubnet"
      address_prefixes = ["10.0.3.0/24"]
    }
    subnet_3 = {
      name             = "subnet3"
      address_prefixes = ["10.0.4.0/24"]
    }
  }

  tags = {
    "project"     = "module-vnet"
    "environment" = "dev"
    "region"      = "eastus2"
  }
}
