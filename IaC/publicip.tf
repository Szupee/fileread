resource "azurerm_public_ip" "tfr-pip" {
  name                = "tfr-pip"
  resource_group_name = azurerm_resource_group.tfr-rg1.name
  location            = azurerm_resource_group.tfr-rg1.location
  allocation_method   = "Dynamic"

}

resource "azurerm_public_ip" "tfr-pip2" {
  name                = "tfr-pip2"
  resource_group_name = azurerm_resource_group.tfr-rg1.name
  location            = azurerm_resource_group.tfr-rg1.location
  allocation_method   = "Dynamic"

}