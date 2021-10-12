## fluent-bit with k8s to YC Cloud Logging

# Description

Terraform module creates the Cloud Logging log-group and deploys fluent-bit with required configuration to the cluster configured in `~/.kube/config`. Kubernetes cluster ID is required for filtering purposes in Cloud Logging dashboard.
This module requires two `key.json` file placed in `./helm` and `./` folders respectively. The first one will be used by fluent-bit service, and the second one is required to deploy Terraform module.

# Prerequisites

1. Cloud Logging service account `key.json` file with the following folder roles:
- `logging.writer`
- `monitoring.editor`

2. Kubernetes cluster ID (optional)
3. Kubernetes authentication configured (`~/.kube/config` must already exist)
3. YC configuration variables: `folder_id`, `cloud_id` (can be obtained through `yc config list`)
4. Terraform provider authentication through service account `key.json` file

# Steps

1. Save Cloud Logging service account `key.json` file to `./helm` folder
2. Save Terraform provider service account `key.json` file to the top folder `./`
3. Fill `private.auto.tfvars` file with the following data:
```
cloud_id = "xxx"
folder_id = "xxx"
kube_cluster_id = "xxx"
```
4. Run `terraform init` and `terraform apply`

# Using Helm only

You can use Helm chart directly if you want.
Just fill the `./helm/values.yaml` file with the Cloud Logging group ID and Kubernetes cluster ID.
And place the Cloud Logging service account `key.json` file in the `./helm` folder.
After that, run `helm install` command.

# Notes

`config.yaml` file in the root of this folder is temporary and exists only to display various options available to configure in fluent-bit plugin. Configuration file that is actually used during deployment through Terraform/Helm is located at `./helm/templates/config-map.yaml`

Creation of `key.json` for service accounts is described [here](https://cloud.yandex.com/en/docs/iam/operations/iam-token/create-for-sa).