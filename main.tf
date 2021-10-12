# Random string
resource "random_string" "project" {
  length            = 4
  upper             = false
  lower             = true
  number            = true
  special           = false
}

# Logging group
resource "yandex_logging_group" "logging-group" {
  name              = "kubernetes-logging-${random_string.project.result}"
}

# Helm release
resource "helm_release" "fluent-bit" {
  description       = "Deploy fluent-bit chart"
  name              = "fluent-bit"
  chart             = "./helm"
  namespace         = var.kube_namespace
  create_namespace  = true

  set {
      name          = "kubernetes_cluster_id"
      value         = var.kube_cluster_id
  }
  set {
      name          = "logging_group_id"
      value         = yandex_logging_group.logging-group.id
  }
}