output "rg-name" {
  description = "this gives out the name of rg created"
  value = azurerm_resource_group.myrg.name
}

output "nsg-id" {
    description = "this gives out id of nsg"
    value = azurerm_network_security_group.mynsg.id  
}

output "vnet" {
    description = "this gives out vnet created"
    value = azurerm_virtual_network.myvnet.name
}