module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = var.cluster_name
  kubernetes_version = "1.35"

  endpoint_public_access = true

  authentication_mode                      = "API_AND_CONFIG_MAP"
  enable_cluster_creator_admin_permissions = true

iam_role_additional_policies = {
  AmazonEKSBlockStoragePolicyV2 = "arn:aws:iam::aws:policy/AmazonEKSBlockStoragePolicyV2"
}
addons = {
  coredns = {
    most_recent = true
  }

  kube-proxy = {
    most_recent = true
  }

  vpc-cni = {
    most_recent    = true
    before_compute = true
  }
}
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    general = {
      instance_types = ["t3.medium"]

      min_size     = 1
      max_size     = 2
      desired_size = 1

      capacity_type = "ON_DEMAND"
    }
  }


  // EKS auto mode change 1 for eks auto mode 
  // EKS supports compute_config for Auto Mode which supports the built-in NodePools


  compute_config = {
  enabled = true

  node_pools = [
    "system",
    "general-purpose"
  ]
}
}