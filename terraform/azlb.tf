resource "azurerm_public_ip" "load_balancer_public_ip" {
  name                = "loadBalancerPublicIP"
  location            = azurerm_resource_group.load.location
  resource_group_name = azurerm_resource_group.load.name
  allocation_method   = "Static"
  sku                 = "Standard"

  depends_on = [var.resource_group_name,azurerm_lb.load_balancer]

}

resource "azurerm_lb" "load_balancer" {
  name                = "loadBalancer"
  location            = azurerm_resource_group.load.location
  resource_group_name = azurerm_resource_group.load.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "LoadBalancerFrontEnd"
    public_ip_address_id = azurerm_public_ip.load_balancer_public_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name                = "BackEndAddressPool"
  loadbalancer_id     = azurerm_lb.load_balancer.id
  virtual_network_id  = azurerm_virtual_network.vnet.id
}

resource "azurerm_lb_probe" "http_probe" {
  name                = "httpProbe"
  loadbalancer_id     = azurerm_lb.load_balancer.id
  protocol            = "Http"
  port                = 80
  request_path        = "/"
  interval_in_seconds = 5
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "http_rule" {
  name                           = "http-rule"
  loadbalancer_id                = azurerm_lb.load_balancer.id
  frontend_ip_configuration_name = azurerm_lb.load_balancer.frontend_ip_configuration[0].name
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool.id]
  probe_id                       = azurerm_lb_probe.http_probe.id
}


