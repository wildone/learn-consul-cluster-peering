terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.24.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.12.1"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.1"
    }
  }

  required_version = ">= 1.2.0"
}

provider "kubernetes" {
  config_path    = var.edge_kubeconfig_path
  config_context = var.edge_kubeconfig_context
}

provider "helm" {
  kubernetes {
    config_path = var.edge_kubeconfig_path
  }
}

provider "kubectl" {
  load_config_file       = false
}

