resource "databricks_pipeline" "this" {
  name    = var.pipeline_name
  storage = "/test/first-pipeline"
#   configuration = {
#     key1 = "value1"
#     key2 = "value2"
#   }

  cluster {
    label       = var.cluster_name
    num_workers = 1
    custom_tags = {
      cluster_type = "default"
    }
  }

  cluster {
    label       = var.cluster_name-1
    num_workers = 1
    custom_tags = {
      cluster_type = "maintenance"
    }
  }

  library {
    notebook {
      path = databricks_notebook.this.id
    }
  }

  continuous = false
}