resource "azurerm_managed_disk" "example" {
  name                 = "myDisk"
  resource_group_name  = azurerm_resource_group.example.name
  location             = azurerm_resource_group.example.location
  storage_account_type = "Premium_LRS"
  disk_size_gb         = 10
  create_option = "Empty"
}