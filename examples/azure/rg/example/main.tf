module "labels" {
  source       = "git::https://github.com/diogofrj/templates-tf-modules.git//examples/azure/labels?ref=v0.0.1"
  project      = "myapp"
  environment  = "dev"
  region       = "eastus2"
  organization = ""
  CC           = ""
  CC_OWNER     = ""
  Vertical     = ""
  # As variáveis organization, CC, CC_OWNER e Vertical são opcionais e não precisam ser passadas
}

module "resource-group" {
  source                  = "../"
  resource_group_name     = module.labels.resource_group_name
  resource_group_location = module.labels.region
  tags                    = module.labels.tags
}