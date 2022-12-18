terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.97.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "tfr-rg1" {
  name     = "FR-RG1"
  location = "UK South"
}
