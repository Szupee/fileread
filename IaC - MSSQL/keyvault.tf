data "azurerm_key_vault" "mainvault" {
  name                = "azszupee05"
  resource_group_name = "testingLB"
}

data "azurerm_key_vault_secret" "dblogin" {
  name         = "DBlogin"
  key_vault_id = data.azurerm_key_vault.mainvault.id
}

data "azurerm_key_vault_secret" "dbpw" {
  name         = "dbpw"
  key_vault_id = data.azurerm_key_vault.mainvault.id
}

data "azurerm_key_vault_secret" "dbname" {
  name         = "database"
  key_vault_id = data.azurerm_key_vault.mainvault.id
}

data "azurerm_key_vault_secret" "testpw" {
  name         = "secret2"
  key_vault_id = data.azurerm_key_vault.mainvault.id
}

data "azurerm_key_vault_secret" "sqlserver" {
  name         = "sqlservername"
  key_vault_id = data.azurerm_key_vault.mainvault.id
}

/*
check2222
output "secret_value" {
  value     = data.azurerm_key_vault_secret.testpw.value
  sensitive = true
}
*/