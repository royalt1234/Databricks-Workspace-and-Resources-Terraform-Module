resource "databricks_job" "this" {
  name = var.job_name
  existing_cluster_id = databricks_cluster.this.cluster_id
  notebook_task {
    notebook_path = databricks_notebook.this.path
  }
  email_notifications {
    on_success = [ data.databricks_current_user.me.user_name ]
    on_failure = [ data.databricks_current_user.me.user_name ]
  }
}

output "job_url" {
  value = databricks_job.this.url
}

resource "databricks_job" "this-1" {
  name = var.multiple_job_name

  job_cluster {
    job_cluster_key = "j"
    new_cluster {
      num_workers   = var.num_workers
      spark_version = data.databricks_spark_version.latest_lts.id
      node_type_id  = data.databricks_node_type.smallest.id
    }
  }

  task {
    task_key = "a"

    new_cluster {
      num_workers   = var.num_workers_task-1
      spark_version = data.databricks_spark_version.latest_lts.id
      node_type_id  = data.databricks_node_type.smallest.id
    }

    notebook_task {
      notebook_path = databricks_notebook.this.path
    }
  }

  task {
    task_key = "b"
    //this task will only run after task a
    depends_on {
      task_key = "a"
    }

    existing_cluster_id = databricks_cluster.this.id

    spark_jar_task {
      main_class_name = "com.acme.data.Main"
    }
  }

  task {
    task_key = "c"

    job_cluster_key = "j"

    notebook_task {
      notebook_path = databricks_notebook.this.path
    }
  }
  //this task starts a Delta Live Tables pipline update
  task {
    task_key = "d"

    pipeline_task {
      pipeline_id = databricks_pipeline.this.id
    }
  }
}