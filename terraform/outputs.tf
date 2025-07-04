output "frontend_ip" {
  description = "Public IP of the frontend VM"
  value       = azurerm_public_ip.frontend.ip_address
}

output "backend_ip" {
  description = "Public IP of the backend VM"
  value       = azurerm_public_ip.backend.ip_address
}

output "database_ip" {
  description = "Public IP of the database VM"
  value       = azurerm_public_ip.database.ip_address
}

