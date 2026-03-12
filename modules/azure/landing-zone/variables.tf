variable "root_management_group_display_name" { type = string }
variable "subscription_ids" { type = list(string), default = [] }
variable "child_management_groups" { type = list(string), default = [] }
variable "contributor_principal_ids" { type = set(string), default = [] }
