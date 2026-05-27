resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group
  location                 = var.location
  account_tier             = var.storage_tier
  account_replication_type = var.storage_replication

  public_network_access_enabled = false

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
