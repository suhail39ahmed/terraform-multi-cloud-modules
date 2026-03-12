# Azure Landing Zone: management groups, subscription placement, RBAC
terraform {
  required_providers {
    azurerm = { source = "hashicorp/azurerm", version = "~> 3.0" }
  }
}

resource "azurerm_management_group" "root" {
  display_name = var.root_management_group_display_name
}

resource "azurerm_management_group" "children" {
  for_each = toset(var.child_management_groups)
  display_name = each.value
  parent_management_group_id = azurerm_management_group.root.id
}

resource "azurerm_role_assignment" "contributor" {
  for_each = var.contributor_principal_ids
  scope                = azurerm_management_group.root.id
  role_definition_name = "Contributor"
  principal_id         = each.value
}
