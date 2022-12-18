resource "azurerm_storage_queue" "app1queue" {
  name                 = "filereadqueue"
  storage_account_name = azurerm_storage_account.tstorageacc1.name
}