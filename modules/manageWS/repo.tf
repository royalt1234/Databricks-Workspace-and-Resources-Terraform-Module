resource "databricks_git_credential" "ado" {
  git_username          = var.git_username
  git_provider          = var.git_provider
  personal_access_token = var.personal_access_token
}

resource "databricks_repo" "nutter_in_home" {
  url = var.repo_url
}