module "labels" {
  source      = "git::https://github.com/diogofrj/templates-tf-modules.git//examples/azure/labels?ref=v0.0.1"
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

  tags = {
    "project"     = "module-vnet"
    "environment" = "dev"
    "region"      = "eastus2"
  }
}
