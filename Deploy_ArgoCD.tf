# Deploy ArgoCD on Development Cluster
module "ArgoCD_DEV" {
  source           = "./03-Deploy_ArgoCD"
  eks_cluster_name = "k8s-dev"
  chart_version    = "5.52.0" # (v2.9.3)
}

# Deploy ArgoCD on Production Cluster
module "ArgoCD_Prod" {
  source           = "./03-Deploy_ArgoCD"
  eks_cluster_name = "k8s-prod"
  chart_version    = "5.50.0" # (v2.8.6)
}

# aws eks update-kubeconfig --name $eks_cluster_name
# kubectl.exe get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
# kubectl port-forward svc/argocd-server -n argocd 8081:443
