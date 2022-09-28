terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "databricks" {}

// initialize provider in "MWS" mode to provision new workspace
provider "databricks" {
  alias    = "mws"
  host     = "https://accounts.cloud.databricks.com"
  username = var.databricks_account_username
  password = var.databricks_account_password
}