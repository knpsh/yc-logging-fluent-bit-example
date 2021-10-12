variable "folder_id" {
    description = "Yandex.Cloud folder_id"
}

variable "cloud_id" {
    description = "Yandex.Cloud cloud_id"
}

variable "zone" {
    description = "Yandex.Cloud region"
    default = "ru-central1-a"
}

variable "provider_key_file" {
    description = "Yandex.Cloud service account key file"
    default = "./key.json"
}

variable "kube_namespace" {
    description = "Namespace for fluent-bit in Kubernetes"
    default     = "fluent-bit"
}

variable "kube_cluster_id" {
    description = "YC Kubernetes cluster id"
    default = ""
}