resource "azurerm_network_interface" "nic" {
  name                = "nic0"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
	public_ip_address_id          = "${var.public_ip}"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm0"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  size                = "Standard_DS2_v2"
  admin_username      = "${var.admin_username}"
  admin_password      = "${var.admin_password}"
  network_interface_ids = [azurerm_network_interface.nic.id]
  disable_password_authentication = false
  /*admin_ssh_key {
    username   = "${var.admin_username}"
    public_key = "${var.public_key}"
  }*/
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_id   = "${var.packer_image}"
 
  tags = {
    environment = "test"
  }
}
