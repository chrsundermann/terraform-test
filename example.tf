provider "azurerm" {
  appid = "418dae67-c1c2-4bc6-ac34-c853e362f7d0"
  secret_key = "534c1ee6-fec0-414c-ad79-771466b24a62"
  tenant     = "63f2c9fc-542b-4758-806f-3cc9c6c78fea"
}

# Create a resource group
resource "azurerm_resource_group" "network" {
  name     = "RG-CHSU-TerraTest"
  location = "West Europe"
}
