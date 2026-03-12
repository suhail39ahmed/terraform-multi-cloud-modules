resource "azurerm_key_vault" "kv" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id
  sku_name            = "standard"
  soft_delete_retention_days = 90
  purge_protection_enabled   = var.purge_protection_enabled
  enable_rbac_authorization   = true
  tags = var.tags
}

resource "azurerm_key_vault_access_policy" "current" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = var.tenant_id
  object_id    = var.current_client_object_id
  secret_permissions = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
}
