resource "azurerm_network_interface" "fe-vm02-nic" {
  name                = "fe-vm02-nic"
  resource_group_name = azurerm_resource_group.tfr-rg1.name
  location            = azurerm_resource_group.tfr-rg1.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.tfr-fe.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.tfr-pip2.id
  }


  custom_data = filebase64("fe-custom.tpl")


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  #custom_data = filebase64("fe-custom.tpl")

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}