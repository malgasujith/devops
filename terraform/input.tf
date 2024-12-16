variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "load"
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
  default     = "vnet"
}

variable "vnet_address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet1_name" {
  description = "The name of the first subnet."
  type        = string
  default     = "subnet1"
}

variable "subnet1_prefix" {
  description = "The address prefix for the first subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet2_name" {
  description = "The name of the second subnet."
  type        = string
  default     = "subnet2"
}

variable "subnet2_prefix" {
  description = "The address prefix for the second subnet."
  type        = string
  default     = "10.0.2.0/24"
}

variable "admin_username" {
  description = "The admin username for the VM instances."
  type        = string
  default = "az"
}


variable "vm_size" {
  description = "The size of the VM instances."
  type        = string
  default     = "Standard_A1"
}
