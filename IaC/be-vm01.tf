/*
resource "azurerm_network_interface" "be-vm01-nic" {
  name                = "be-vm01-nic"
  resource_group_name = azurerm_resource_group.tfr-rg1.name
  location            = azurerm_resource_group.tfr-rg1.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.tfr-be.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "tfr-be01" {
  name                = "be-vm01"
  resource_group_name = azurerm_resource_group.tfr-rg1.name
  location            = azurerm_resource_group.tfr-rg1.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = "Password123!"
  network_interface_ids = [
    azurerm_network_interface.be-vm01-nic.id,
  ]
  disable_password_authentication = "false"


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  custom_data = filebase64("be-custom.tpl")  

  

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
*/