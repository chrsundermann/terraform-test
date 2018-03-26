##########################################################################
# Identifier:   primaryhub01
# Module-Name:  core-primaryhub
# Description:  This module configures the primaryhub in the
#               given Azure Region.
##########################################################################
module "core-primaryhub01" {
  source = "../../modules/core-primaryhub"

  providers = {
    "azurerm" = "azurerm.partner"
  }

  ################################################
  # baseline configuration
  ################################################

  identifier        = "primaryhub-01"
  resource_location = "${var.resource_location}"

  ################################################
  # Ownership & adesso specific configuration
  ################################################

  adesso_company     = "${var.adesso_company}"
  adesso_department  = "${var.adesso_department}"
  adesso_environment = "${var.adesso_environment}"
  adesso_costcenter  = "${var.adesso_costcenter}"
  adesso_owner       = "${var.adesso_owner}"

  ################################################
  # network configuration
  ################################################

  vnet_address_space           = "172.0.255.0/24"
  subnet_vpngateway_cidr       = "172.0.255.0/28"
  subnet_dmz_cidr              = "172.0.255.16/28"
  subnet_management_cidr       = "172.0.255.64/26"
  subnet_sharedcomponents_cidr = "172.0.255.128/25"
}
