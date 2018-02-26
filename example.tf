provider "azurerm" {
  client_id     = "418dae67-c1c2-4bc6-ac34-c853e362f7d0"
  client_secret = "534c1ee6-fec0-414c-ad79-771466b24a62"
  tenant_id     = "63f2c9fc-542b-4758-806f-3cc9c6c78fea"
  subscription_id = "c356d2d3-7531-47ce-83bc-8938d820f8b1"

}

# Create a resource group
resource "azurerm_resource_group" "network" {
  name     = "RG-CHSU-TerraTest"
  location = "West Europe"
}
