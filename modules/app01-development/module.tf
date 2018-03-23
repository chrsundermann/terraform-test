/**
 * Adesso AG
 * Azure Terraform Configuration Baseline
 *
 * @module      app01-development
 * @author      Christian Sundermann <christian.sundermann@adesso.de>
 * @copyright   2018 adesso AG
 * @version     1.0
 **/

module "network" {
  source = "./network"

  identifier          = "${var.identifier}"
  resource_location   = "${var.resource_location}"
  vnet_address_space  = "${var.vnet_address_space}"
  subnet_private_cidr = "${var.subnet_private_cidr}"
  subnet_public_cidr  = "${var.subnet_public_cidr}"
}

# module "networksecuritygroups" {
#     source "./networksecuritygroups"


#     identifier = "${var.identifier}"
#     resource_location = "${var.resource_location}"
#     vnet_address_space = "${var.vnet_address_space}"
#     subnet_private_cidr = "${var.subnet_private_cidr}"
#     subnet_public_cidr = "${var.subnet_public_cidr}"
# }

