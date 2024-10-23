provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "azure-rg" {
  name     = "mainResourceGroup"
  location = "Brazil South"
}

resource "azurerm_storage_account" "azure-sa" {
  name                     = "mainStorageAccount"
  resource_group_name       = azurerm_resource_group.rg-azure-main
  location                  = azurerm_resource_group.rg-azure.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
}

resource "azurerm_storage_container" "azure-sc" {
  name                  = "container"
  storage_account_name  = azurerm_storage_account.azure-sa.name
  container_access_type = "private"
}