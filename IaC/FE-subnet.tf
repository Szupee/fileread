#Create the subnet
resource "azurerm_subnet" "tfr-fe" {
  name                 = "subnet-${var.fe_subnet_name}"
  resource_group_name  = azurerm_resource_group.tfr-rg1.name
  virtual_network_name = azurerm_virtual_network.tfr-vnet1.name
  address_prefixes     = var.fe_subnet_address
}
#Create the nsg
resource "azurerm_network_security_group" "tfe-sg" {
  name                = "Frontend-sg"
  location            = azurerm_resource_group.tfr-rg1.location
  resource_group_name = azurerm_resource_group.tfr-rg1.name

}
#Port maps
locals {
  fe_inbound_ports = {
    "100" : "22"
    "101" : "443"
    "102" : "80"
  }
}
#Create the rules and add them to the nsg
resource "azurerm_network_security_rule" "tfr-fe-rule1" {
  for_each                    = local.fe_inbound_ports
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
  network_security_group_name = azurerm_network_security_group.tfe-sg.name


}

#Associate the nsg to the subnet
resource "azurerm_subnet_network_security_group_association" "tfr-nsga" {
  subnet_id                 = azurerm_subnet.tfr-fe.id
  network_security_group_id = azurerm_network_security_group.tfe-sg.id
}