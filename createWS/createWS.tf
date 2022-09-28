module "createWS" {
  source      = "../modules/createWS"
  region      = var.region
  username    = var.databricks_account_username
  password    = var.databricks_account_password
  cidr        = var.cidr_block
  account_id  = var.databricks_account_id
  external_id = var.databricks_account_id
  aws_region  = var.region

}