provider "azurerm" {
  client_id     = "418dae67-c1c2-4bc6-ac34-c853e362f7d0"
  client_secret = "534c1ee6-fec0-414c-ad79-771466b24a62"
  tenant_id     = "63f2c9fc-542b-4758-806f-3cc9c6c78fea"
  subscription_id = "c356d2d3-7531-47ce-83bc-8938d820f8b1"
}

# Create a resource group
resource "azurerm_resource_group" "rgnet" {
  name     = "RG-CHSU-Network"
  location = "West Europe"
}

resource "azurerm_resource_group" "rgshared" {
  name     = "RG-CHSU-SharedComponents"
  location = "West Europe"
}

resource "azurerm_resource_group" "rgadfs" {
  name     = "RG-CHSU-ADFS"
  location = "West Europe"
}

resource "azurerm_resource_group" "rgwap" {
  name     = "RG-CHSU-WAP"
  location = "West Europe"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "primhub" {
  name                = "VNET-PRIMHUB01"
  address_space       = ["10.115.0.0/20"]
  location            = "${azurerm_resource_group.rgnet.location}"
  resource_group_name = "${azurerm_resource_group.rgnet.name}"
}

#Create Subnets in Vnet

resource "azurerm_subnet" "gw" {
  name                 = "sn-gateway"
  resource_group_name  = "${azurerm_resource_group.rgnet.name}"
  virtual_network_name = "${azurerm_virtual_network.primhub.name}"
  address_prefix       = "10.115.0.0/28"
}

resource "azurerm_subnet" "vpn" {
  name                 = "sn-vpn"
  resource_group_name  = "${azurerm_resource_group.rgnet.name}"
  virtual_network_name = "${azurerm_virtual_network.primhub.name}"
  address_prefix       = "10.115.0.32/28"
}

resource "azurerm_subnet" "dmzin" {
  name                 = "sn-dmzprivatein"
  resource_group_name  = "${azurerm_resource_group.rgnet.name}"
  virtual_network_name = "${azurerm_virtual_network.primhub.name}"
  address_prefix       = "10.115.0.64/27"
  network_security_group_id = "${azurerm_network_security_group.privatedmzin.id}"
}

resource "azurerm_subnet" "dmzout" {
  name                 = "sn-dmzprivateout"
  resource_group_name  = "${azurerm_resource_group.rgnet.name}"
  virtual_network_name = "${azurerm_virtual_network.primhub.name}"
  address_prefix       = "10.115.0.96/27"
}

resource "azurerm_subnet" "mgmt" {
  name                 = "sn-mgmt"
  resource_group_name  = "${azurerm_resource_group.rgnet.name}"
  virtual_network_name = "${azurerm_virtual_network.primhub.name}"
  address_prefix       = "10.115.0.128/26"
}

#Create a NetworkSecurityGroup

resource "azurerm_network_security_group" "privatedmzin" {
  name                = "nsg-privatedmzin"
  location            = "${azurerm_resource_group.rgnet.location}"
  resource_group_name = "${azurerm_resource_group.rgnet.name}"
  

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags {
    environment = "Production"
    owner       = "CHSU"
    department  = "SPLAM"
  }
}
