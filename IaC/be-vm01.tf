
resource "azurerm_network_interface" "be-vm01-nic" {
  name                = "be-vm01-nic"
  resource_group_name = azurerm_resource_group.tfr-rg1.name
  location            = azurerm_resource_group.tfr-rg1.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.tfr-be.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.tfr-pip2.id
  }
}

resource "azurerm_linux_virtual_machine" "tfr-be01" {
  name                = "be-vm01"
  resource_group_name = azurerm_resource_group.tfr-rg1.name
  location            = azurerm_resource_group.tfr-rg1.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = data.azurerm_key_vault_secret.testpw.value
  network_interface_ids = [
    azurerm_network_interface.be-vm01-nic.id,
  ]
  disable_password_authentication = "false"

  identity{
    type = "UserAssigned"
    identity_ids =  ["/subscriptions/f628f459-a59f-4ddd-a635-de6caa1b91ac/resourceGroups/testingLB/providers/Microsoft.ManagedIdentity/userAssignedIdentities/vms"]
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  custom_data = filebase64("be-custom.tpl")  

  

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "20.04.202209200"
  }
}
