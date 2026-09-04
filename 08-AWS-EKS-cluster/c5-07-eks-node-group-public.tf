#EKS node group public
resource "aws_eks_node_group" "eks_node_group_public" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.cluster_name}-public-node-group"
  node_role_arn   = aws_iam_role.eks_node_group_role.arn
  subnet_ids      = module.vpc.public_subnets
  
  ami_type = "AL2023_x86_64_STANDARD"
  capacity_type = "ON_DEMAND"
  disk_size = 20
  instance_types = ["t3.medium"]

  remote_access {
    ec2_ssh_key = "terraform-common-key"
  }

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }
  update_config {
    max_unavailable = 1
  }

  depends_on = [ 
  aws_iam_role_policy_attachment.eks_worker_node_policy_attachment,
  aws_iam_role_policy_attachment.eks_cni_policy_attachment,
  aws_iam_role_policy_attachment.ec2_container_registry_read_only_policy_attachment ]

  tags = {
    Name = "${var.cluster_name}-public-node-group"
  }
}