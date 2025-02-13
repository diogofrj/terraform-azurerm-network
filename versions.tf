terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.17.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.1"
    }
    assert = {
      source  = "hashicorp/assert"
      version = "0.15.0"
    }
  }
  required_version = ">= 1.9, < 2.0"
}
