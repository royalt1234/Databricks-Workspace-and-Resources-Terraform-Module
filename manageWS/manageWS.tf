module "manageWS" {
  source                  = "../modules/manageWS"
  host                    = var.host
  token                   = var.token
  cluster_name            = var.cluster_name
  autotermination_minutes = var.cluster_autotermination_minutes
  num_workers             = var.cluster_num_workers
  git_username            = var.git_username
  git_provider            = var.git_provider
  personal_access_token   = var.personal_access_token
  url                     = var.repo_url
  language                = var.notebook_language
  path                    = "${data.databricks_current_user.me.home}/${var.notebook_subdirectory}/${var.notebook_filename}"
  name = [
    {
      name = var.pipeline_name
    },
    {
      name = var.job_name
    }
  ]
}