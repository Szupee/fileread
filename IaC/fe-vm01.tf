resource "azurerm_network_interface" "fe-vm01-nic" {
  name                = "fe-vm01-nic"
  resource_group_name = azurerm_resource_group.tfr-rg1.name
  location            = azurerm_resource_group.tfr-rg1.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.tfr-fe.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.tfr-pip.id
  }
}

data "azurerm_public_ip" "firstpipi" {
  name                = azurerm_public_ip.tfr-pip.name
  resource_group_name = azurerm_resource_group.tfr-rg1.name

}



resource "azurerm_linux_virtual_machine" "tfe-vm01" {
  name                = "fe-vm01"
  resource_group_name = azurerm_resource_group.tfr-rg1.name
  location            = azurerm_resource_group.tfr-rg1.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = data.azurerm_key_vault_secret.testpw.value
  availability_set_id = azurerm_availability_set.webas.id
  network_interface_ids = [
    azurerm_network_interface.fe-vm01-nic.id,
  ]
  disable_password_authentication = "false"



  connection {
    type     = "ssh"
    user     = "adminuser"
    password = "Password123!"
    host     = data.azurerm_public_ip.firstpipi.ip_address

  }


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  custom_data = filebase64("fe-custom.tpl")

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}