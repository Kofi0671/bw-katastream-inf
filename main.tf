resource "azurerm_resource_group" "dev-nonprod-rg" {
  name     = var.azurerm_resource_group_name
  location = var.location

}

resource "azurerm_storage_account" "dev-nonprod-storage" {
  name                     = var.azurerm_storage_account
  resource_group_name      = azurerm_resource_group.dev-nonprod-rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = true

}

resource "azurerm_storage_container" "dev-nonprod-container" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.dev-nonprod-storage
  container_access_type = "container" # "blob" "private"

}

resource "azurerm_storage_blob" "dev-nonprod-blob" {
  name                   = "sample-file.sh"
  storage_account_name   = azurerm_storage_account.dev-nonprod-storage
  storage_container_name = azurerm_storage_container.dev-nonprod-container
  type                   = "Block"
  source                 = "commands.sh"

}

/*resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = true
}

resource "azurerm_storage_container" "container" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "container" # "blob" "private"
}

resource "azurerm_storage_blob" "blob" {
  name                   = "sample-file.sh"
  storage_account_name   = azurerm_storage_account.storage.name
  storage_container_name = azurerm_storage_container.container.name
  type                   = "Block"
  source                 = "commands.sh"
}*/