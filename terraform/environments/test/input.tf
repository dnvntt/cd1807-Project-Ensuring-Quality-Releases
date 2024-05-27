# Azure GUIDS
variable "subscription_id" {
	type    = string
	default = "e2bf10f5-b611-44c7-9617-4a26610fc460"
	description = "subscription id"
}
variable "client_id" {
	type    = string
	default = "402aaa8f-c0b5-45c1-9abb-d70942c11591"
}
variable "client_secret" {
	type    = string
}
variable "tenant_id" {
	type    = string
}

# Resource Group/Location
variable "location" {
	type    = string
}
variable "resource_group" {
	type    = string
}
variable "application_type" {
	type    = string
}

# Network
variable virtual_network_name {
	type    = string
}
variable address_prefix_test {
	type    = string
}
variable address_space {
	type    = list(string)
}

