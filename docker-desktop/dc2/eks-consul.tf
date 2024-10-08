# Create consul namespace
resource "kubernetes_namespace" "consul" {
  metadata {
    name = "consul"
  }
}

# Create Consul deployment
resource "helm_release" "consul" {
  name       = "consul"
  repository = "https://helm.releases.hashicorp.com"
  version    = var.consul_chart_version
  chart      = "consul"
  namespace  = "consul"
  wait       = true
  timeout    = 900 # 15mins timeout to avoid having to re-run `terraform destroy`

  values = [
    templatefile("${path.module}/../../k8s-yamls/consul-helm-dc2.yaml",{
      consul_version = var.consul_version
    })
  ]

  depends_on = [module.eks,
                module.eks.eks_managed_node_groups,
                kubernetes_namespace.consul,
                #module.eks.aws_eks_addon,
                module.vpc,
                ]
}
