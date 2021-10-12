terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
    helm = {
      source = "hashicorp/helm"
    }
  }
}

provider "yandex" {
  service_account_key_file  = var.provider_key_file
  cloud_id                  = var.cloud_id
  folder_id                 = var.folder_id
  zone                      = var.zone
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}