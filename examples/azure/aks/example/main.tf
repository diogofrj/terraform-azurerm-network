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


module "aks" {
  #   source = "git::https://github.com/diogofrj/templates-tf-modules.git//examples/azure/aks?ref=v0.0.1"
  source      = "../"
  project     = module.labels.project
  environment = module.labels.environment
  region      = module.labels.region
  #   organization = module.labels.organization
  #   CC           = module.labels.CC
  #   CC_OWNER     = module.labels.CC_OWNER
  #   Vertical     = module.labels.Vertical

  create_resource_group = true
  resource_group_name   = module.labels.resource_group_name
  location              = module.labels.region
  tags                  = module.labels.tags


  # Configurações de rede
  address_space  = "20.10.0.0/16"
  network_plugin = "kubenet"
  k8s_version    = "1.26.3"

}


