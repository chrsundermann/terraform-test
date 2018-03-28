/**
 * Adesso AG
 * Azure Terraform Configuration Baseline
 *
 * @module      core-primaryhub/network
 * @author      Christian Sundermann <christian.sundermann@adesso.de>
 * @copyright   2018 adesso AG
 * @version     1.0
 **/

##########################################################################
# Resource:     rg_core_primaryhub
# Description:  The resource group resource of the core primaryhub
#               resources.
##########################################################################
resource "azurerm_resource_group" "rg_core_primaryhub" {
  name     = "rg-${var.identifier}"
  location = "${var.resource_location}"

  tags {
    orchestrator = "terraform"
    company      = "${var.adesso_department}"
    department   = "${var.adesso_department}"
    environment  = "${var.adesso_environment}"
    costcenter   = "${var.adesso_costcenter}"
    owner        = "${var.adesso_owner}"
  }
}

##########################################################################
# Resource:     vnet_core_primaryhub
# Description:  The VNet of the app01 in development
##########################################################################
resource "azurerm_virtual_network" "vnet_core_primaryhub" {
  name                = "vnet-${var.identifier}"
  location            = "${var.resource_location}"
  address_space       = "${var.address_space}"
  resource_group_name = "${azurerm_resource_group.rg_core_primaryhub.name}"
}

##########################################################################
# Resource:     vnet_core_primaryhub/subnets
# Description:  The following resources will create the required 
#               subnets in the vnet_app01_development network.
##########################################################################
resource "azurerm_subnet" "subnet_vpngateway" {
  name                 = "GatewaySubnet"
  resource_group_name  = "${azurerm_resource_group.rg_core_primaryhub.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet_core_primaryhub.name}"
  address_prefix       = "${var.subnet_vpngateway_cidr}"
}

resource "azurerm_subnet" "subnet_dmz" {
  name                 = "dmz"
  resource_group_name  = "${azurerm_resource_group.rg_core_primaryhub.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet_core_primaryhub.name}"
  address_prefix       = "${var.subnet_dmz.cidr}"
}
