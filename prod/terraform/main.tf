terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }

  # Uncomment to use remote state storage
  # backend "s3" {
  #   bucket         = "your-terraform-state-bucket"
  #   key            = "airbyte/staging/terraform.tfstate"
  #   region         = "us-east-2"
  #   encrypt        = true
  #   dynamodb_table = "terraform-lock-table"
  # }
}

provider "aws" {
  region = var.aws_region
}

# Local variables for better organization
locals {
  common_tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
    Project     = "superset"
  }
}

resource "aws_eks_node_group" "airbyte_on_demand" {
  # Basic configuration
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids

  # Scaling configuration
  scaling_config {
    desired_size = var.scaling_config.desired_size
    min_size     = var.scaling_config.min_size
    max_size     = var.scaling_config.max_size
  }

  # Node configuration
  disk_size      = var.disk_size
  instance_types = var.instance_types
  ami_type       = "AL2_x86_64"
  capacity_type  = "ON_DEMAND"
  version        = var.kubernetes_version

  # Labels for Kubernetes
  labels = {
    "superset-workers"  = "true"
    "superset-platform" = "true"
  }

  # AWS tags
  tags = merge(
    local.common_tags,
    {
      "Name"                                          = var.node_group_name
      "CostCenter"                                    = var.node_group_name
      "k8s.io/cluster-autoscaler/enabled"             = "true"
      "k8s.io/cluster-autoscaler/${var.cluster_name}" = "owned"
    }
  )
}
