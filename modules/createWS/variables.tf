variable "databricks_account_username" {
  type        = string
  description = "the account username of your databricks account (this is the email address)"
}
variable "databricks_account_password" {
  type        = string
  description = "password of your databricks account"
}
variable "databricks_account_id" {
  type        = string
  description = "account id of your databricks account"
}

variable "tags" {
  default = {}
}

variable "cidr_block" {
  type = string
}

variable "region" {
  type = string
}

resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 6
}

locals {
  prefix = ""
}