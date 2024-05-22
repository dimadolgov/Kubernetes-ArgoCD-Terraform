# Output the version of ArgoCD installed
output "argocd_version" {
  value = helm_release.argocd.metadata[0].app_version
}

# Output the revision of the Helm chart
output "helm_revision" {
  value = helm_release.argocd.metadata[0].revision
}

# Output the version of the Helm chart
output "chart_version" {
  value = helm_release.argocd.metadata[0].version
}
