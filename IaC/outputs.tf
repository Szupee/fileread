/*
output "be-vm01nic" {
  value       = azurerm_network_interface.be-vm01-nic.private_ip_address 
  description = "description"
  
}
*/
output "fe-vm01-nic" {
  value       = azurerm_network_interface.fe-vm01-nic.private_ip_address
  description = "description"

}

output "fe-vm02-nic" {
  value       = azurerm_network_interface.fe-vm02-nic.private_ip_address
  description = "description"

}


