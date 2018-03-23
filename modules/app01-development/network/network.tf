/**
 * Adesso AG
 * Azure Terraform Configuration Baseline
 *
 * @module      app01-development/network
 * @author      Christian Sundermann <christian.sundermann@adesso.de>
 * @copyright   2018 adesso AG
 * @version     1.0
 **/

##########################################################################
# Resource:     rg_app01_development
# Description:  The resource group resource of the app01 development
#               resources.
##########################################################################
resource "azurerm_resource_group" "rg_app01_development" {
  name     = "rg-${var.identifier}"
  location = "${var.resource_location}"

  tags {
    orchestrator = "terraform"
    company      = "${var.adesso_company}"
    department   = "${var.adesso_department}"
    environment  = "${var.adesso_environment}"
    costcenter   = "${var.adesso_costcenter}"
    owner        = "${var.adesso_owner}"
  }
}

##########################################################################
# Resource:     vnet_app01_development
# Description:  The VNet of the app01 in development
##########################################################################
resource "azurerm_virtual_network" "vnet_app01_development" {
  name                = "vnet-${var.identifier}"
  location            = "${var.resource_location}"
  address_space       = ["${var.vnet_address_space}"]
  resource_group_name = "${azurerm_resource_group.rg_app01_development.name}"
}

##########################################################################
# Resource:     vnet_app01_development/subnets
# Description:  The following resources will create the required 
#               subnets in the vnet_app01_development network.
##########################################################################
resource "azurerm_subnet" "subnet_private" {
  name                 = "private"
  resource_group_name  = "${azurerm_resource_group.rg_app01_development.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet_app01_development.name}"
  address_prefix       = "${var.subnet_private_cidr}"
}

resource "azurerm_subnet" "subnet_public" {
  name                 = "public"
  resource_group_name  = "${azurerm_resource_group.rg_app01_development.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet_app01_development.name}"
  address_prefix       = "${var.subnet_public_cidr}"
}
