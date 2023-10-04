terraform {
  required_version = "1.5.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.74"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "azurerm" {
  features {}
}

# Random Block
resource "random_string" "myrandom" {
  length  = 4
  special = false
  upper   = false
}
# RESOURCE GROUP    
resource "azurerm_resource_group" "myrg" {
  name     = "myrg"
  location = "eastus"
}

#VNET-1
resource "azurerm_virtual_network" "myvnet" {
  name                = var.Vnet
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  address_space       = var.vnet-address
}

resource "azurerm_subnet" "sn1" {
  name                 = var.subnet
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = var.subnet-address
}

# NSG
resource "azurerm_network_security_group" "mynsg" {
  name                = var.nsg
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  security_rule {
    name                       = "ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}


# Subnet & NSG Association
resource "azurerm_subnet_network_security_group_association" "nsg1-work" {
  network_security_group_id = azurerm_network_security_group.mynsg.id
  subnet_id                 = azurerm_subnet.sn1.id
}
