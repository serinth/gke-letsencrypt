provider "google" {
  credentials = "${file("gke-cluster-admin-account.json")}"
  project     = "${var.gcp_project_id}"
  region      = "${var.gcp_region}"
}
resource "google_container_cluster" "primary" {
  name               = "${local.env_prefix}"
  zone               = "australia-southeast1-a"
  initial_node_count = 1

  additional_zones = [
    "australia-southeast1-b",
  ]

  master_auth {
    username = "${var.master_cluster_user}"
    password = "${var.master_cluster_password}"
  }

  node_config {
    machine_type = "${var.node_machine_type}"
    disk_size_gb = "${var.node_disk_size}"
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels {
      cluster = "${var.cluster_namespace}"
    }

    tags = ["my-project-tag"]
  }
}