terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.36.0"
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
