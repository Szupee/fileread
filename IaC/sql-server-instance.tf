resource "azurerm_sql_server" "webappsql" {
  name                         = "filereadsql012"
  resource_group_name = azurerm_resource_group.tfr-rg1.name
  location            = azurerm_resource_group.tfr-rg1.location
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"

}

resource "azurerm_sql_database" "webapponstance1" {
  name                = "webapponstance1"
  resource_group_name = azurerm_resource_group.tfr-rg1.name
  location            = azurerm_resource_group.tfr-rg1.location
  server_name         = azurerm_sql_server.webappsql.name
  edition = "basic"
}

resource "azurerm_sql_firewall_rule" "sqlinstancerule1" {
  name                = "FirewallRule1"
  resource_group_name = azurerm_resource_group.tfr-rg1.name
  server_name         = azurerm_sql_server.webappsql.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}