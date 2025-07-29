# outputs.tf - Airbyte EKS Node Group Outputs

output "node_group_arn" {
  description = "ARN of the EKS node group"
  value       = aws_eks_node_group.airbyte_on_demand.arn
}

output "node_group_status" {
  description = "Status of the EKS node group"
  value       = aws_eks_node_group.airbyte_on_demand.status
}

output "node_group_resources" {
  description = "Resources associated with the EKS node group"
  value       = aws_eks_node_group.airbyte_on_demand.resources
}

output "node_group_scaling_config" {
  description = "Scaling configuration of the EKS node group"
  value       = aws_eks_node_group.airbyte_on_demand.scaling_config
}
