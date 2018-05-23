resource "azurerm_resource_group" "hashidemo" {
  name     = "api-rg-pro"
  location = "West Europe"
}

resource "azurerm_mysql_server" "hashidemo" {
  name                = "mysql-server-1"
  location            = "${azurerm_resource_group.hashidemo.location}"
  resource_group_name = "${azurerm_resource_group.hashidemo.name}"

  sku {
    name     = "MYSQLB50"
    capacity = 50
    tier     = "Basic"
  }

  administrator_login          = "mysqladminun"
  administrator_login_password = "H@Sh1CoR3!"
  version                      = "5.7"
  storage_mb                   = "51200"
  ssl_enforcement              = "Enabled"
}

resource "azurerm_mysql_database" "hashidemo" {
  name                = "exampledb"
  resource_group_name = "${azurerm_resource_group.hashidemo.name}"
  server_name         = "${azurerm_mysql_server.hashidemo.name}"
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}
