resource "azurerm_network_interface" "" {
  name                = ""
  location            = ""
  resource_group_name = ""

  ip_configuration {
    name                          = "internal"
    subnet_id                     = ""
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = ""
  }
}

resource "azurerm_linux_virtual_machine" "" {
  name                = ""
  location            = ""
  resource_group_name = ""
  size                = "Standard_DS2_v2"
  admin_username      = ""
  network_interface_ids = []
  admin_ssh_key {
    username   = "adminuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC8qtsJDswGbplTeLgJXVi5vQTnKzNTL+pHw1pxZ0ML/y7d0AntutWBcELuv67vWuDzrNJnPXOJoK/ZAjrTSGuvMpIRD7QFpmwhRxXWC9P9uemPnRTCNvTPCrUQIHsaCVe3/C/ZYirPTN0rKwIdoW9dGXZeu19clvZ2hSW35AwQf1QV0cs6VvkIkdw3agLkdio+WoHY+VOMHeW+i0s/06Y0Tvs6u2iBHAzo+XwimZ95k6dD/v6pFX7ceUsFRHBhYy1DIq/AYR+U1ACLKkWPpSU9v0qtYgqy4AJhux/Fjxq6+4rNS4aN2Bo0RLWHlGR1V31agZj3cc+j5EPr7taPVhoUTuBa9LhxiprxoK7jMTVEQbEaL6Yvzfp19cGYe3GUnveUwRuWrgKfxp8oDPMcSQOUTc7+5wkcWZwt0oWWFWO3mCqGm34837oLbZ3xg+0Cc2lnVpyS+oUgjI7SCjQT2l9O2aWmLJPbBsfMmKXQF0HTurz6TtWZqq1bC6+2ZpJ7lzM= khanhdoan@DESKTOP-KhanhDV"
  }
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
