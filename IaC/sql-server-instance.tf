
resource "azurerm_sql_server" "webappsql" {
  name                         = data.azurerm_key_vault_secret.sqlserver.value
  resource_group_name          = azurerm_resource_group.tfr-rg1.name
  location                     = azurerm_resource_group.tfr-rg1.location
  version                      = "12.0"
  administrator_login          = data.azurerm_key_vault_secret.dblogin.value
  administrator_login_password = data.azurerm_key_vault_secret.dbpw.value

}

resource "azurerm_sql_database" "webapponstance1" {
  name                = data.azurerm_key_vault_secret.dbname.value
  resource_group_name = azurerm_resource_group.tfr-rg1.name
  location            = azurerm_resource_group.tfr-rg1.location
  server_name         = azurerm_sql_server.webappsql.name
  edition             = "Basic"
}

resource "azurerm_sql_firewall_rule" "sqlinstancerule1" {
  name                = "FirewallRule1"
  resource_group_name = azurerm_resource_group.tfr-rg1.name
  server_name         = azurerm_sql_server.webappsql.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
