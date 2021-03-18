terraform {
   required_version = ">= 0.14"
   backend "azurerm" {
    key = "terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "terraform_rg" {
  name = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "tf_vnet" {
  name = "Terraform-VNet"
  address_space = var.vnet_cidr
  location = var.location
  resource_group_name   = azurerm_resource_group.terraform_rg.name

}

resource "azurerm_subnet" "tf_subnet_1" {
  name = "Subnet-1"
  address_prefixes = var.subnet1_cidr
  virtual_network_name = azurerm_virtual_network.tf_vnet.name
  resource_group_name = azurerm_resource_group.terraform_rg.name
}

resource "azurerm_subnet" "tf_subnet_2" {
  name = "Subnet-2"
  address_prefixes = var.subnet2_cidr
  virtual_network_name = azurerm_virtual_network.tf_vnet.name
  resource_group_name = azurerm_resource_group.terraform_rg.name
}
