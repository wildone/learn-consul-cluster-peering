locals {
  cluster_id = "gke_${var.project}_${var.dc2_zone}_${local.cluster_name}"
}

output "get-credentials_command" {
  value = "gcloud container clusters get-credentials --zone ${var.dc2_zone} ${local.cluster_name}"
}

output "rename-context_cmd" {
  value = "kubectl config rename-context ${local.cluster_id} dc2"
}
