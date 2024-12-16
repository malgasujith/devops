output "ssh" {
  value = "http://${azurerm_public_ip.load_balancer_public_ip.ip_address}/art"
}
