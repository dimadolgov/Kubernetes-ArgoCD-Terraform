# Kubernetes ArgoCD Terraform Deployment

This repository contains Terraform configurations and Kubernetes manifests for deploying infrastructure and ArgoCD on AWS using Terraform and Kubernetes EKS.

## Table of Contents

- [Folder Structure](#folder-structure)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Deployments](#deployments)
- [Accessing ArgoCD](#accessing-argocd)
- [Useful Commands](#useful-commands)

## Folder Structure

The repository is organized into the following folders:

1. **01-Create_VPC**: Terraform configuration for creating a Virtual Private Cloud (VPC) on AWS.
2. **02-Create_EKS**: Kubernetes manifests for creating AWS Elastic Kubernetes Service (EKS) clusters in a custom VPC.
3. **03-Deploy_ArgoCD**: Terraform configuration and Kubernetes manifests for deploying ArgoCD on AWS EKS clusters.
4. **root folder**: Terraform configuration for deploying ArgoCD on development and production EKS clusters.

## Prerequisites

Before you begin, ensure you have the following prerequisites:

- AWS CLI configured with appropriate permissions.
- Terraform installed locally.
- kubectl installed locally.
- eksctl installed locally.
- Helm installed locally.

## Setup

1. **01-Create_VPC**: Update `01-provider.tf` with your AWS access key and secret key.
   - Run `terraform init` to initialize the Terraform configuration.
   - Run `terraform apply` to create the VPC.

2. **02-Create_EKS**: Update `eks_cluster_dev.yaml` and `eks_cluster_prod.yaml` with your VPC and subnet details.
   - Run `eksctl create cluster -f eks_cluster_dev.yaml` to create the development EKS cluster.
   - Run `eksctl create cluster -f eks_cluster_prod.yaml` to create the production EKS cluster.

3. **03-Deploy_ArgoCD**: Update `01-main.tf` and `03-variables.tf` with your EKS cluster name and desired ArgoCD version.
   - Run `terraform init` to initialize the Terraform configuration.
   - Run `terraform apply` to deploy ArgoCD on the specified EKS clusters.

## Deployments

The root folder contains `Deploy_ArgoCD.tf` for deploying ArgoCD on development and production EKS clusters.

## Accessing ArgoCD

To access ArgoCD, follow these steps:

1. Run `aws eks update-kubeconfig --name <eks_cluster_name>` to update the kubeconfig for the EKS cluster.
2. Retrieve the initial admin password for ArgoCD:
   ```bash
   kubectl get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d


## Useful Commands
- `terraform init`: Initialize Terraform configurations.
- `terraform apply`: Apply Terraform configurations.
- `eksctl create cluster -f <cluster_config.yaml>`: Create an EKS cluster.
- `kubectl get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`: Retrieve ArgoCD initial admin password.
- `kubectl port-forward svc/argocd-server -n argocd 8081:443`: Port forward to access ArgoCD UI.


   
