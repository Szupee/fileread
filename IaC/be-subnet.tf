#Create the subnet
resource "azurerm_subnet" "tfr-be" {
  name                 = "subnet-${var.be_subnet_name}"
  resource_group_name  = azurerm_resource_group.tfr-rg1.name
  virtual_network_name = azurerm_virtual_network.tfr-vnet1.name
  address_prefixes     = var.be_subnet_address
}

#Create the nsg
resource "azurerm_network_security_group" "tbe-sg" {
  name                = "backend-sg"
  location            = azurerm_resource_group.tfr-rg1.location
  resource_group_name = azurerm_resource_group.tfr-rg1.name

}
#Port maps
locals {
  be_inbound_ports = {
    "100" : "22"
  }
}
#Create the rules and add them to the nsg
resource "azurerm_network_security_rule" "tfr-be-rule1" {
  for_each                    = local.be_inbound_ports
  name                        = "ruleport-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.tfr-rg1.name
  network_security_group_name = azurerm_network_security_group.tbe-sg.name


}

#Associate the nsg to the subnet
resource "azurerm_subnet_network_security_group_association" "tfr-nsga-be" {
  subnet_id                 = azurerm_subnet.tfr-be.id
  network_security_group_id = azurerm_network_security_group.tbe-sg.id
}