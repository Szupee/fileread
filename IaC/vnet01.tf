resource "azurerm_virtual_network" "tfr-vnet1" {
  name                = "fr-vnet1"
  resource_group_name = azurerm_resource_group.tfr-rg1.name
  location            = azurerm_resource_group.tfr-rg1.location
  address_space       = ["192.168.0.0/24"]
}


resource "azurerm_availability_set" "webas" {
  name                        = "webas1"
  resource_group_name         = azurerm_resource_group.tfr-rg1.name
  location                    = azurerm_resource_group.tfr-rg1.location
  platform_fault_domain_count = "2"


}

