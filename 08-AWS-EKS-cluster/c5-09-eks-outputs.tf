# EKS cluster ouputs we can reference to next terraform resource
output "cluster_id" {
  description = "EKS cluster ID"
  value       = aws_eks_cluster.eks_cluster.id
}

output "cluster_arn" {
  description = "EKS cluster ARN"
  value       = aws_eks_cluster.eks_cluster.arn
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_certificate_authority_data" {
  description = "EKS cluster certificate authority data"
  value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "cluster_security_group_id" {
  description = "EKS cluster security group ID"
  value       = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
}

output "cluster_version" {
  description = "EKS cluster version"
  value       = aws_eks_cluster.eks_cluster.version
}

output "cluster_iam_role_arn" {
  description = "EKS cluster IAM role ARN"
  value       = aws_iam_role.eks_cluster_role.arn
}

output "cluster_iam_role_name" {
  description = "EKS cluster IAM role name"
  value       = aws_iam_role.eks_cluster_role.name
}

output "cluster_oidc_issuer" {
  description = "EKS cluster OIDC issuer URL"
  value       = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

output "cluster_primary_security_group_id" {
  description = "EKS cluster primary security group ID"
  value       = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
}

// node group public outputs

output "node_group_public_id" {
  description = "EKS public node group ID"
  value       = aws_eks_node_group.eks_node_group_public.id
}

output "node_group_public_arn" {
  description = "EKS public node group ARN"
  value       = aws_eks_node_group.eks_node_group_public.arn
}

output "node_group_public_status" {
  description = "EKS public node group status"
  value       = aws_eks_node_group.eks_node_group_public.status
}

output "node_group_version" {
  description = "EKS public node group version"
  value       = aws_eks_node_group.eks_node_group_public.version
}

// node group private outputs

output "node_group_private_id" {
  description = "EKS private node group ID"
  value       = aws_eks_node_group.eks_node_group_private.id
}

output "node_group_private_arn" {
  description = "EKS private node group ARN"
  value       = aws_eks_node_group.eks_node_group_private.arn
}

output "node_group_private_status" {
  description = "EKS private node group status"
  value       = aws_eks_node_group.eks_node_group_private.status
}

output "node_group_private_version" {
  description = "EKS private node group version"
  value       = aws_eks_node_group.eks_node_group_private.version
}
