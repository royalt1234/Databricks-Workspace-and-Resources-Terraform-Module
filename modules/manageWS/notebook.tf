resource "databricks_notebook" "this" {
  path     = "${data.databricks_current_user.me.home}/${var.notebook_subdirectory}/${var.notebook_filename}"
  language = var.notebook_language
  source   = "./${var.notebook_filename}"
}

# resource "databricks_notebook" "git-test" {
#   path     = "ravi_azureadbadf/azure_realtime_scenarios/python parallel process"
#   language = var.notebook_language
#   source   = "ravi_azureadbadf"
# }

output "notebook_url" {
 value = databricks_notebook.this.url
}