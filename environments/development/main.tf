##########################################################################
# Identifier:   app01-development
# Module-Name:  app01-development
# Description:  This module configures the App01 in the
#               given Azure Region.
##########################################################################

module "app01-development" {
  source = "../../modules/app01-development"

  providers {
    "azurerm" = "azurerm.adesso.partner"
  }

  ################################################
  # baseline configuration
  ################################################

  identifier        = "app01-development"
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

  vnet_address_space  = "172.0.0.0/24"
  subnet_private_cidr = "172.0.0.0/25"
  subnet_public_cidr  = "172.0.0.128/25"
}

##########################################################################
# Identifier:   app02-development
# Module-Name:  app02-development
# Description:  This module configures the App02 in the
#               given Azure Region.
##########################################################################


# module "app02-development" {
#   source = "../../modules/app02-development"


#   providers {
#     "azurerm" = "azurerm.adesso.partner"
#   }


#   ################################################
#   # baseline configuration
#   ################################################


#   identifier        = "app02-development"
#   resource_location = "${var.resource_location}"


#   ################################################
#   # Ownership & adesso specific configuration
#   ################################################


#   adesso_company     = "${var.adesso_company}"
#   adesso_department  = "${var.adesso_department}"
#   adesso_environment = "${var.adesso_environment}"
#   adesso_costcenter  = "${var.adesso_costcenter}"
#   adesso_owner       = "${var.adesso_owner}"


#   ################################################
#   # network configuration
#   ################################################


#   vnet_address_space  = "172.0.1.0/24"
#   subnet_private_cidr = "172.0.1.0/25"
#   subnet_public_cidr  = "172.0.1.128/25"
# }

