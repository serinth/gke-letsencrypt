variable "master_cluster_user" {}
variable "master_cluster_password" {}

variable "gcp_project_id" {
    description = "GCP unique identifier for MY PROJECT"
    default = "my-default-project"
}
variable "gcp_region" {
    default = "australia-southeast1"
}
variable "cluster_namespace" {
    default = "MY PROJECT"
}

variable "node_machine_type" {
    default = "n1-standard-2"
}

variable "node_disk_size" {
    default = "20"
}

locals {
    env_prefix = "${var.cluster_namespace}-${terraform.workspace}"
}