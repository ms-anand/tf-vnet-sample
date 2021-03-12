variable "location" {
  description = "The default Azure region for the resource provisioning"
}

variable "resource_group_name" {
  description = "Resource group name that will contain various resources"
}

variable "vnet_cidr" {
  description = "CIDR block for Virtual Network"
}

variable "subnet1_cidr" {
  description = "CIDR block for Subnet within a Virtual Network"
}

variable "subnet2_cidr" {
  description = "CIDR block for Subnet within a Virtual Network"
}
