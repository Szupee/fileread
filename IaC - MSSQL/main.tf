terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.36.0"
    }
  }
  backend "azurerm" {
        resource_group_name  = "mainapp"
        storage_account_name = "uploadfilesfrom1"
        container_name       = "terraform-sql"
        key                  = "terraform.tfstate"
    }
}

provider "azurerm" {
  use_oidc = true
  features {}
}

resource "azurerm_resource_group" "SQLfileread" {
  name     = "SQLfileread"
  location = "UK South"
}
