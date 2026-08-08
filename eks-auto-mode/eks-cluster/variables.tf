variable "aws_region" {
  description = "AWS region used for the EKS lab"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "eks-classic"
}