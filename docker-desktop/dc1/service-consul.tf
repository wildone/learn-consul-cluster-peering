
# Create the namespace if it doesn't exist
resource "kubernetes_namespace" "edge" {
  metadata {
    name = var.edge_namespace
  }
}
# Create Consul deployment
resource "helm_release" "consul" {
  name       = "consul"
  namespace  = kubernetes_namespace.edge.metadata[0].name
  repository = "https://helm.releases.hashicorp.com"
  version    = var.consul_chart_version
  chart      = "consul"
  wait       = true
  timeout    = 900 # 15mins timeout to avoid having to re-run `terraform destroy`

  create_namespace = false

  values = [
    templatefile("${path.module}/../../k8s-yamls/consul-helm-dc1.yaml",{
      consul_version = var.consul_version
    })
  ]

  depends_on = [
    kubernetes_namespace.edge,
  ]
}

## Create API Gateway
data "kubectl_path_documents" "api_gw_manifests" {
  pattern = "${path.module}/../../k8s-yamls/api-gateway*.yaml"
}

resource "kubectl_manifest" "api_gw" {
  for_each   = toset(data.kubectl_path_documents.api_gw_manifests.documents)
  yaml_body  = each.value
  depends_on = [helm_release.consul]
}
