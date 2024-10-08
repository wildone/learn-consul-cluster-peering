variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "consul_chart_version" {
  type        = string
  description = "The Consul Helm chart version to use"
  default     = "1.3.0"
}

variable "consul_version" {
  type        = string
  description = "The Consul version to use"
  default     = "1.17.0"
}

# Namespace for edge services
variable "edge_namespace" {
  description = "Kubernetes namespace for edge services"
  type        = string
  default     = "edge-services"
}

# Path to the kubeconfig file for the edge cluster
variable "edge_kubeconfig_path" {
  description = "Path to the kubeconfig file for the edge cluster"
  type        = string
  default     = "./edge/kubeconfig_edge"
}

# Kubeconfig context for the edge cluster, this should be docker-desktop for local development
variable "edge_kubeconfig_context" {
  description = "Kubeconfig context for the edge cluster"
  type        = string
  default     = "docker-desktop"
}
