provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "il-central-1"
}

module "vpc_main" {
  source              = "git@github.com:dimadolgov/Terraform.git//aws_network"
  project_name        = "Project_K8S"
  env                 = "Kubernetes"
  vpc_cidr_block      = "10.10.0.0/16"
  public_subnet_cidr  = ["10.10.10.0/24", "10.10.11.0/24"]
  private_subnet_cidr = []
}
output "vpc_id" {
  value = module.vpc_main.vpc_id
}
output "public_subnet_ids" {
  value = module.vpc_main.public_subnet_ids
}
output "private_subnet_ids" {
  value = module.vpc_main.private_subnet_ids
}
