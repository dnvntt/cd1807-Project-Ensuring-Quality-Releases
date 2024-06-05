provider "azurerm" {
  tenant_id       = "${var.tenant_id}"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  features {}
}

terraform {
  backend "azurerm" {
    storage_account_name = "tfstate1168016874"
    container_name       = "tfstate"
    key                  = "test.terraform.tfstate"
    access_key           = "+JWYj11PG3vNx5GVC4GOJZUj5dC2NaL3eCwZ9q7eCQGJ+abKLZyYEuAINAm0EqiAoLWH7+Van+gU+ASt7c4Utg=="
  }
}

module "network" {
  source               = "../../modules/network"
  address_space        = "${var.address_space}"
  location             = "${var.location}"
  virtual_network_name = "${var.virtual_network_name}"
  application_type     = "${var.application_type}"
  resource_type        = "NET"
  resource_group       = "${var.resource_group}"
  address_prefix_test  = "${var.address_prefix_test}"
}

module "nsg-test" {
  source           = "../../modules/networksecuritygroup"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "NSG"
  resource_group   = "${var.resource_group}"
  subnet_id        = "${module.network.subnet_id_test}"
  address_prefix_test = "${var.address_prefix_test}"
}
module "appservice" {
  source           = "../../modules/appservice"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "KhanhService"
  resource_group   = "${var.resource_group}"
}
module "publicip" {
  source           = "../../modules/publicip"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "publicip"
  resource_group   = "${var.resource_group}"
}
module "vm" {
  source           = "../../modules/vm"
  location         = "${var.location}"
  resource_type    = "vm"
  resource_group   = "${var.resource_group}"
  admin_username   = "${var.admin_username}"
  admin_password   = "${var.admin_password}"
  subnet_id        = "${module.network.subnet_id_test}"
  public_ip = "${module.publicip.public_ip_address_id}"
  //public_key       = "${var.public_key}"
  packer_image     = "${var.packer_image}"
}