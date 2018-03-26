/**
 * Adesso AG
 * Azure Terraform Configuration Baseline
 *
 * @module      core-primaryhub
 * @author      Christian Sundermann <christian.sundermann@adesso.de>
 * @copyright   2018 adesso AG
 * @version     1.0
 **/

module "network" {
  source = "./network"

  identifier                   = "${var.identifier}"
  resource_location            = "${var.resource_location}"
  vnet_address_space           = "${var.vnet_address_space}"
  subnet_vpngateway_cidr       = "${var.subnet_vpngateway.cidr}"
  subnet_dmz_cidr              = "${var.subnet_dmz_cidr}"
  subnet_management_cidr       = "${var.subnet_management_cidr}"
  subnet_sharedcomponents_cidr = "${var.subnet_sharedcomponents_cidr}"
}
