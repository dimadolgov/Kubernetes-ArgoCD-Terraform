# Define the AWS EKS cluster data source
data "aws_eks_cluster" "this" {
  name = var.eks_cluster_name
}

# Retrieve authentication information for the AWS EKS cluster
data "aws_eks_cluster_auth" "this" {
  name = var.eks_cluster_name
}

# Configure the Helm provider to interact with the Kubernetes cluster
provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.this.endpoint
    token                  = data.aws_eks_cluster_auth.this.token
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
  }
}

# Define a Helm release resource for ArgoCD
resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm" # Official Chart Repo
  chart            = "argo-cd"                              # Official Chart Name
  namespace        = "argocd"
  version          = var.chart_version
  create_namespace = true
  values           = [file("${path.module}/04-argocd.yaml")]
}
