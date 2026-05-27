variable "subscription_id" {
  description = "The Azure subscription ID to use for the provider."
  type        = string
}

variable "resource_group" {
  description = "An existing Sandbox Resource Group."
  type        = string
}

variable "location" {
  description = "The Azure region where the storage account will be deployed."
  type        = string
  default     = "UK South"
}

variable "storage_account_name" {
  description = "The name of the storage account. Must be globally unique, lowercase, 3-24 characters."
  type        = string
  default     = "storage_account_test"
}

variable "storage_tier" {
  description = "Defines the Tier to use for this storage account."
  type        = string
  default     = "Standard"
}

variable "storage_replication" {
  description = "Defines the type of replication to use for this storage account."
  type        = string
  default     = "LRS"
}