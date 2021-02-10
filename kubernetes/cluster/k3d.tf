module "k3d_demo_cluster" {
  source             = "github.com/infra-as-code-workshop/terraform-modules/k3d"
  cluster_name       = "opa"
  node_count         = 3
  kubernetes_version = "1.20.2"
  registry_port      = 5002
}

output "kubeconfig" {
  value = "export KUBECONFIG=${pathexpand(module.k3d_demo_cluster.kube_config)}"
}
