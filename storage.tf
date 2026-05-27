resource "random_string" "unique_suffix" {
  length  = 6
  special = false
  upper   = false
}


resource "azurerm_storage_account" "storage" {
  name                     = "${lower(var.storage_account_name)}${random_string.unique_suffix.result}"
  resource_group_name      = var.resource_group
  location                 = var.location
  account_tier             = var.storage_tier
  account_replication_type = var.storage_replication

  public_network_access_enabled = false
  allow_nested_items_to_be_public = false

  lifecycle {
    ignore_changes = [
      tags["Atlas_Project"],
      tags["Capability"],
      tags["Deployment-date"],
      tags["OwnerEmailAddress"],
      tags["Project"],
      tags["Team"]
    ]
  }
}
