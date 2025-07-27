# variables.tf - Airbyte EKS Node Group Configuration Variables

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "airflow-staging"
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
  default     = "superset-spots"
}

variable "node_role_arn" {
  description = "ARN of the IAM role for EKS nodes"
  type        = string
  default     = "arn:aws:iam::651017398184:role/userguiding-new-sandbox-worker-role"
  # Consider using a more appropriately named role
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS node group"
  type        = list(string)
  default = [
    "subnet-01426f76185e7cce4",
    "subnet-0ecbe5208e0649964",
    "subnet-09f4dbecce5bc050b",
    "subnet-024ca3530def2247f",
    "subnet-0615ca4c224feeebe",
    "subnet-0b2fab1cf0331533f"
  ]
}

variable "disk_size" {
  description = "Disk size in GB for worker nodes"
  type        = number
  default     = 30
}

variable "instance_types" {
  description = "List of instance types for worker nodes"
  type        = list(string)
  default     = ["c4.xlarge", "c5.xlarge", "c5a.xlarge"]
}

variable "kubernetes_version" {
  description = "Kubernetes version for the EKS node group"
  type        = string
  default     = "1.32"
}

variable "scaling_config" {
  description = "Node group scaling configuration"
  type = object({
    desired_size = number
    min_size     = number
    max_size     = number
  })
  default = {
    desired_size = 1
    min_size     = 1
    max_size     = 5
  }
}
