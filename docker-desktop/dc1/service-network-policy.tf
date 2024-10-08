
resource "helm_release" "network_policy" {
  name       = "edge-stack"
  namespace  = kubernetes_namespace.edge.metadata[0].name
  chart      = "${path.module}/../../helm/network-policy"  # Path to your Helm chart directory

  # You can override default values in the Helm chart via values or set blocks
#   values = [file("${path.module}/values.yaml")]

  set {
    name  = "appLabel"
    value = "node-group-one"
  }
}
