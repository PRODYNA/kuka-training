resource "azurerm_virtual_network" "azurecilium" {
  name                = "azurecilium-vnet"
  address_space       = ["10.0.0.0/8"]
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
}

resource "azurerm_subnet" "azureciliumnodes" {
  name                 = "azurecilium-subnet-node"
  resource_group_name  = data.azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.azurecilium.name
  address_prefixes     = ["10.240.0.0/16"]

}

resource "azurerm_subnet" "azureciliumpods" {
  name                 = "azurecilium-subnet-pods"
  resource_group_name  = data.azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.azurecilium.name
  address_prefixes     = ["10.241.0.0/16"]

  lifecycle {
    ignore_changes = [
      delegation,
    ]
  }
}
