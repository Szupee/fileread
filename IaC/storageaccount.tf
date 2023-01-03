/*
resource "azurerm_storage_account" "tstorageacc1" {
  name                     = "filereadstorage"
  resource_group_name      = azurerm_resource_group.tfr-rg1.name
  location                 = azurerm_resource_group.tfr-rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


*/