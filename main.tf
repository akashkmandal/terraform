terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
  
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
  
}
# Create multiple resource group uing count/index
resource "azurerm_resource_group" "example" {
 # name     = "demo.${count.index}"
 # count    = 2
  name = "DemoRG"
  location = "Central India"
}

resource "azurerm_virtual_network" "demonet" {
  count = length(var.vnets)
  name = var.vnets[count.index].vnet_name
  location = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = var.vnets[count.index].address_space
}
