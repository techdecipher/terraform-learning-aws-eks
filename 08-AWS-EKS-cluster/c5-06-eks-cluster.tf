#EKS cluster

resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn
  version = var.cluster_version

  // Specify the VPC configuration for the EKS cluster
  // provide subnet id, we are going to create this eks custer in public subnet in or vpc
  // so we need to provide the public subnet id in the vpc_config block which is basically in vpc-outqputs.tf file 
  // we have created the output for public subnet id and private subnet id
  vpc_config {
    subnet_ids = module.vpc.public_subnets
    endpoint_private_access = var.cluster_endpoint_private_access
    endpoint_public_access = var.cluster_endpoint_public_access
    public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  }

  // optionally, you can specify the Kubernetes network configuration for the EKS cluster
  kubernetes_network_config {
    service_ipv4_cidr = var.cluster_service_ipv4_cidr
  }

  //Enable cluster logging for EKS cluster
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy_attachment,
    aws_iam_role_policy_attachment.eks_vpc_resource_controller_policy_attachment
  ]
}