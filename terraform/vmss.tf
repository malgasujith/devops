resource "azurerm_linux_virtual_machine_scale_set" "vmss" {

  name                            = "vmss"
  resource_group_name             = azurerm_resource_group.load.name
  location                        = azurerm_resource_group.load.location
  admin_username                  = "az"
  sku                             = "Standard_F2"
  instances                       = 1
  disable_password_authentication = true


  admin_ssh_key {
    username   = "az"
    public_key = local.public_key
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }


  network_interface {
    name    = "vmss-nic"
    primary = true
    ip_configuration {
      name      = "vmss-ipconfig"
      primary   = true
      subnet_id = azurerm_subnet.subnet1.id
      load_load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.backend_pool.id]
    }
  }
  custom_data = filebase64("input.sh")
}
