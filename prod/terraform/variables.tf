# variables.tf - Airbyte EKS Node Group Configuration Variables

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "airflow-prod-cluster"
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
  default     = "superset-on_demand"
}

variable "node_role_arn" {
  description = "ARN of the IAM role for EKS nodes"
  type        = string
  default     = "arn:aws:iam::728785663016:role/airflow-prod-worker-role"
  # Consider using a more appropriately named role
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS node group"
  type        = list(string)
  default = [
    "subnet-0b85d9141e82e0c24",
    "subnet-037fc763d18fdfcda",
    "subnet-0dce9603136bb5be6"
  ]
}

variable "disk_size" {
  description = "Disk size in GB for worker nodes"
  type        = number
  default     = 100
}

variable "instance_types" {
  description = "List of instance types for worker nodes"
  type        = list(string)
  default     = ["c7a.xlarge"]
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
