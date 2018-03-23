##########################################################################
# Identifier:   app01-production
# Module-Name:  app01-production
# Description:  This module configures the App01 in the
#               given Azure Region.
##########################################################################

module "app01-production" {
  source = "../../modules/app01-production"

  providers {
    "azurerm" = "azurerm.adesso.partner"
  }

  ################################################
  # baseline configuration
  ################################################

  identifier        = "app01-production"
  resource_location = "${var.resource_location}"

  ################################################
  # Ownership & adesso specific configuration 
  ################################################

  adesso_department  = "${var.adesso_department}"
  adesso_environment = "${var.adesso_environment}"
  adesso_costcenter  = "${var.adesso_costcenter}"
  adesso_owner       = "${var.adesso_owner}"

  ################################################
  # network configuration
  ################################################

  vnet_address_space  = "160.0.0.0/24"
  subnet_private_cidr = "160.0.0.0/25"
  subnet_public_cidr  = "160.0.0.128/25"
}

##########################################################################
# Identifier:   app02-production
# Module-Name:  app02-production
# Description:  This module configures the app02 in the
#               given Azure Region.
##########################################################################


# module "app02-production" {
#   source = "../../modules/app02-production"


#   providers {
#     "azurerm" = "azurerm.adesso.partner"
#   }


#   ################################################
#   # baseline configuration
#   ################################################


#   identifier        = "app02-production"
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


#   vnet_address_space  = "160.0.0.0/24"
#   subnet_private_cidr = "160.0.0.0/25"
#   subnet_public_cidr  = "160.0.0.128/25"
# }

