# Variable for EKS Cluster name to deploy ArgoCD
variable "eks_cluster_name" {
  description = "EKS Cluster name to deploy ArgoCD"
  type        = string
}

# Variable for Helm Chart Version of ArgoCD
variable "chart_version" {
  description = "Helm Chart Version of ArgoCD: https://github.com/argoproj/argo-helm/releases"
  type        = string
  default     = "5.46.0"
}
