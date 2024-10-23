resource "azurerm_storage_table" "azure-st" {
  name                 = "table"
  storage_account_name = azurerm_storage_account.azure-st.name
}