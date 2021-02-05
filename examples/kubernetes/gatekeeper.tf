resource "helm_release" "gatekeeper" {
  depends_on = [
    module.k3d_demo_cluster
  ]

  chart      = "gatekeeper"
  repository = "https://open-policy-agent.github.io/gatekeeper/charts"
  name       = "gatekeeper"
}