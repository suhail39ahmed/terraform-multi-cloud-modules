variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "tenant_id" {}
variable "current_client_object_id" {}
variable "purge_protection_enabled" { type = bool, default = true }
variable "tags" { type = map(string), default = {} }
