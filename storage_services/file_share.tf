resource "azurerm_storage_share" "azure-ss" {
  name                 = "FileShare"
  storage_account_name = azurerm_storage_account.mainStorageAccount.name
  quota                = 50
}